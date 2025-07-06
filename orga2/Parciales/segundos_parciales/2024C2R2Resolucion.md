# Recuperatorio 2do Parcial 2do Cuatrimestre 2024

## Ejercicio 1

### Pasos para programar una syscall

1. **Registrar la syscall en la funcion** `idt_init()` **en el archivo** `idt.c`.

   ```c
   idt_entry3(90);	// Para swap
   idt_entry3(91); 	// Para swap_now
   ```

   Asi que cuando se cargue la _IDT_ usando `lidt[IDT_DESC]` en `kernel.asm`, vamos a tener la syscall a disposición.

2. **Ahora hay que hacer la rutina de atención para la syscall en el archivo** `isr.asm`

   ```nasm
   global isr_90

   _isr90:
       ; Decido que la syscall mande su parametro(id de la tarea)
       ; por el registro EAX
       push eax    ; pasamos el id de la tarea a la función de c
       call swap_handler
       pop eax
       iret
   ```

   ```nasm
   global isr_91

   _isr91:
    ; Decido que la syscall mande su parametro(id de la tarea)
    ; por el registro EAX
    push eax    ; pasamos el id de la tarea a la función de c
    call swap_now_handler
    pop eax
    iret
   ```

   > Como me tengo que guardar la informacion de quien quiere hacer swap con quien, voy a tener un array en la estructura de una entrada del scheduler.

   ```c
   typedef struct {
      int16_t selector;
      uint8_t swap_wanted[MAX_TASK]; //aca voy a guardar los task
      // que quieran hacer swap con esta tarea.
      task_state_t state;
   }
   ```

   Función de C que hara el trabajo de swappear los registros

   ```c
   void swap_handler(uint8_t task_id){
       // Debo guardar en la estructura de swapeo en el scheduler que
      // la current_task quiere hacer un swap con la tarea que pasa
      // por parametro.
       // Luego me tengo que fijar si la tarea que pasan por parametro
       // tambien quiere hacer swap.
       // Si  si entonces la pongo en puased, hago el swapeo y la marco
       // como runnable
       // Si no, en el scheduler tengo que marcarla como paused
       // y hasta que no se realizo el swapeo no lo pongo en runnable.
       if wantsSwapWithCurrentTask(task_id) {
           uint16_t gdt_idx_dst = sched_task[task_id].selector >> 3;
           tss_t* tss_dst = (tss_t*) get_gdt_base(&gdt[gdt_idx_dst]);

           uint16_t gdt_idx_src = sched_task[current_task].selector >> 3;
           tss_t* tss_src = (tss_t*) get_gdt_base(&gdt[gdt_idx_src]);

           swap_tss(tss_dst, tss_src);

           sched_task[current_task].swap_wanted[task_id] = 0;
           sched_enable_task(task_id);

       }
       sched_task[task_id].swap_wanted[current_task] = 1;
       sched_disable_task(current_task);
   }
   ```

   ```c
   void swap_now_handler(uint8_t task_id){
    // Debo guardar en la estructura de swapeo en el scheduler que
   // la current_task quiere hacer un swap con la tarea que pasa
   // por parametro.
    // Luego me tengo que fijar si la tarea que pasan por parametro
    // tambien quiere hacer swap.
    // Si  si entonces la pongo en puased, hago el swapeo y la marco
    // como runnable
    // Si no, en el scheduler tengo que marcarla como paused
    // y hasta que no se realizo el swapeo no lo pongo en runnable.
    if wantsSwapWithCurrentTask(task_id) {
        uint16_t gdt_idx_dst = sched_task[task_id].selector >> 3;
        tss_t* tss_dst = (tss_t*) get_gdt_base(&gdt[gdt_idx_dst]);

        uint16_t gdt_idx_src = sched_task[current_task].selector >> 3;
        tss_t* tss_src = (tss_t*) get_gdt_base(&gdt[gdt_idx_src]);

        swap_tss(tss_dst, tss_src);

        sched_task[current_task].swap_wanted[task_id] = 0;
        sched_enable_task(task_id);

    }
    sched_task[task_id].swap_wanted[current_task] = 1;
   }
   ```

   **Funciones Auxiliares**

   ```c
   bool wantsSwapWithCurrentTask(uint8_t task_id){
       return sched_task[current_task].swap_wanted[task_id] == 1
   }

   uint32_t get_gdt_base(gdt_entry_t *entry){
       return (entry->base_31_24 << 24) | (entry->base_23_16 << 16) | entry->base_15_0;
   }

   // Función auxiliar para intercambiar dos valores uint32_t
   void swap_uint32(uint32_t* a, uint32_t* b) {
       uint32_t temp = *a;
       *a = *b;
       *b = temp;
   }

   void swap_tss(tss_t* tss_dst, tss_t* tss_src){
       // Intercambiamos solo los registros de propósito general
       // EXCEPTO ESP, EIP y EBP

       swap_uint32(&tss_dst->eax, &tss_src->eax);
       swap_uint32(&tss_dst->ebx, &tss_src->ebx);
       swap_uint32(&tss_dst->ecx, &tss_src->ecx);
       swap_uint32(&tss_dst->edx, &tss_src->edx);
       swap_uint32(&tss_dst->esi, &tss_src->esi);
       swap_uint32(&tss_dst->edi, &tss_src->edi);

       // NO intercambiamos ESP, EIP, EBP ni registros de segmento ni eflags
   }
   ```

## Ejercicio 2

Ahora nos piden que cuando se realice el swap, se avise cambiando una variable de cada tarea que se encuentra en la direccion virtual 0xC000C0DE
Entonces tengo que modificar las funciones de swap y swap_now
   ```c
   void swap_handler(uint8_t task_id){
       // Debo guardar en la estructura de swapeo en el scheduler que
      // la current_task quiere hacer un swap con la tarea que pasa
      // por parametro.
       // Luego me tengo que fijar si la tarea que pasan por parametro
       // tambien quiere hacer swap.
       // Si  si entonces la pongo en puased, hago el swapeo y la marco
       // como runnable
       // Si no, en el scheduler tengo que marcarla como paused
       // y hasta que no se realizo el swapeo no lo pongo en runnable.
       if wantsSwapWithCurrentTask(task_id) {
           uint16_t gdt_idx_dst = sched_task[task_id].selector >> 3;
           tss_t* tss_dst = (tss_t*) get_gdt_base(&gdt[gdt_idx_dst]);

           uint16_t gdt_idx_src = sched_task[current_task].selector >> 3;
           tss_t* tss_src = (tss_t*) get_gdt_base(&gdt[gdt_idx_src]);

           swap_tss(tss_dst, tss_src);
		   update_swap_state(rcr3(), 1);	// Aviso a la current task
		   update_swap_state(tss_dst->cr3, 1)	// Aviso a la otra tarea

           sched_task[current_task].swap_wanted[task_id] = 0;
           sched_enable_task(task_id);

       }
	   uint16_t gdt_idx_dst = sched_task[task_id].selector >> 3;
       tss_t* tss_dst = (tss_t*) get_gdt_base(&gdt[gdt_idx_dst]);

	   update_swap_state(rcr3(), 0);	// Aviso a la current task
	   update_swap_state(tss_dst->cr3, 0)	// Aviso a la otra tarea

       sched_task[task_id].swap_wanted[current_task] = 1;
       sched_disable_task(current_task);
   }
   ```

   ```c
   void swap_now_handler(uint8_t task_id){
    // Debo guardar en la estructura de swapeo en el scheduler que
   // la current_task quiere hacer un swap con la tarea que pasa
   // por parametro.
    // Luego me tengo que fijar si la tarea que pasan por parametro
    // tambien quiere hacer swap.
    // Si  si entonces la pongo en puased, hago el swapeo y la marco
    // como runnable
    // Si no, en el scheduler tengo que marcarla como paused
    // y hasta que no se realizo el swapeo no lo pongo en runnable.
    if wantsSwapWithCurrentTask(task_id) {
        uint16_t gdt_idx_dst = sched_task[task_id].selector >> 3;
        tss_t* tss_dst = (tss_t*) get_gdt_base(&gdt[gdt_idx_dst]);

        uint16_t gdt_idx_src = sched_task[current_task].selector >> 3;
        tss_t* tss_src = (tss_t*) get_gdt_base(&gdt[gdt_idx_src]);

        swap_tss(tss_dst, tss_src);
		 update_swap_state(rcr3(), 1);	// Aviso a la current task
		 update_swap_state(tss_dst->cr3, 1)	// Aviso a la otra tarea

        sched_task[current_task].swap_wanted[task_id] = 0;
        sched_enable_task(task_id);

    }
	uint16_t gdt_idx_dst = sched_task[task_id].selector >> 3;
    tss_t* tss_dst = (tss_t*) get_gdt_base(&gdt[gdt_idx_dst]);

	update_swap_state(rcr3(), 0);	// Aviso a la current task
	update_swap_state(tss_dst->cr3, 0)	// Aviso a la otra tarea
    sched_task[task_id].swap_wanted[current_task] = 1;
   }
   ```
**Funciones Auxiliares**

```c
void update_swap_state(uint32_t cr3, uint8_t value) {
    pd_entry_t* pd = CR3_TO_PAGE_DIR(cr3);
    uint32_t pd_idx = VIRT_PAGE_DIR(SWAP_STATE_VADDR);
    uint32_t pt_idx = VIRT_PAGE_TABLE(SWAP_STATE_VADDR);
    uint32_t offset = VIRT_PAGE_OFFSET(SWAP_STATE_VADDR);

    // Asumimos que la dirección ya está mapeada en el pd de la tarea

    pd_entry_t pd_entry = pd[pd_idx];
    pt_entry_t* pt = (pt_entry_t*) MMU_ENTRY_PADDR(pd_entry);
    pt_entry_t pt_entry = pt[pt_idx];

    paddr_t phys_page = MMU_ENTRY_PADDR(pt_entry);
    uint8_t* swap_ptr = (uint8_t*)(phys_page + offset);

    *swap_ptr = value;
}
```