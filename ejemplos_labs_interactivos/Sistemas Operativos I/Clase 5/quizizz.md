# Cuestionario Dinámico: Sincronización de Procesos (Wayground / Quizizz)
## Cátedra de Teoría de Sistemas Operativos (TSO) — UNJu FI 2026
**Guía Docente de Preguntas, Respuestas y Fundamentación Didáctica**

---

### Pregunta 1
**¿Qué condición de la sección crítica garantiza que solo un proceso puede acceder al recurso compartido a la vez?**
* A) El sistema operativo reserva previamente una región de memoria inalterable exclusiva.
* B) La espera limitada evita la inanición asignando prioridades estrictas por hardware.
* C) La exclusión mutua impide que múltiples procesos entren simultáneamente a la zona.
* D) El algoritmo de progreso delega la asignación a la unidad de gestión de la memoria.

* **Respuesta Correcta:** C (Exclusión mutua) - *Silberschatz Cap. 6.2*
* **Explicación Didáctica:**  
  La solución canónica al problema de la sección crítica exige tres requisitos formales:
  1. **Exclusión Mutua (*Mutual Exclusion*):** Si el proceso $P_i$ está ejecutando en su sección crítica, ningún otro proceso puede estar en su respectiva sección crítica.
  2. **Progreso (*Progress*):** Si ningún proceso está en su sección crítica y hay procesos que desean entrar, la selección del siguiente no puede postergarse indefinidamente.
  3. **Espera Limitada (*Bounded Waiting*):** Existe un límite en la cantidad de veces que otros procesos pueden adelantarse antes de que se conceda la solicitud a un proceso en espera (evita la inanición / *starvation*).

---

### Pregunta 2
**¿Qué ocurre durante la ejecución de una instrucción de hardware como Test-and-Set?**
* A) La unidad aritmética lógica divide la variable en dos direcciones de memoria virtuales.
* B) El procesador bloquea el bus y ejecuta la lectura y escritura de forma ininterrumpible.
* C) El sistema operativo guarda el contexto del proceso actual en la pila de ejecuciones.
* D) La interrupción de reloj asocia el recurso compartido al bloque de control del hilo.

* **Respuesta Correcta:** B (Es atómica / indivisible) - *Silberschatz Cap. 6.3*
* **Explicación Didáctica:**  
  Las instrucciones como `Test-and-Set` o `Compare-and-Swap` son **atómicas** (indivisibles a nivel de ciclo de hardware). La CPU bloquea temporalmente el bus de memoria o retiene la línea de caché de forma exclusiva para leer el valor original y escribir el nuevo de manera ininterrumpible, impidiendo que otra CPU o interrupción de reloj se interponga entre la lectura y la modificación.

---

### Pregunta 3
**¿Cuál de los siguientes problemas se busca resolver principalmente con semáforos o monitores?**
* A) La corrupción de datos provocada por condiciones de carrera en variables compartidas.
* B) El incremento exponencial de latencia al iniciar subprocesos de la misma aplicación.
* C) La fragmentación externa del almacenamiento secundario en sistemas de particiones.
* D) La baja tasa de aciertos de lectura que experimenta habitualmente la memoria caché.

* **Respuesta Correcta:** A (Corrupción de datos por condiciones de carrera) - *Silberschatz Cap. 6.6*
* **Explicación Didáctica:**  
  Una **condición de carrera** (*race condition*) se produce cuando dos o más hilos manipulan datos compartidos concurrentemente y el resultado final depende del orden de planificación no-determinista de las instrucciones. Los semáforos y monitores imponen exclusión mutua y señalización determinista para garantizar que solo un hilo modifique el estado compartido en cada instante, preservando la consistencia e integridad de los datos.

---

### Pregunta 4
**¿Qué ventaja estructural ofrece un Monitor respecto al uso de semáforos tradicionales?**
* A) Utiliza una pila LIFO para gestionar las interrupciones del hardware del controlador.
* B) Divide los recursos compartidos en múltiples hilos mediante paralelismo a nivel dato.
* C) Elimina el despachador del núcleo garantizando tiempos de respuesta instantáneos.
* D) Provee encapsulamiento y exclusión mutua implícita dentro de sus procedimientos.

* **Respuesta Correcta:** D (Encapsulamiento y exclusión mutua implícita) - *Silberschatz Cap. 6.7*
* **Explicación Didáctica:**  
  Los semáforos son herramientas de bajo nivel propensas a errores humanos (como omitir un `signal()`, duplicar un `wait()` o invertirlos, causando deadlocks inmediatos). Un **Monitor** es un Tipo Abstracto de Datos (TDA / Clase) de alto nivel: encapsula los datos compartidos y sus operaciones, y el compilador/runtime garantiza automáticamente que **solo un proceso puede estar ejecutando dentro de cualquier método del monitor a la vez**, eliminando la necesidad de gestionar cerrojos manuales de entrada y salida.

---

### Pregunta 5
**En el problema clásico del productor-consumidor con un buffer acotado, ¿cuándo debe esperar el productor?**
* A) Cuando el número de hilos del consumidor supera el límite establecido por el kernel.
* B) Cuando el buffer está completamente lleno y no hay slots disponibles para los ítems.
* C) Cuando la CPU ingresa a un estado de bajo consumo desactivando los temporizadores.
* D) Cuando la variable compartida del monitor se encuentra protegida por una interrupción.

* **Respuesta Correcta:** B (Cuando el buffer está lleno) - *Silberschatz Cap. 6.6*
* **Explicación Didáctica:**  
  En un buffer circular acotado de capacidad fija $N$:
  * El **Productor** debe bloquearse en `wait(empty)` cuando el buffer está completamente **lleno** (`empty == 0`), esperando a que el consumidor libere al menos una posición (`signal(empty)`).
  * El **Consumidor** debe bloquearse en `wait(full)` cuando el buffer está completamente **vacío** (`full == 0`), esperando a que el productor genere al menos un nuevo ítem (`signal(full)`).

---

### Pregunta 6
**¿Qué situación crítica ejemplifica principalmente el problema clásico de los filósofos comensales?**
* A) La dificultad de sincronizar relojes lógicos entre múltiples procesos distribuidos.
* B) La saturación de la memoria secundaria provocada por la excesiva paginación bajo demanda.
* C) El riesgo de interbloqueo o deadlock cuando todos compiten por recursos compartidos.
* D) El error de direccionamiento provocado por una violación en el segmento del proceso.

* **Respuesta Correcta:** C (Riesgo de interbloqueo o deadlock) - *Silberschatz Cap. 6.6*
* **Explicación Didáctica:**  
  Ideado por Dijkstra en 1965, este problema representa la asignación de recursos finitos entre procesos concurrentes. Si todos los filósofos deciden comer a la vez y toman de forma simétrica su tenedor izquierdo, todos retendrán un recurso mientras esperan el derecho, configurando las 4 condiciones de Coffman (exclusión mutua, retención y espera, no apropiación y espera circular), resultando en un **interbloqueo (*deadlock*)** total del sistema.

---

### Pregunta 7
**En Python, ¿qué clase del módulo threading provee exclusión mutua similar a un semáforo binario?**
* A) La clase threading.Condition utilizada para notificar y despertar hilos en ejecución.
* B) La estructura threading.Barrier que frena a los procesos en un punto sincronizado.
* C) El manejador threading.Timer empleado para lanzar subrutinas tras un tiempo fijado.
* D) El mecanismo genérico threading.Lock que cuenta con métodos de adquirir y liberar.

* **Respuesta Correcta:** D (threading.Lock) - *Python Threading Docs*
* **Explicación Didáctica:**  
  En Python `threading`, la clase fundamental para exclusión mutua es `Lock` (cerrojo mutuo primitivo). Posee dos estados (bloqueado/desbloqueado) y dos métodos clave:
  * `acquire()`: bloquea la hebra hasta obtener el candado (equivalente a `wait()`).
  * `release()`: libera el candado para otro hilo (equivalente a `signal()`).
  Se recomienda usarlo mediante el bloque seguro `with lock:`, que garantiza su liberación automática incluso si ocurre una excepción.

---

### Pregunta 8
**En la teoría de Monitores, ¿cuál es el propósito de las denominadas Variables de Condición?**
* A) Suspender temporalmente un proceso hasta que otro ejecute una operación de señal.
* B) Habilitar la ejecución concurrente de código fuera de las zonas protegidas del kernel.
* C) Almacenar las direcciones virtuales de las páginas involucradas en un fallo de memoria.
* D) Reemplazar al contador de programa dentro del bloque de control del proceso principal.

* **Respuesta Correcta:** A (Suspender temporalmente hasta recibir una señal) - *Silberschatz Cap. 6.7*
* **Explicación Didáctica:**  
  Aunque el monitor garantiza exclusión mutua implícita, los procesos a menudo necesitan esperar a que se cumpla una condición lógica (ej: que el buffer tenga elementos o que el puente baje). Las **Variables de Condición** (tipo `condition`) proveen esta sincronización:
  * `cond.wait()`: suspende al hilo llamador y libera temporalmente la exclusión mutua del monitor para permitir que otro hilo entre y cambie el estado.
  * `cond.signal()` (o `notify()`): despierta a uno de los hilos suspendidos en esa condición cuando el estado ya es favorable.

---

### Pregunta 9
**¿Qué mecanismo asegura que una secuencia de operaciones críticas se ejecute de forma íntegra o no se ejecute en absoluto?**
* A) El planificador de corto plazo basado en un algoritmo del tipo rueda equilibrada o RR.
* B) La transacción atómica que garantiza las propiedades de durabilidad y consistencia.
* C) El paginador que administra los fallos de lectura trasladando bloques desde el disco.
* D) La hebra de nivel usuario gestionada exclusivamente por una librería de programación.

* **Respuesta Correcta:** B (La transacción atómica) - *Silberschatz Cap. 6.9*
* **Explicación Didáctica:**  
  Una **transacción atómica** es una colección de operaciones que realiza una transformación lógica de datos bajo el principio de **atomicidad (todo o nada)**. Si la secuencia se completa con éxito, se confirma (*commit*). Si ocurre un fallo en cualquier paso intermedio, el sistema deshace todos los cambios realizados hasta el momento mediante un retroceso (*rollback* / *abort*), asegurando que el estado del sistema permanezca siempre consistente.

---

### Pregunta 10
**¿Por qué se considera ineficiente desactivar las interrupciones en sistemas con múltiples procesadores?**
* A) Porque genera conflictos con los registros base y límite de la memoria principal.
* B) Porque la complejidad para enviar el mensaje a los demás procesadores es demasiado alta.
* C) Porque requiere convertir todas las llamadas al sistema operativo en llamadas locales.
* D) Porque el planificador pierde instantáneamente la capacidad de asignar nuevas tareas.

* **Respuesta Correcta:** B (La complejidad de enviar el mensaje entre procesadores) - *Silberschatz Cap. 6.3*
* **Explicación Didáctica:**  
  En monoprocesadores, desactivar interrupciones antes de la sección crítica es una técnica simple y eficaz. Sin embargo, en arquitecturas **multiprocesador (SMP)**, para que la desactivación surta efecto debe enviarse un mensaje de interrupción entre núcleos (IPI - *Inter-Processor Interrupt*) a través del bus del sistema a todas las CPU. Esto genera un cuello de botella severo de comunicación, degrada el rendimiento de la memoria y retrasa el procesamiento de eventos temporizadores en todos los núcleos.

---

### Pregunta 11
**¿Qué variable asegura la espera limitada y evita la postergación indefinida en el Algoritmo de Peterson?**
* A) El arreglo de banderas booleanas que indica únicamente la intención de entrar.
* B) La rutina de servicio que desactiva temporalmente el reloj del procesador.
* C) La variable de turno que cede voluntariamente la prioridad en caso de conflicto.
* D) El temporizador del despachador que expulsa a los procesos en espera activa.

* **Respuesta Correcta:** C (Variable turn) - *Silberschatz Cap. 6.3*
* **Explicación Didáctica:**  
  El Algoritmo de Peterson combina dos mecanismos:
  * El vector `flag[2]`: indica la intención de cada proceso de ingresar (`flag[i] = true`).
  * La variable `turn`: resuelve el conflicto. Cada proceso, al intentar entrar, asigna `turn = j` (cediendo cortésmente el turno al otro).
  Si ambos desean entrar al mismo tiempo, el valor final de `turn` será el del último que lo sobrescribió, permitiendo que el otro entre de inmediato. Como `turn` no puede tener dos valores a la vez y un proceso a lo sumo espera una entrada ajena, se garantiza la **espera limitada** y se evita la postergación indefinida.

---

### Pregunta 12
**En la implementación de un semáforo contador con bloqueo (Diapositiva 18), si S.value = -3, ¿qué indica formalmente?**
* A) Que existen exactamente 3 procesos suspendidos en la cola de espera.
* B) Que el sistema dispone aún de 3 instancias libres del recurso protegido.
* C) Que el contador de registros sufrió una falla de subdesbordamiento aritmético.
* D) Que hay 3 procesos ejecutando simultáneamente dentro de la sección crítica.

* **Respuesta Correcta:** A (3 procesos suspendidos en la cola de espera) - *Silberschatz Cap. 6.6 / Diapositivas U5*
* **Explicación Didáctica:**  
  En la definición formal de Dijkstra de semáforos con bloqueo pasivo (sin espera activa):
  * Cuando `S.value > 0`: representa la cantidad de recursos libres disponibles.
  * Cuando `S.value == 0`: todos los recursos están tomados, pero no hay hilos en espera.
  * Cuando `S.value < 0`: la magnitud absoluta $|S.value|$ representa **la cantidad exacta de procesos bloqueados en la cola de espera del semáforo** (`S.list`). Por lo tanto, un valor de `-3` significa que hay exactamente 3 procesos dormidos esperando a que otros ejecuten `signal(S)`.
