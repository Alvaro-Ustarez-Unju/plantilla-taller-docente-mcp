# 🎮 Cuestionario Quizizz / Wayground — Unidad 2: Administración de Memoria en Linux

> **Universidad Nacional de Jujuy (UNJu) — Facultad de Ingeniería**  
> **Cátedra:** Sistemas Operativos II — Ciclo Lectivo 2026  
> **Equipo Docente:** Ing. María Fernanda Vázquez (Titular) | Ing. Fabio Damián Argañaraz Azua (JTP)  
> **Uso:** Actividad interactiva en vivo (10-15 min) para la apertura de la **Clase 2 / TP 02**.

---

## 📋 Banco de Preguntas (Con distractores deliberadamente largos para neutralizar el sesgo de longitud)

---

### Pregunta 1 (30 segundos)
**En el espacio de direcciones virtuales de un proceso en Linux, ¿qué caracteriza al segmento BSS (*Block Started by Symbol*)?**

- [ ] A) Contiene el código fuente en lenguaje C compilado con opciones de optimización máxima `-O3` y se almacena en memoria Flash permanente.
- [x] **B) Almacena variables globales y estáticas no inicializadas, sin ocupar espacio físico en el ejecutable en disco.** ✅
- [ ] C) Es una partición oculta en el disco de intercambio que solo se activa durante el arranque del núcleo del sistema operativo para inicializar el demonio systemd.
- [ ] D) Es el segmento donde residen exclusivamente los punteros a funciones creados mediante la llamada al sistema `mmap()`.

> **💡 Explicación:** El segmento BSS reserva espacio para variables globales/estáticas que no tienen valor inicial. Linux no almacena ceros en el archivo binario ejecutable en disco para ahorrar espacio; el kernel simplemente asigna las páginas y las llena de ceros al momento de cargar el proceso en memoria (usando la *Zero Page*).

---

### Pregunta 2 (30 segundos)
**¿En qué se diferencian principalmente el *Heap* (Montículo) y el *Stack* (Pila) dentro del espacio de memoria de un proceso?**

- [ ] A) El Heap solo almacena variables booleanas de un solo byte gestionadas por el compilador, mientras que el Stack se utiliza para transferencias directas de red mediante sockets TCP.
- [x] **B) El Heap crece hacia direcciones superiores mediante asignación dinámica (`malloc`/`brk`); el Stack crece hacia abajo con variables locales y marcos de llamada.** ✅
- [ ] C) El Heap se almacena en la memoria caché L1 del procesador y el Stack se guarda en el archivo de intercambio swap en el disco SSD.
- [ ] D) Ambos segmentos tienen un tamaño fijo inmutable de 4 KB definido rígidamente por la arquitectura del procesador durante el inicio del BIOS.

> **💡 Explicación:** En la arquitectura estándar de memoria virtual de Linux, el Heap crece hacia arriba (hacia direcciones de memoria más altas) a medida que el proceso solicita memoria dinámica, mientras que el Stack crece hacia abajo (hacia direcciones más bajas) de forma automática con cada llamada a función y creación de variables locales.

---

### Pregunta 3 (30 segundos)
**¿Cuál es la función y ventaja de la técnica *Copy-On-Write* (COW) combinada con la *Zero Page* al crear un proceso con `fork()`?**

- [ ] A) Recompilar automáticamente los módulos binarios del kernel en un archivo temporal de solo lectura para evitar desbordamientos de búfer en memoria física.
- [x] **B) Compartir páginas en modo solo lectura hasta que uno de los procesos intenta escribir, duplicando la página solo en ese instante.** ✅
- [ ] C) Forzar la sincronización continua de todos los bloques de memoria RAM directamente al disco duro para evitar pérdidas ante un corte de energía.
- [ ] D) Prohibir el acceso al procesador a cualquier proceso hijo hasta que el proceso padre termine completamente su ciclo de ejecución.

> **💡 Explicación:** Con Copy-On-Write (COW), el kernel no duplica inmediatamente la memoria física del proceso padre al hacer `fork()`. Ambos procesos comparten los mismos marcos de página marcados como solo lectura. Únicamente cuando uno de ellos intenta modificar un dato, la CPU genera una trampa y el kernel duplica ese marco específico de 4 KB.

---

### Pregunta 4 (30 segundos)
**En la gestión de memoria del Kernel de Linux, ¿cuál es el propósito fundamental del asignador *Buddy System* (Buddy Allocator)?**

- [ ] A) Conectar múltiples servidores a través de una red de alta velocidad InfiniBand para sincronizar las bases de datos distribuidas en tiempo real.
- [x] **B) Asignar bloques contiguos de páginas en potencias de 2 ($2^k$) y fusionar bloques hermanos libres de forma rápida.** ✅
- [ ] C) Administrar la cola de impresión del sistema operativo organizando los documentos según el número de páginas enviadas por el usuario.
- [ ] D) Traducir dinámicamente direcciones IPv4 a direcciones IPv6 dentro de la pila de protocolos del núcleo.

> **💡 Explicación:** El Buddy System divide la memoria física en bloques contiguos de tamaño potencia de 2 (ej: 4KB, 8KB, 16KB, 32KB...). Cuando dos bloques adyacentes del mismo tamaño (bloques "hermanos" o buddies) quedan libres, se fusionan automáticamente en un bloque mayor, minimizando la fragmentación externa con una sobrecarga computacional mínima.

---

### Pregunta 5 (30 segundos)
**¿Por qué Linux incorpora el *Slab Allocator* por encima del *Buddy System* para estructuras internas como `task_struct` o descriptores de archivos?**

- [ ] A) Para permitir que los procesos de usuario estándar puedan escribir directamente en el bus PCI sin requerir el cambio a Modo Kernel ni privilegios de administrador.
- [x] **B) Para reutilizar cachés de objetos frecuentes de tamaño fijo y evitar la severa fragmentación interna del Buddy System.** ✅
- [ ] C) Para duplicar la capacidad de memoria RAM física del equipo comprimiendo el código del sistema operativo en tiempo de ejecución.
- [ ] D) Para cifrar los paquetes de red salientes mediante claves criptográficas asimétricas de 4096 bits.

> **💡 Explicación:** Si el kernel pidiera memoria al Buddy System para una estructura pequeña (ej: un `task_struct` de pocos cientos de bytes), el Buddy le otorgaría una página entera de 4 KB, desperdiciando el resto (fragmentación interna). El Slab Allocator divide páginas en "slabs" de objetos del mismo tipo pre-inicializados, reutilizándolos instantáneamente.

---

### Pregunta 6 (30 segundos)
**¿Cuál es la diferencia técnica entre la asignación de memoria con `kmalloc()` y con `vmalloc()` en el espacio del Kernel?**

- [ ] A) `kmalloc()` solo funciona en sistemas operativos de 16 bits antiguos, mientras que `vmalloc()` es un comando de usuario exclusivo de la shell ZSH para emular memoria virtual en disco.
- [x] **B) `kmalloc()` garantiza memoria contigua física y virtualmente; `vmalloc()` garantiza memoria contigua solo virtualmente.** ✅
- [ ] C) `kmalloc()` almacena datos en la memoria de la tarjeta de video (VRAM) y `vmalloc()` en la memoria principal del microprocesador.
- [ ] D) No existe ninguna diferencia; `vmalloc()` es simplemente un alias obsoleto que apunta a la misma función del planificador de tareas.

> **💡 Explicación:** `kmalloc()` solicita páginas al Buddy System obteniendo memoria físicamente contigua (esencial para dispositivos con acceso DMA). Por el contrario, `vmalloc()` asigna páginas que pueden estar dispersas en la RAM física pero mapeadas de forma consecutiva en el espacio virtual del kernel, ideal para buffers grandes o carga de módulos `.ko`.

---

### Pregunta 7 (30 segundos)
**¿Qué sucede a nivel de hardware y sistema operativo cuando un proceso intenta acceder a una página con su *bit de presencia* en 0 (*Page Fault*)?**

- [ ] A) El microprocesador emite un pitido de advertencia en el altavoz de la placa madre y formatea automáticamente la partición de swap para liberar espacio.
- [x] **B) La MMU genera una excepción (TRAP) que invoca al manejador del kernel para cargar la página desde el disco o swap a la RAM.** ✅
- [ ] C) El proceso se aborta de forma definitiva con el error irrecuperable Kernel Panic y se reinicia la máquina inmediatamente.
- [ ] D) El compilador GCC vuelve a compilar el programa en segundo plano asignándole registros de CPU adicionales.

> **💡 Explicación:** En la Paginación por Demanda (*Demand Paging*), las páginas no se cargan en RAM hasta que son necesarias. Cuando el proceso intenta acceder a una página ausente, la MMU detecta el bit de presencia en 0 y dispara un fallo de página (*Page Fault*). El kernel suspende el proceso, trae la página desde el ejecutable o swap, actualiza la tabla de páginas y reanuda la instrucción.

---

### Pregunta 8 (30 segundos)
**¿Cuál es el rol del demonio del kernel `kswapd` en GNU/Linux?**

- [ ] A) Monitorear las conexiones SSH entrantes y bloquear las direcciones IP que superen los tres intentos fallidos de autenticación de usuario.
- [x] **B) Vigilar el nivel de memoria libre y liberar páginas de forma asíncrona hacia el swap cuando se alcanza el umbral mínimo (*watermark*).** ✅
- [ ] C) Comprimir los archivos del directorio `/var/log/` para que no ocupen espacio en el sistema de archivos raíz.
- [ ] D) Medir la temperatura de los núcleos del procesador para regular la velocidad de los ventiladores del chasis.

> **💡 Explicación:** `kswapd` es el demonio de intercambio de páginas del kernel en segundo plano. Cuando la memoria RAM libre cae por debajo de un umbral (*low watermark*), `kswapd` se despierta y desaloja páginas inactivas o modificadas al swap para mantener una reserva de marcos libres antes de que el sistema entre en falta crítica de memoria (OOM).

---

### Pregunta 9 (30 segundos)
**En el comando `free -m`, ¿cuál es la diferencia crucial entre la columna `free` (libre) y la columna `available` (disponible)?**

- [ ] A) `free` indica la memoria swap configurada en el disco rígido y `available` indica la cantidad de memoria instalada en los slots de la placa madre.
- [x] **B) `free` es RAM totalmente sin uso; `available` incluye además la memoria en buffers/caché que puede liberarse de inmediato si una aplicación la solicita.** ✅
- [ ] C) `free` solo mide la memoria utilizada por el entorno gráfico de escritorio y `available` mide los procesos de la consola tty.
- [ ] D) Son valores idénticos calculados por dos algoritmos distintos para verificar la consistencia del reloj del sistema.

> **💡 Explicación:** En Linux, la memoria libre no utilizada es memoria desperdiciada, por lo que el kernel usa casi toda la RAM libre como caché de disco y buffers. Por ello, `free` suele ser bajo, pero `available` es la métrica real que indica cuánta memoria puede entregarse a nuevas aplicaciones sin necesidad de acudir al swap (RAM libre + caches reciclables).

---

### Pregunta 10 (30 segundos)
**En la configuración de múltiples áreas de intercambio swap en Linux, ¿qué significado tiene el valor de *Prioridad* (`Priority`) asignado con `swapon -p <prioridad>`?**

- [ ] A) Define el tamaño máximo en gigabytes que el archivo swap puede expandirse antes de emitir un error de cuota de disco.
- [x] **B) Las áreas de mayor prioridad numérica se utilizan primero; a igual prioridad, el kernel distribuye las páginas en modo entrelazado (*round-robin*).** ✅
- [ ] C) Indica la cantidad de segundos que un proceso puede permanecer bloqueado en disco antes de ser eliminado con señal SIGKILL.
- [ ] D) Es un identificador único de seguridad que impide que usuarios sin privilegios lean el contenido del archivo de paginación.

> **💡 Explicación:** En `/proc/swaps`, la columna de prioridad determina el orden de uso del swap (las prioridades van de -1 a 32767). Si se configuran dos particiones swap rápidas (ej: en discos SSD distintos) con la misma prioridad alta, Linux escribe en ambas de forma alternada (striping), mejorando el rendimiento de E/S.

---

## 📦 Bloque de Importación para Moodle / Quizizz (Formato Aiken)

```text
En el espacio de direcciones de un proceso en Linux, que caracteriza al segmento BSS?
A. Contiene el codigo fuente compilado con optimizacion y se almacena en memoria Flash.
B. Almacena variables globales y estaticas no inicializadas, sin ocupar espacio fisico en disco.
C. Es una particion oculta de swap que se activa en el arranque para inicializar systemd.
D. Es el segmento donde residen exclusivamente los punteros a funciones creados con mmap.
ANSWER: B

En que se diferencian principalmente el Heap y el Stack en el espacio de memoria de un proceso?
A. El Heap almacena variables booleanas y el Stack se utiliza para sockets de red TCP.
B. El Heap crece hacia direcciones superiores (malloc); el Stack crece hacia abajo con variables locales.
C. El Heap se almacena en la cache L1 de la CPU y el Stack se guarda en el archivo de intercambio swap.
D. Ambos segmentos tienen un tamano fijo inmutable de 4 KB definido por el BIOS.
ANSWER: B

Cual es la ventaja de la tecnica Copy-On-Write (COW) al crear un proceso con fork()?
A. Recompilar los modulos del kernel en un archivo temporal para evitar desbordamientos de buffer.
B. Compartir paginas en solo lectura hasta que un proceso intenta escribir, duplicando solo en ese instante.
C. Forzar la sincronizacion continua de la RAM a disco para evitar perdidas ante cortes de energia.
D. Prohibir el acceso al procesador al proceso hijo hasta que el padre finalice.
ANSWER: B

Cual es el proposito fundamental del asignador Buddy System en Linux?
A. Conectar multiples servidores a traves de una red InfiniBand para sincronizar bases de datos.
B. Asignar bloques contiguos de paginas en potencias de 2 y fusionar bloques hermanos libres.
C. Administrar la cola de impresion del sistema operativo segun el numero de paginas enviadas.
D. Traducir dinamicamente direcciones IPv4 a IPv6 dentro de la pila de red del kernel.
ANSWER: B

Por que Linux incorpora el Slab Allocator por encima del Buddy System?
A. Para permitir que los procesos de usuario escriban directamente en el bus PCI sin modo kernel.
B. Para reutilizar caches de objetos frecuentes de tamano fijo y evitar fragmentacion interna del Buddy.
C. Para duplicar la memoria RAM fisica comprimiendo el codigo del sistema operativo.
D. Para cifrar los paquetes de red salientes mediante claves asimetricas de 4096 bits.
ANSWER: B

Cual es la diferencia tecnica entre kmalloc() y vmalloc() en el Kernel?
A. kmalloc() funciona en 16 bits y vmalloc() es un comando de usuario de ZSH para emular memoria.
B. kmalloc() garantiza memoria contigua fisica y virtualmente; vmalloc() garantiza memoria contigua solo virtualmente.
C. kmalloc() almacena datos en la memoria de la placa de video y vmalloc() en la memoria RAM principal.
D. No existe ninguna diferencia; vmalloc() es un alias obsoleto hacia la misma funcion del scheduler.
ANSWER: B

Que sucede a nivel de hardware cuando un proceso accede a una pagina con bit de presencia en 0 (Page Fault)?
A. El microprocesador formatea automaticamente la particion de swap para liberar espacio.
B. La MMU genera una excepcion que invoca al kernel para cargar la pagina desde el disco a la RAM.
C. El proceso se aborta inmediatamente con Kernel Panic y reinicia la computadora.
D. El compilador GCC vuelve a compilar el programa en segundo plano con registros adicionales.
ANSWER: B

Cual es el rol del demonio del kernel kswapd en GNU/Linux?
A. Monitorear conexiones SSH entrantes y bloquear IPs que superen intentos fallidos.
B. Vigilar el nivel de memoria libre y liberar paginas hacia el swap cuando se alcanza el umbral minimo.
C. Comprimir los archivos de /var/log/ para que no ocupen espacio en la particion raiz.
D. Medir la temperatura de la CPU para regular los ventiladores del gabinete.
ANSWER: B

En el comando free -m, cual es la diferencia crucial entre free y available?
A. free indica el espacio swap en disco y available la memoria fisica instalada en la placa madre.
B. free es RAM totalmente sin uso; available incluye memoria en buffers/cache que puede liberarse de inmediato.
C. free mide la memoria del entorno grafico y available la de los procesos de consola tty.
D. Son valores identicos calculados por dos algoritmos para verificar la hora del sistema.
ANSWER: B

En la configuracion de areas swap en Linux, que significa el valor de Prioridad (swapon -p)?
A. Define el tamano maximo en gigabytes que el archivo swap puede expandirse en el disco.
B. Las areas de mayor prioridad numerica se usan primero; a igual prioridad se distribuyen en round-robin.
C. Indica los segundos que un proceso puede permanecer en disco antes de recibir senal SIGKILL.
D. Es un identificador unico que impide a usuarios sin privilegios leer el archivo swap.
ANSWER: B
```
