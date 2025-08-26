
## 2024C2P2:

### Ejercicio 1:

a) Queremos mapear la dirección virtual 0xBABAB000 a la dirección física 0xF151C000. 
         
        
        void buffer_dam(pd_entry_t* pd){
            pt_entry_t* pageTableTarea = pd->pt << 12; 
            //nos da la dirección de page table de la tarea.
            
            pt_entry_t tableEntry = pageTableTarea[VIRT_PAGE_DIR((v_addr_t) 0xBABAB000)];
            //es la table entry de la tarea.
            
            tableEntry->page = MMU_ENTRY_PADDR(0xF151C000); 
            //asi ya mapeamos la página de la dirección virtual a la física del buffer de video.
            
            
            tableEntry->attrs = MMU_P; 
            //Solo queremos que sea de kernel (porque es de tareas) y read-only, así solo el cartucho la modifica.

            tlb_flush();
            //Necesario porque modificamos la estructura de paginación.
        }
b) Dado page directory de tarea realice una copia del buffer a la dirección pasada por parámetro y también realice el mapeo correspondiente.

    Queremos copiar el contenido de una dirección física (la del buffer) a otra. Para eso primero tenemos que mapearlas a una virtual, ya que al tener paginación todas las direcciones se interpretan como virtuales, por lo que operar directamente con las físicas no dará resultado.
    Como ya nos dan el page directory podemos hacer algo similar a la del a)
    Idea: 
        mapeamos la dirección física phys a una virtual (0xBABAB000), dst.
        mapeamos la dirección física del buffer de video a otra virtual, src.

        hacemos un for(int i = 0; i < PAGE_SIZE; i++){
            dst[i] = src[i];
        }



        void buffer_copy(pd_entry_t* pd, paddr_t phys){
            pt_entry_t* pageTableTarea = pd->pt << 12; 
            //nos da la dirección de page table de la tarea.
            
            pt_entry_t tableEntry = pageTableTarea[VIRT_PAGE_DIR((v_addr_t) 0xBABAB000)];
            //es la table entry de la tarea.
            
            tableEntry->page = MMU_ENTRY_PADDR(phys); 
            //asi ya mapeamos la página de la dirección virtual a la física.
            tableEntry->attrs = MMU_W|MMU_P; porque la queremos poder escribir.

            //ahora mapeo la direccion del buffer de video a una virtual. Para eso puedo usar las mismas que usamos en copy_page ya que cuando esta se ejecuta, al terminar, las desmapea. Como no necesito un page directory particular uso el actual y así llamo a mmu_map_page

            mmu_map_page(rcr3(), SRC_VIRT_PAGE, (paddr_t)(0xF151000), MMU_P); //solo present, no la quiero poder escribir.

            //ahora hago el for
            (uint32_t*) dst = 0xBABAB000; Las casteo a uint32_t para escribir copiar de a 4 bytes y al hacerlo 1024 veces copia 4096 bytes = 4kb = la pagina del buffer.
            (uint32_t*) src = SRC_VIRT_PAGE;
            for(int i = 0; i < PAGE_SIZE; i++){
            dst[i] = src[i];
            }

            //Luego debo desmapear la del buffer así no genero problemas con copy_page ni futuros llamados a esta función actual
            mmu_unmap_page(rcr3(), SRC_VIRT_PAGE);
        }

## Ejercicio 2:

>Cada tarea guarda en la dirección virtual 0xACCE50 (mapeada como r/w para la tarea) un uint8_t acceso con posibles valores 0, 1 y 2. El valor 0 indica que la tarea no accederá al buffer de video, 1 que accederá mediante DMA y 2 que accederá por copia. De acceder por copia, la dirección virtual donde realizar la copia estará dada por el valor del registro ecx al momento de llamar a opendevice.

Entonces cuando buffer se llena se dispara interrupción isr40, la rutina de atención del kernel debe acceder a la dirección virtual 0xACCE50 y leer el valor. 
- Si el valor es 0 → salto a salida de interrupción.
- Si el valor es 1 → mapear buffer video a tarea
- Si el valor es 2 → actualizo copia buffer video de tarea

> Cada vez que se indique como completo el buffer, se deberá mappear el mismo a las tareas que utilicen DMA y hayan solicitado acceso al buffer, o actualizar la copia del buffer de las tareas que acceden por copia y hayan solicitado acceso al buffer.

Entonces el funcionamiento es el siguiente:
Una tarea puede realizar la syscall opendevice() para acceder al buffer de video. Schedule las pone en pausa hasta que el buffer esté listo. Cuando el buffer está listo hace el mapeo o actualiza la copia de la tarea según corresponda y reanuda ejecución.
Que el buffer esté listo significa que saltó la isr40, entonces en la isr40 tengo que realizar el mapeo/copia del buffer a las tareas que hicieron syscall opendevice.
Idea: 
Como cada tarea guarda en la dirección virtual 0xACCE50 debo iterar por ellas y por cada una realizar la copia/mapeo. 

device ready:
por cada tarea
    si 0xACCE50 == 1 -> buffer_dma(cr3_to_page_dir(rcr3())); mapeo buffer video como read-only a la dirección virtual del buffer video para tareas pero usando el cr3 actual así uso directorio de páginas de tarea actual.

    si 0xACCE50 == 2 -> buffer_copy(cr3_to_page_dir(rcr3()), ecx)

    si 0xACCE50 == 0 -> nada

¿Cómo hago para hacerlo con todas las tareas? No deshabilito el pic y salto a la próxima tarea llevándome un indice y recien cuando indice = MAX_TASKS lo deshabilito?

opendevice debe poner en pausa por device a la tarea

scheduler con tarea en pausa por device la ignora. Solo la vuelve a ejecutar cuando pasa a runnable otra vez, y para eso tiene funcion task updated by device que le cambia el estado y la llama el isr40 al terminar su rutina

-scheduler podría tener variable global que diga 1 si device ready y 0 sino. Desde rutina isr40 solo me encargo de activarlo cuando está ready y desactivarlo después de MAX_TASKS tics. 
-en sched_next_task agrego un if adentro del for que sea if device ready y tarea pausada esperandolo hago lo de arriba i .e.:

uint16_t sched_next_task(void){
    
    ...
    
    uint8_t* acceso = 0xACCE50;
    if (*acceso == 1){
        buffer_dma(cr3_to_page_dir(rcr3()));
    }
    else if (*acceso == 2){
        buffer_copy(cr3_to_page_dir(rcr3()), ecx)   
    }

    ...
}

Para poder utilizar el ecx tengo las siguientes ideas:
    1) Agregar un campo al struct sched_entry_t que lo guarde y sea seteado en el momento en que se maneja la syscall open device
    2) Al igual que se definió que el tipo de acceso estuviera en la dirección virtual 0xACCE50 puedo definirlo desde 0xACCE5 + 1byte hasta 0xACCE50 + 5 bytes y modificar la función así:
        else if (*acceso == 2){
        vaddr_t *dirToCopy = 0xACCE51;  
        buffer_copy(cr3_to_page_dir(rcr3()), *dirToCopy);   
    }

así isr40 queda.
__isr40:
    pushad 

    call inform_device_ready
    
    popad
    iret

en sched.c: 
/* variables globales */
bool deviceReady = false;
uint8_t deviceWindowTime = MAX_TASKS;

/* agrego a sched_next_task */
uint16_t sched_next_task(void){
    
    ...
    
    uint8_t* acceso = 0xACCE50;
    if (*acceso == 1 && deviceWindowTime > 0){
        buffer_dma(cr3_to_page_dir(rcr3()));
    }
    else if (*acceso == 2 && deviceWindowTime > 0){
        buffer_copy(cr3_to_page_dir(rcr3()), ecx)   
    }
    if (deviceWindowTime == 0){
        deviceReady = false;
    }
    deviceWindowTime--; //Así sé cuando debo desactivar el deviceReady

    ...
}

/* agrego inform_device_ready() en sched.c*/

void inform_device_ready(){
    deviceReady = true;
    deviceWindowTime = MAX_TASKS;
}


b) 

/* open device */
isr_90:
    pushad
    
    ;cargo el ecx para que sched lo pueda encontrar
    mov eax, 0xACCE51
    mov [eax], ecx

    call mark_task_as_waiting_for_device ;funcion que agrego en sched.c

    popad 
    iret

/* close device */ 
isr_89:
    pushad
    
    call unmark_task_as_waiting_for_device ;funcion que agrego en sched.c

    popad 
    iret

también debo agregar en sched.c que si una tarea está en waiting_for_device_update no se mande a ejecución


## 2024c2r2

Idea general: Poder intercambiar todos los registros de propósito general-{EBP, ESP, EIP} entre dos tareas a nivel usuario.

Requerimientos: 
- Tarea llama a swap con id tarea con la que intercambiar registros.
- Si destino también llamó a *swap* con id de la actual → se hace el intercambio de registros.

### Ejercicio 1: 

a) syscall swap que intercambie registros con la otra, pero solo puede continuar ejecución una vez ya fueron intercambiados los registros.

IDEA: Los registros de propósito general de la tarea a la que quiero copiar están en su entrada de TSS, pero en su estado al momento del jmp far del _isr32. Necesito los que eran de la tarea en su ejecución y no los que dejó el handler. Por como definimos el handler _isr32 en el TP lo primero que hace es un `pushad`así que tiene en su pila los registros de propósito general con el valor que los tenía la tarea. Necesito acceder a la pila de nivel kernel, porque ese `pushad` lo hice en el handler de una interrupción en nivel de kernel. 

Busco el esp de la TSS de la tarea destino.

    ; PushAD Order
    %define offset_EAX 28
    %define offset_ECX 24
    %define offset_EDX 20
    %define offset_EBX 16
    %define offset_ESP 12
    %define offset_EBP 8
    %define offset_ESI 4 
    %define offset_EDI 0 <-- esp tarea a copiar al momento jmp far

Los valores que quiero traer son: 
- edi = pila[0]
- esi = pila[1]
- ebx = pila[4]
- edx = pila[5]
- ecx = pila[6]
- eax = pila[7]
siendo pila = un puntero al esp. 

Pero también le quiero poner los valores de mis registros. Podría pasarlos como parámetro para la función de C swap.

¿Cómo sé si una tarea quiso hacer swap con actual antes?
    Podría tener un arreglo de tamaño |tasks|. En entrada i tengo -1 si ninguna tarea quiso hacer swap con el y si alguna quiso->el indice de esa tarea. El problema es si varias quisieron hacer swap con una. 

    Si tengo una matriz |tasks| x |tasks| tal que en posición i,j tengo 1 si la tarea i quiso intercambiar con la tarea j.

    Al momento de la syscall tengo que ver si una quiso hacer swap conmigo, es decir ver columna de tarea actual y por cada una con un 1 hacer el swap

    esa matriz la puedo poner como global en sched.c

Para que sea bloqueante necesito pausar la tarea que llama a la syscall swap. Para eso puedo cambiarle su estado de sched.c a paused.

    
    
    uint8_t can_swap_and_update_swaps_table(uint8_t idTareaParaSwapear){
        //chequear si tarea destino tiene swap a esta tarea
        if (swapsTable[idTareaParaSwapear][current_task] == 1){
            //si lo tiene entonces hago swapeo
                return 1;
            }
        //marco que quise hacer swap con tarea destino
        swapsTable[current_task][idTareaParaSwapear] = 1;
        return 0;
    }
    
    
    
    
    uint32_t* swap(uint8_t idTareaParaSwapear, 
                   uint32_t edi,
                   uint32_t esi,
                   uint32_t ebx,
                   uint32_t edx,
                   uint32_t ecx,
                   uint32_t eax){
        
            void sched_disable_task(current_task);//pausar current task para que sea bloqueante 
            
            //obtener tss de tarea destino
            tss* tss_tarea = obtener_tss_por_taskId(idTareaParaSwapear);
            


            uint32_t ediParaCopiarme = tss_tarea->edi ;
            uint32_t esiParaCopiarme = tss_tarea->esi ;
            uint32_t ebxParaCopiarme = tss_tarea->ebx ;
            uint32_t edxParaCopiarme = tss_tarea->edx ;
            uint32_t ecxParaCopiarme = tss_tarea->ecx ;
            uint32_t eaxParaCopiarme = tss_tarea->eax ;

            //asigno los valores de mis registros a los de la tss de la tarea así cuando se ejecute use esos.
            tss_tarea->edi = edi;
            tss_tarea->esi = esi;
            tss_tarea->ebx = ebx;
            tss_tarea->edx = edx;
            tss_tarea->ecx = ecx;
            tss_tarea->eax = eax;

            //Para poder poner los valores de los registros de la otra con la que swapeo en los míos necesito estar en ASM. Necesito pero solo tengo para retornar valores a eax. Podría crear un arreglo en una página compartida de 4*6(6 son los registros que me quiero copiar) con sus valores, retornar en eax un puntero a ese arreglo y desde ASM ir recorriendolo y guardandome los valores.

            uint32_t *valores = malloc(4*6);
            valores[0] = ediParaCopiarme;
            valores[1] = esiParaCopiarme;
            valores[2] = ebxParaCopiarme;
            valores[3] = edxParaCopiarme;
            valores[4] = ecxParaCopiarme;
            valores[5] = eaxParaCopiarme;            

            call sched_enable_task(current_task);

            return valores;
        }



    //Para obtener la tss necesito su descriptor en la gdt. 
    obtener_tss_por_taskId(uint8_t taskId){
    uint16_t GDTdescriptorIndex = taskId << 3;
    tss* tss_tarea = (gdt[GDTdescriptorIndex].base);
    return tss_tarea; 
    }





Paso 1: 
Agrego una IDTENTRY3(99) para esta syscall en idt.c

Paso 2: 
Defino en isr.asm un handler para esta interrupción.

    /*Recibo en edi el id de la tarea con la que quiero swapear */
    isr_99:
        pushad
        push edi
        call can_swap_and_update_swaps_table
        add esp, 4
        cmp eax, 0 ;Veo si puedo hacer swap. Si es 0 no puedo
        je salir

        ;Me traigo los valores que metí con el pushad en mi pila
        mov [esp], edi
        mov [esp+4], esi
        mov [esp+16], ebx
        mov [esp+20], edx
        mov [esp+24], ecx
        mov [esp+28], eax



        ;se los paso a swap
        push eax
        push ecx
        push edx
        push ebx
        push esi
        push edi
        push r9d
        call swap
        add  esp, 28 ;reestablezco pila
        ;me copio los valores del arreglo a mis registros porque no puedo hacer mov entre dos accesos a memoria con []
        mov ecx,[eax + 16]
        mov edx,[eax + 12]
        mov ebx,[eax + 8]
        mov esi,[eax + 4]
        mov edi,[eax]

        mov r8d, eax
        mov eax,[eax + 20]
        
        ;libero el buffer
        push r8d
        call free
        add esp, 4

        ;actualizo los valores que tenía en mi pila por pushad y que voy a retornar en popad
        mov [esp], edi
        mov [esp+4], esi
        mov [esp+16], ebx
        mov [esp+20], edx
        mov [esp+24], ecx
        mov [esp+28], eax

        

        salir:
        popad
        iret

Para hacer la no bloqueante tengo que sacar la llamada a sched_disable_task. 
Modificar la función sched_next_task tal que tras dar toda la vuelta i.e. si el indice = current_task borremos la 
