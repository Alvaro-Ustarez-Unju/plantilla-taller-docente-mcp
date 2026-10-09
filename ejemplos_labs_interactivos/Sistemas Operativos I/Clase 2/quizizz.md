# 🧠 Cuestionario Interactivo de Orientación Formativa (Quizizz / Wayground)
### Cátedra: Teoría de Sistemas Operativos — Ciclo Lectivo 2026
**Universidad Nacional de Jujuy (UNJu) — Facultad de Ingeniería**  
**Docente Responsable:** Ing. María Fernanda Vázquez  
**Jefe de Trabajos Prácticos:** Ing. Fabio D. Argañaraz  

---

## 🎯 Propósito del Cuestionario
Este cuestionario contiene **10 preguntas conceptuales formativas** diseñadas para dinamizar la clase y orientar a los estudiantes en los conceptos teóricos clave antes o durante la resolución de cada uno de los 10 ejercicios del [**Trabajo Práctico N° 2**](https://github.com/UNJU-Teoria-de-Sistemas-Operativos/TP2).

---

### 📌 Pregunta 1 (Guía para Ejercicio 01: Segmentos de Memoria de un Proceso)
**¿En qué segmento del espacio de memoria de un proceso se alojan las variables locales de una función y las direcciones de retorno de las llamadas a subrutinas?**
- A) En la sección de Texto (*Text*), que almacena las instrucciones binarias y datos estáticos de solo lectura protegidos contra escritura por el hardware de la MMU.
- B) En el segmento de Datos (*Data*), reservado formalmente por el compilador para variables globales y estáticas con ciclo de vida permanente en el programa.
- C) En la Pila de ejecución (*Stack*), cuya estructura LIFO gestiona marcos de activación con variables locales y direcciones de retorno.
- D) En el *Heap* dinámico, administrado mediante llamadas del sistema a `malloc()` o `new` para estructuras complejas de tamaño variable en ejecución.

> **Respuesta correcta:** **C**  
> **💡 Justificación pedagógica:** El *Stack* (pila de ejecución) almacena los registros de activación de funciones (parámetros, variables locales y dirección de retorno). El *Heap* es para memoria dinámica, *Data* para globales y *Text* para el código compilado (Silberschatz Cap. 3.1, Carretero Cap. 3.1).

---

### 📌 Pregunta 2 (Guía para Ejercicio 02: Programa vs. Proceso)
**¿Por qué se afirma formalmente que "un programa es una entidad pasiva mientras que un proceso es una entidad activa"?**
- A) El programa es un archivo binario inerte en almacenamiento secundario, mientras que el proceso es una entidad en ejecución con memoria RAM, Program Counter y registros.
- B) El programa gestiona directamente las interrupciones del procesador en modo usuario, mientras que el proceso es una biblioteca dinámica enlazada en tiempo de ejecución por el kernel.
- C) El programa es una instancia activa planificada por el despachador de la CPU, mientras que el proceso es el código fuente sin compilar almacenado en el disco rígido de forma persistente.
- D) El programa posee un identificador PID único asignado por las llamadas del sistema, mientras que el proceso representa la ruta estática dentro del árbol jerárquico del sistema de archivos.

> **Respuesta correcta:** **A**  
> **💡 Justificación pedagógica:** Un programa no consume tiempo de CPU ni memoria hasta que el sistema operativo lo carga en memoria principal creando un contexto de ejecución, instante en el que nace como proceso (Silberschatz Cap. 3.1, Stallings Cap. 3.1).

---

### 📌 Pregunta 3 (Guía para Ejercicio 03: Evolución de los Modelos de Estados)
**¿Cuál fue la limitación crítica del modelo de dos estados (Ejecutando / No Ejecutando) que motivó la creación del modelo de tres estados con el estado Bloqueado?**
- A) Provocaba inanición en los procesos de tiempo real al carecer de un temporizador de hardware que interrumpiera periódicamente a la CPU y regulara el quantum.
- B) Impedía que el sistema operativo admitiera más de dos programas simultáneamente en la cola de planificación a largo plazo debido a restricciones del cargador.
- C) Requería reiniciar el microprocesador cada vez que un proceso intentaba acceder a un archivo almacenado en almacenamiento secundario o en dispositivos lentos.
- D) Agrupaba en una única cola tanto a procesos listos como a procesos detenidos por operaciones lentas de E/S, malgastando ciclos de CPU.

> **Respuesta correcta:** **D**  
> **💡 Justificación pedagógica:** En el modelo de 2 estados, la cola "No Ejecutando" mezclaba procesos listos con procesos detenidos esperando datos de disco o red. Al separarlos con el estado *Bloqueado*, el despachador solo selecciona procesos que realmente pueden avanzar (Stallings Cap. 3.2, U4 Slide 8).

---

### 📌 Pregunta 4 (Guía para Ejercicio 04: Modelo de 7 Estados & Swapping)
**En el modelo de 7 estados con memoria secundaria, ¿a qué estado pasa un proceso que se encuentra en "Bloqueado Suspendido" cuando finalmente concluye la operación de Entrada/Salida que estaba esperando?**
- A) Pasa de forma inmediata al estado En Ejecución, interrumpiendo al proceso actual mediante un cambio de contexto forzado por la controladora de hardware.
- B) Transita al estado Listo Suspendido en disco, quedando preparado para ser reincorporado a la memoria RAM cuando haya espacio libre.
- C) Pasa al estado Listo en memoria principal, siendo cargado automáticamente por la controladora DMA del bus sin requerir la intervención del planificador.
- D) Retorna al estado Nuevo para que el cargador del sistema operativo verifique nuevamente sus permisos de acceso y tabla de páginas en memoria secundaria.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** Al completarse el evento o E/S, el proceso deja de estar bloqueado, pero como sigue residiendo en disco (*Swap*), su estado pasa a ser *Listo Suspendido* (Inactivo). Luego, el planificador a medio plazo decidirá cuándo traerlo a *Listo* (Activo en RAM) (Stallings Cap. 3.2, U4 Slide 11).

---

### 📌 Pregunta 5 (Guía para Ejercicio 05: PCB y Cambio de Contexto)
**¿Qué ocurre con la CPU durante un Cambio de Contexto (*Context Switch*) entre dos procesos?**
- A) Continúa ejecutando código de la aplicación saliente a menor frecuencia de reloj mientras el kernel inicializa los controladores de interrupción correspondientes.
- B) Formatea la región de memoria de intercambio (*swap*) para prevenir fugas de información confidencial entre usuarios concurrentes en sistemas multiusuario.
- C) Ejecuta una instrucción privilegiada de apagado temporal que reduce el consumo eléctrico del microprocesador durante la conmutación entre los espacios de memoria.
- D) Incurre en una sobrecarga ociosa (*overhead*), dedicando ciclos de reloj a salvar y restaurar registros de CPU y punteros de control sin avanzar trabajo útil.

> **Respuesta correcta:** **D**  
> **💡 Justificación pedagógica:** El cambio de contexto es una sobrecarga computacional indispensable: la CPU debe guardar registros, PC y punteros de pila en el PCB del proceso actual y cargar los del nuevo. Es tiempo estrictamente invertido en administración por el SO (Silberschatz Cap. 3.1, Carretero Cap. 3.2).

---

### 📌 Pregunta 6 (Guía para Ejercicio 06: Operaciones POSIX: fork, exec, Zombies y Huérfanos)
**¿Qué define a un proceso en estado "Zombie" en un sistema operativo tipo UNIX/Linux?**
- A) Ha finalizado su ejecución pero permanece en la tabla de procesos porque su padre aún no consultó su código de terminación mediante `wait()`.
- B) Ha quedado en un bucle infinito consumiendo el 100% de la CPU debido a una condición de carrera no resuelta en su sección crítica de memoria compartida.
- C) Ha sido desalojado de la memoria RAM hacia la partición de swap tras haber agotado sucesivamente múltiples quantums de ejecución asignados por el kernel.
- D) Ha perdido la comunicación con el servidor gráfico pero mantiene abiertas sus conexiones de red y descriptores de tuberías anónimas con otros demonios.

> **Respuesta correcta:** **A**  
> **💡 Justificación pedagógica:** Un proceso zombie no consume memoria RAM ni CPU, pero retiene una entrada en la tabla de procesos y su PCB con el código de salida. Una vez que el padre invoca `wait()`, el zombie desaparece completamente (Silberschatz Cap. 3.3, U4 Slide 15).

---

### 📌 Pregunta 7 (Guía para Ejercicio 07: Hilos vs. Procesos)
**Al crear múltiples hilos (*threads*) dentro de un mismo proceso, ¿cuál de los siguientes recursos NO se comparte entre ellos y es estrictamente privado para cada hilo?**
- A) El espacio de memoria virtual completo, incluyendo las secciones de código compilado (*Text*) y la zona de asignación dinámica (*Heap*).
- B) La tabla de descriptores de archivos abiertos, conexiones de sockets de red y credenciales de seguridad del usuario propietario del proceso.
- C) La Pila de ejecución (*Stack*) con sus marcos de activación locales, el Program Counter y los registros de la CPU.
- D) Las variables globales del programa, las variables estáticas y las estructuras sincronizadas de comunicación interproceso.

> **Respuesta correcta:** **C**  
> **💡 Justificación pedagógica:** Cada hilo representa un flujo de control independiente, por lo que necesita su propia secuencia de instrucciones (PC), estado de ejecución (registros de CPU) y pila propia para sus llamadas a funciones locales. El resto del espacio de memoria es compartido (Silberschatz Cap. 4.1, Stallings Cap. 4.1).

---

### 📌 Pregunta 8 (Guía para Ejercicio 08: Mecanismos de IPC)
**¿Cuál es la principal ventaja de la Memoria Compartida (*Shared Memory*) frente al Paso de Mensajes (*Message Passing*) como mecanismo de IPC?**
- A) No requiere ningún tipo de primitiva de exclusión mutua ya que el hardware sincroniza automáticamente los accesos a los buses de control del sistema.
- B) Permite comunicar procesos ubicados en diferentes hosts a través de Internet sin necesidad de configurar sockets de red TCP/IP ni puertos de escucha.
- C) Garantiza la persistencia de la información en el sistema de archivos aún después de reiniciar o apagar el equipo físico mediante copias automáticas en disco.
- D) Proporciona la máxima velocidad al evitar llamadas al sistema y copias intermedias de buffers en el kernel tras ser mapeada.

> **Respuesta correcta:** **D**  
> **💡 Justificación pedagógica:** La memoria compartida evita llamadas al sistema (*syscalls*) y copias de buffers entre espacio de usuario y kernel en cada mensaje. Su desventaja es que la sincronización debe ser gestionada explícitamente por los programadores (Silberschatz Cap. 3.4, Carretero Cap. 3.4).

---

### 📌 Pregunta 9 (Guía para Ejercicio 09: Niveles y Criterios de Planificación)
**¿Qué componente del sistema operativo es el responsable directo de seleccionar qué proceso de la cola de listos se ejecutará en la CPU y realizar el cambio de contexto?**
- A) El Planificador a Largo Plazo (*Job Scheduler*), que regula la cantidad de procesos admitidos en memoria principal desde el disco secundario de almacenamiento.
- B) El Planificador a Corto Plazo (*CPU Scheduler / Dispatcher*), que selecciona el proceso listo a ejecutar y efectúa el cambio de contexto.
- C) El Planificador a Medio Plazo (*Swapper*), encargado de extraer procesos hacia memoria secundaria para reducir el grado global de multiprogramación.
- D) El Administrador de Memoria Virtual (*Paging Daemon*), responsable de intercambiar marcos de página ante fallos de página sucesivos durante la ejecución.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** El planificador a corto plazo (dispatcher) se ejecuta frecuentemente (cada pocos milisegundos) para asignar la CPU a un proceso listo. El largo plazo regula el grado de multiprogramación y el medio plazo maneja la expulsión a swap (Silberschatz Cap. 5.1, U5 Slide 12).

---

### 📌 Pregunta 10 (Guía para Ejercicio 10: Algoritmos de Planificación de CPU)
**¿Qué ocurre en el algoritmo de planificación Round Robin si se selecciona un Quantum de tiempo excesivamente pequeño (por ejemplo, cercano a 1 microsegundo)?**
- A) El rendimiento del sistema cae drásticamente debido a que la CPU invierte casi todo su tiempo en el *overhead* de cambios de contexto sucesivos.
- B) El algoritmo muta su comportamiento y se transforma en un First-Come, First-Served (FCFS) puro con tiempo de retorno óptimo garantizado matemáticamente.
- C) Se elimina completamente el tiempo de espera de los procesos en cola, finalizando todas las tareas en un único ciclo de reloj del procesador.
- D) Se genera inanición (*starvation*) prolongada en todos los procesos de corta duración frente a procesos con ráfagas extensas de uso computacional.

> **Respuesta correcta:** **A**  
> **💡 Justificación pedagógica:** Si el quantum es comparable al tiempo que demora un context switch, la CPU pasará la mayor parte de su tiempo guardando y restaurando PCBs en lugar de ejecutar código útil de los procesos. Por regla general, el quantum debe ser sustancialmente mayor que el tiempo de cambio de contexto (Silberschatz Cap. 5.3, Stallings Cap. 9.2).
