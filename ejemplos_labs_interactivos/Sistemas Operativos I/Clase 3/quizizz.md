# 🧠 Cuestionario de Nivelación y Calentamiento: Planificación de CPU
## Cátedra: Teoría de Sistemas Operativos (TSO) — UNJu Facultad de Ingeniería
### Formato Formativo para Wayground / Quizizz / Kahoot (Ciclo Lectivo 2026)

---

### Pregunta 1 (Mecanismos vs. Políticas)
**¿Cuál de las siguientes tareas del sistema operativo corresponde estrictamente a un mecanismo y no a una política de planificación?**
- A) Decidir que los procesos en segundo plano reciban menos tiempo de ejecución.
- B) Determinar la duración del quantum asignado a los procesos de tiempo compartido.
- C) Ejecutar la rutina de bajo nivel que salva los registros del PCB y restaura el nuevo hilo.
- D) Seleccionar la cola de prioridad a la que ingresará un proceso interactivo recién creado.

> **Respuesta Correcta:** **C**  
> **Justificación Pedagógica:** El cambio de contexto (*Context Switch*) y el intercambio de registros en el procesador constituyen el *mecanismo* de bajo nivel que ejecuta la decisión, mientras que las reglas sobre quién recibe CPU representan la *política* (Silberschatz Cap. 5.1; Diapositiva 10).

---

### Pregunta 2 (Criterios de Rendimiento)
**El tiempo total transcurrido desde que un proceso arriba al sistema hasta que finaliza completamente su ejecución se denomina:**
- A) Tiempo de Retorno (Turnaround Time).
- B) Tiempo de Espera en la cola de Listos.
- C) Latencia de Despacho de Instrucciones.
- D) Tiempo de Respuesta en Modo Usuario.

> **Respuesta Correcta:** **A**  
> **Justificación Pedagógica:** El tiempo de retorno ($T = t_f - t_i$) mide el intervalo completo de estancia del proceso en el sistema operativo, integrando tanto sus fases de cómputo como sus esperas y bloqueos de E/S (Stallings Cap. 9.1; Diapositiva 6).

---

### Pregunta 3 (Planificación FCFS)
**¿Qué fenómeno patológico de rendimiento caracteriza a la política de planificación FCFS cuando coinciden trabajos con ráfagas heterogéneas?**
- A) Inanición indefinida producida por arribos de procesos de prioridad estática superior.
- B) Sobrecarga masiva de la memoria secundaria provocada por swapping permanente de páginas.
- C) Caída repentina de la tasa de aciertos en memoria caché L1 debido a múltiples desalojos.
- D) Efecto Convoy, donde procesos cortos quedan retenidos detrás de una ráfaga larga en CPU.

> **Respuesta Correcta:** **D**  
> **Justificación Pedagógica:** En FCFS, al no existir mecanismo de desalojo (*non-preemptive*), si un proceso intensivo en CPU toma el procesador, todos los procesos rápidos y de E/S quedan paralizados detrás de él degradando la utilización (Silberschatz Cap. 5.3.1; Diapositiva 11).

---

### Pregunta 4 (Algoritmo SJN / SJF)
**Desde el punto de vista del tiempo medio de espera ($E$), ¿cuál es la principal ventaja matemática del algoritmo SJN respecto a FCFS?**
- A) Garantiza que ningún proceso sufra inanición independientemente de la longitud de su ráfaga.
- B) Minimiza el tiempo de espera promedio al despachar primero las ráfagas más breves.
- C) Evita la necesidad de predecir o estimar la duración de la próxima ráfaga de CPU del hilo.
- D) Elimina por completo las rutinas de cambio de contexto al prescindir de interrupciones.

> **Respuesta Correcta:** **B**  
> **Justificación Pedagógica:** Se demuestra formalmente que SJF/SJN es óptimo respecto a minimizar el tiempo medio de espera en sistemas uniprocesador porque reduce drásticamente los tiempos acumulados de los trabajos subsiguientes (Silberschatz Cap. 5.3.2; Diapositiva 11).

---

### Pregunta 5 (Algoritmo SRT)
**¿En qué condición específica el planificador SRT (Shortest Remaining Time) ejecuta una expulsión o desalojo (*preemption*) de la CPU?**
- A) Al agotarse la cuota de tiempo periódica asignada por el temporizador del kernel.
- B) Cuando el proceso en ejecución realiza una llamada al sistema bloqueante de entrada/salida.
- C) Cuando arriba un proceso cuyo tiempo de ráfaga remanente es menor al del proceso en ejecución.
- D) Cuando un hilo secundario del mismo proceso solicita recursos compartidos en memoria.

> **Respuesta Correcta:** **C**  
> **Justificación Pedagógica:** SRT es la variante con desalojo de SJF; en cuanto un proceso llega o se desbloquea con una ráfaga remanente estrictamente más corta que la que le queda al actual, este último es desalojado de inmediato (Carretero Cap. 3.4.3; Diapositiva 11).

---

### Pregunta 6 (Round Robin)
**En un planificador Round Robin, si el tamaño del quantum ($q$) se configura con un valor excesivamente grande respecto a las ráfagas de los procesos:**
- A) El comportamiento del sistema degenera y se vuelve idéntico a una política FCFS.
- B) El algoritmo se transforma automáticamente en SJF favoreciendo ráfagas cortas.
- C) Se producen interbloqueos fatales por contención en las colas de dispositivos.
- D) La tasa de cambios de contexto colapsa la capacidad operativa del procesador.

> **Respuesta Correcta:** **A**  
> **Justificación Pedagógica:** Si el quantum supera la duración de cualquier ráfaga, ningún proceso es desalojado por fin de tiempo y cada uno corre hasta terminar o bloquearse por E/S, operando idéntico a FCFS (Silberschatz Cap. 5.3.4; Diapositiva 11).

---

### Pregunta 7 (Planificación por Prioridades)
**¿Cuál es la técnica estándar que implementan los sistemas operativos para solucionar la inanición (*starvation*) en políticas por prioridad?**
- A) Expulsar periódicamente los procesos bloqueados hacia el área de intercambio en disco.
- B) Reiniciar el sistema operativo cuando se detecte que un proceso no recibió ciclos de CPU.
- C) Asignar quantums exponencialmente decrecientes a las tareas interactivas del usuario.
- D) Envejecimiento (*Aging*), incrementando la prioridad de los procesos conforme esperan.

> **Respuesta Correcta:** **D**  
> **Justificación Pedagógica:** El envejecimiento (*Aging*) incrementa dinámicamente el nivel de prioridad de los procesos de baja prioridad a medida que pasa el tiempo en espera, asegurando que tarde o temprano alcancen la prioridad máxima y ejecuten (Silberschatz Cap. 5.3.3; Diapositiva 11).

---

### Pregunta 8 (Algoritmo HRN)
**En el algoritmo HRN (Highest Response Ratio Next), la prioridad dinámica se calcula como $P = \frac{t + w}{t}$. ¿Qué representa el término $w$?:**
- A) El tiempo estimado que consumirá la próxima ráfaga de entrada/salida del proceso.
- B) El tiempo total acumulado que el proceso lleva esperando en la cola de listos.
- C) La cuota de quantum restante asignada por el planificador de corto plazo.
- D) La cantidad de interrupciones de reloj recibidas durante el ciclo de despacho.

> **Respuesta Correcta:** **B**  
> **Justificación Pedagógica:** En la fórmula de HRN, $w$ es el tiempo que el trabajo ha pasado esperando la CPU y $t$ es el tiempo de servicio requerido; a mayor tiempo de espera $w$, mayor es el ratio de respuesta $P$, previniendo la inanición (Stallings Cap. 9.2; Diapositiva 11).

---

### Pregunta 9 (Sistemas Multiprocesador)
**En arquitecturas multinúcleo, la propiedad de "Afinidad a Procesador" (*Processor Affinity*) tiene como propósito principal:**
- A) Reutilizar las líneas de datos calientes que ya residen en la memoria caché del núcleo.
- B) Reservar permanentemente un núcleo impidiendo que otros procesos compartan la CPU.
- C) Sincronizar el reloj de hardware para evitar colisiones en los buses de direcciones.
- D) Desactivar la tabla de páginas para acceder directamente a la memoria física RAM.

> **Respuesta Correcta:** **A**  
> **Justificación Pedagógica:** Migrar un hilo de un núcleo a otro invalida su caché local; la afinidad intenta retener el hilo en el mismo core para maximizar el rendimiento por aciertos en caché (Silberschatz Cap. 5.5; Diapositiva 17).

---

### Pregunta 10 (Evaluación y Selección de Políticas)
**De acuerdo con los principios de evaluación de algoritmos de sistemas operativos, ¿cuál es la mejor conclusión de diseño?:**
- A) Siempre debe emplearse FCFS debido a su nula sobrecarga en cambios de contexto.
- B) Los sistemas de tiempo compartido deben usar exclusivamente SJN para maximizar throughput.
- C) No existe un algoritmo óptimo universal: la elección depende de los objetivos y compromisos.
- D) La política de planificación viene grabada en el silicio y no admite ajustes de software.

> **Respuesta Correcta:** **C**  
> **Justificación Pedagógica:** No existe un algoritmo perfecto para todos los escenarios. Un sistema interactivo prioriza tiempos de respuesta y equidad (Round Robin), mientras que un sistema por lotes prioriza rendimiento general y retorno (SJF) (Silberschatz Cap. 5.6; Diapositiva 18).
