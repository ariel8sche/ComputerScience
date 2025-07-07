# Recuperatorio 2do Parcial del 2do Cuatrimestre 2024

## Ejercicio 1

- El buffer de video se encuentra en la direccion fisica `0xF1510000`
- Se tiene que poder escribir en el buffer de video a traves de los sigueintes mecanismos:
  - DMA (Direct Memory Access) - se mapea la direccion virutal `0xBABAB000` del espacio de direcciones de la tarea directamente al buffer de video.
  - Por copia - se realiza una copia del buffer en una pagina fisica especifica y se mapea en la direccion virtual pasada. Cada tarea debe tener una unica copia.

1. Debo programar la función `void buffer_dma(pd_entry* pd)` que dado el page directory de una tarea realice el mapeo del buffer en modo DMA.
   ```c
   void buffer_dma(pd_entry* pd) {
       mmu_map_page(pd, (vaddr_t) 0xBABAB000, (paddr_t) 0xF1510000, MMU_P | MMU_U);
   }
   ```
2. Debo programar la función `void buffer_copy(pd_entry* pd, vaddr_t phy, vaddr_t virt)` que dado el page directory de una tarea y una direccion virtual, realice el mapeo del buffer en modo copia.
   ```c
   void buffer_copy(pd_entry* pd, vaddr_t phy, vaddr_t virt) {
       copy_page((paddr_t) 0xF1510000, (paddr_t) phy);
       mmu_map_page(pd, virt, phy, MMU_P | MMU_U);
   }
   ```

## Ejercicio 2

Cada tarea guarda en la direccion virutal `0xACCE50` que esta mapeada como (r/w) un uint8_t que indica:

- 0 no accedera al buffer de video
- 1 accedera al buffer de video en modo DMA
- 2 accedera al buffer de video en modo copia y la direccion virtual donde realizar la copia esta en ECX al momento de la llamada a la funcion `opendevice`.

> Cuando se completa el buffer, el lector avisa mediante la interrupcion externa IRQ 40

1. **Debo definir la interrupcion en la funcion `idt_init()` en el archivo `idt.c`**
   ```c
   IDT_ENTRY0(40);
   ```
2. **Debo definir la rutina de atencion de la interrupcion**

   ```x86asm
   global _isr40
   _isr40:
       pushad
       call pic_finish1

       call deviceready

       popad
       iret
   ```

   ```c
   void deviceready() {
       for (uint8_t task_id; task_id < MAX_TASKS; task_id++) {

           // Como cada tarea tiene un uint8_t en la direccion 0xACCE50
           // Tengo que leer el valor de esa direccion, pero cada tarea tiene su propio espacio de direcciones.
           // Entonces tengo que obtener la pagina fisica de la tarea.
           // Mapearla temporalmente y leer el valor.

           // Tengo que obtener el acceso
           uint32_t cr3 = tss_tasks[task_id].cr3; 
           uint8_t access_mode = *(uint8_t*)0xACCE50 = obtener_acceso(task_id);

            // Reviso solo los que acceden al buffer de video
           if (task_opendevice(tasks[task_id]) == 1) {
               if (access_mode == 1) {
                   buffer_dma(cr3);
               } else if (access_mode == 2) {
                   //Tengo que hacer la copia
               }
           }
       }
   }
   ```

   **Funciones Auxiliares**

    ```c
    uint8_t obtener_acceso(uint8_t task_id) {
        uint32_t cr3_tarea = tss_tasks[task_id].cr3;

        // Obtener dirección física mapeada a VIRT_DIR en esa tarea
        paddr_t phy = obtener_direccion_fisica(cr3_tarea, 0xACCE50);

        if (phy == 0) return 0xFF;  // no mapeado → error/sin valor

        // Mapear esa dirección física en el espacio del kernel
        mmu_map_page(rcr3(), KERNEL_TEMP, phy, MMU_P | MMU_W | MMU_U);

        // Leer el byte en el offset correspondiente
        uint32_t offset = VIRT_DIR & 0xFFF;
        uint8_t value = *(uint8_t*)(KERNEL_TEMP + offset);

        // Limpiar
        mmu_unmap_page(rcr3(), KERNEL_TEMP);
        tlbflush();

        return value;
    }

    uint32_t obtenerDireccionFisica(uint32_t cr3_tarea_a_espiar, uint32_t direccion_virtual) {
        pd_entry_t* pd = (pd_entry_t*) CR3_TO_PAGE_DIR(cr3_tarea_a_espiar);
        int pdi = VIRT_PAGE_DIR(direccion_virtual);

        // Verificamos si la entrada del Page Directory está presente
        if (!(pd[pdi].attrs & MMU_P)) return 0;

        pt_entry_t* pt = (pt_entry_t*) MMU_ENTRY_PADDR(pd[pdi].pt);
        int pti = VIRT_PAGE_TABLE(direccion_virtual);

        // Verificamos si la entrada del Page Table está presente
        if (!(pt[pti].attrs & MMU_P)) return 0;

        // Dirección física base de la página
        paddr_t base_fisica = MMU_ENTRY_PADDR(pt[pti].page);

        // Le sumamos el offset dentro de la página
        return base_fisica | (direccion_virtual & 0xFFF);
    }
    ```
