# 2do Parcial 1er Cuatrimestre 2025

## Ejercicio 1

- Queremos una syscall `malloco` que permite a las tareas reservar memoria de forma dinámica.
- Esta syscall recibe como parametro una cantidad de memoria a reservar en bytes.
- Devolverá la direccion virtual a partir de la cual se reservo la memoria.
- Si no hay suficiente memoria disponible, la syscall devolverá `NULL`.
- Como máximo cada tarea piede tener asigando hasta 4 MB.
- Si supera el máximo devolvera `NULL`. 

### Pasos para crear la syscall
1. **Registrar la syscall en la funcion** `idt_init()` **en el archivo** `idt.c`.

   ```c
   IDT_ENTRY3(99);
   ```

   Asi que cuando se cargue la _IDT_ usando `lidt[IDT_DESC]` en `kernel.asm`, vamos a tener la syscall a disposición.
2) **Ahora hay que programar la rutina de aterncion de la syscall**
   ````x86asm
   global isr_99
   _isr99:
        pushad

        ; Elijo que me pasen el parametro por el registro eax
        push eax        ; Paso el parametro a la funcion en C
        call malloco
        add esp, 4      ; Restauro la pila
        ; Reescribo el registro eax ya que 
        ; al hacer el popad me borra lo que tengo en el registro eax
        ; pq se restaura el eax que esta en la pila
        mov [esp + offset_EAX], eax 
        
        popad
        iret
   ````
3) **Ahora tengo que hacer la estructura donde se guardara la informacion de las reservas de memoria** 
Tengo que modificar la estructura de las entradas del scheduler para guardar cuantas paginas tiene reservadas cada tarea con el objetivo de controlar la cantidad de memoria que reservó y ver que no se excedio del limite.

    ````c
    typedef struct{
        int16_t selector;
        task_state_t state;
        int16_t pages;  // Cantidad de paginas de 4K que tiene la tarea
    } sched_entry_t;
    ````
    Como estructura de datos voy a hacer un array de tamaño `MAX_TASK`.
    Donde cada tarea tendra una estructura con toda la informacion de sus pedidos de memoria.
    La estructura sera la siguiente:

    ````c
    typedef struct{
        vaddr_t virt;   // Direccion donde empieza la memoria reservada
        int16_t cantPaginas;   // Cantidad de paginas de 4k reservadas
        int8_t chau;           // Marca para ver si esta para liberacion
    } reserva_t;

    typedef struct {
        int8_t id_tarea;        // ID de la tarea
        reserva_t* reservas;  // Puntero al array de reservas de la tarea
        int16_t reservas_size;  // Cantidad de elementos del array 
    } reservas_por_tareas_t;

    // Defino el array de tamaño MAX_TASK, donde cada tarea
    // tendra la informacion de sus pedidos de memoria.
    reservas_por_tarea_t* reservas_por_tarea[MAX_TASK];   
    ````
4) **Ahora defino la funcion malloco**

    ````c
    #define VIRT_RESERVABLE 0XA10C0000

    void* malloco(size_t size){
        // La variable current_task tiene 
        // el id de la tarea que llamó a la syscall

        // Primero tengo que verificar si la tarea que llamó a la
        // syscall tiene memoria disponible para reservar,
        // es decir si no supera los 4MB de memoria reservada

        // Obtengo la cantidad de paginas reservas actualmente
        uint16_t task_pages = sched_tasks[current_task].pages;
        // Si tiene mas de 1024 paginas de 4K = 4MB, retorno NULL
        // El size pasado por parametro es multiplo de 4K
        // 4K = 4096 bytes = tamaño de una pagina
        if ((task_pages + (size/4096)) > 1024) {
            return 0;
        }

        // Si estoy aca es que puede reservar memoria

        // Obtengo el nuevo indice para la reserva
        uint16_t indice_nueva_reserva = reservas_por_tarea[current_task].reservas_size;

        // Obtengo la direccion virtual de la memoria reservada
        // A la direccion base de memoria reservable le sumo 
        // el tamaño de las paginas reservadas por la tarea 
        vaddr_t virtual_reservada = VIRT_RESERVABLE + (task_pages * 1024);

        // Coloco la direccion de la nueva reserva en la estructura de reservas
        reservas_por_tarea[current_task].reservas[indice_nueva_reserva].virt = virtual_reservada;

        // Coloco la cantidad de paginas reservadas en la estructura de reservas
        reservas_por_tarea[current_task].reservas[indice_nueva_reserva].cantPaginas = size/4096;

        // Coloco la marca de liberacion en la estructura de reservas
        reservas_por_tarea[current_task].reservas[indice_nueva_reserva].chau = 0; // 0 indica que no esta para liberacion

        // Aumento la cantidad de paginas reservadas de la tarea
        sched_tasks[current_task].pages += size/4096;
        //Retorno la direccion virtual de la memoria reservada
        return (void*) (virtual_reservada);
    }
    ````

    5) **Ahora tengo que definir el acceso a memoria**
    > La memoria reservada por la syscall `malloco` se tenia que mapear una vez que la tarea intente acceder a ella.
    Por lo tanto, tengo que modificar el page_fault_handler
    ````c
        bool page_fault_handler(vaddr_t virt) {
            print("Atendiendo page fault...", 0, 0, C_FG_WHITE | C_BG_BLACK);
            // Chequeemos si el acceso fue dentro del área on-demand
            if (virt >= ON_DEMAND_MEM_START_VIRTUAL && virt <= ON_DEMAND_MEM_END_VIRTUAL) {
            // En caso de que sí, mapear la página
                mmu_map_page(rcr3(), virt, ON_DEMAND_MEM_START_PHYSICAL, MMU_P | MMU_W | MMU_U);
                return true;
            }

            // Tengo que verificar si la direccion virtual pertenece a una reserva de memoria por la tarea actual
            // Si no pertenece a una reserva de memoria, retorno false, saco a la tarea de ejecucion y libero la memoria
            uint16_t task_pages = sched_tasks[current_task].pages;
            if (virt >= VIRT_RESERVABLE && virt <= (VIRT_RESERVABLE + (task_pages * 1024))) {
                if (reserva_valida(virt)) {
                    // Si la reserva es valida, mapeo la pagina
                    paddr_t phy = mmu_next_free_user_page();
                    mmu_map_page(rcr3(), virt, phy, MMU_P | MMU_W | MMU_U);
                    zero_page(phy);
                    return true;
                } else {
                    // Si la reserva no es valida, libero la memoria y saco a la tarea de ejecucion
                    sched_disable_task(current_task);
                    liberar_memoria(virt);
                    return false;
                }
            }

            return false;
        }
    ````
    6) **Ahora defino las funciones auxiliares**
    ````c
        bool reserva_valida(vaddr_t virt) {
            // Verifico si la direccion virtual pertenece a una reserva de memoria
            for (int i = 0; i < reservas_por_tarea[current_task].reservas_size; i++) {
                if (reservas_por_tarea[current_task].reservas[i].virt == virt) {
                    return true;
                }
            }
            return false;
        }

        void liberar_memoria(vaddr_t virt) {
            // Recorro las reservas de memoria de la tarea actual
            for (int i = 0; i < reservas_por_tarea[current_task].reservas_size; i++) {
                reservas_por_tarea[current_task].reservas[i].chau = 1; // 1 indica que esta para liberacion
            }
        }
    ````
---
## Ejercicio 2

Ahora tengo que implementar la syscall `chau` que permite a las tareas marcar como para liberar memoria reservada por la syscall `malloco`.
### Pasos para crear la syscall `chau`
1)  **Registrar la syscall en la funcion** `idt_init()` **en el archivo** `idt.c`.
   ```c
   IDT_ENTRY3(100);
   ```
2) **Ahora hay que programar la rutina de aterncion de la syscall**
   ````x86asm
   global isr_100
   _isr100:
        pushad

        ; Elijo que me pasen el parametro por el registro eax
        push eax        ; Paso el parametro a la funcion en C
        call chau
        add esp, 4      ; Restauro la pila
        
        popad
        iret
   ````
3) **Ahora tengo que programar la syscall chau**
   ````c
   void chau(void* ptr) {
       vaddr_t virt = (vaddr_t) ptr;
       for (int i = 0; i < reservas_por_tarea[current_task].reservas_size; i++) {
            if (reservas_por_tarea[current_task].reservas[i].virt == virt) {
                // Si encuentro la reserva, la marco para liberacion
                reservas_por_tarea[current_task].reservas[i].chau = 1; // 1 indica que esta para liberacion
                break;
            }
        }
   }
   ````
4) **Ahora tengo que definir la funcion del garbage collector**
   ````c
   void garbage_collector(void) {
       for (int i = 0; i < MAX_TASK; i++) {
           if (reservas_por_tarea[i] != NULL) {
               for (int j = 0; j < reservas_por_tarea[i].reservas_size; j++) {
                   if (reservas_por_tarea[i].reservas[j].chau == 1) {
                       
                       uint32_t cr3 = obtener_cr3(i);

                       for (int k = 0; k < reservas_por_tarea[i].reservas[j].cantPaginas; k++) {
                           // Desmapeo las paginas reservadas
                           mmu_unmap_page(cr3, reservas_por_tarea[i].reservas[j].virt + (k * 4096));
                       }
                       // Elimino la reserva de la lista
                       reservas_por_tarea[i].reservas[j].chau = 0; // Reseteo la marca de liberacion
                       reservas_por_tarea[i].reservas[j].virt = 0; // Reseteo la direccion virtual
                       reservas_por_tarea[i].reservas[j].cantPaginas = 0; // Reseteo la cantidad de paginas
                   }
               }
           }
       }
   }
   ````
5) **Ahora tengo que hacer que esta funcion sea una tarea de nivel 0, y ponerla en la gdt**
6) **Ahora tengo que hacer que el clock llame a la tarea del garbage collector cada 100 ticks**
   ````c
    uint32_t ticks_amount(){
        uint32_t res = (ENVIRONMENT->ticks_count % 100);
        return res;
    }
   ````
   ````x86asm
    global _isr32
    ; COMPLETAR: Implementar la rutina
    _isr32:
        pushad
        ; 1. Le decimos al PIC que vamos a atender la interrupción
        call pic_finish1
        call next_clock

        call ticks_amount
        cmp ax, 0
        jne .noCien

        mov word [sched_task_selector], sched_gc_selector
        
        jmp far [sched_gc_offset]

        .noCien:
        ; 2. Realizamos el cambio de tareas en caso de ser necesario
        call sched_next_task
        cmp ax, 0
        je .fin

        str bx
        cmp ax, bx
        je .fin

        mov word [sched_task_selector], ax
        jmp far [sched_task_offset]

        .fin:
        ; 3. Actualizamos las estructuras compartidas ante el tick del reloj
        call tasks_tick
        ; 4. Actualizamos la "interfaz" del sistema en pantalla
        call tasks_screen_update
        popad
        iret
   ````