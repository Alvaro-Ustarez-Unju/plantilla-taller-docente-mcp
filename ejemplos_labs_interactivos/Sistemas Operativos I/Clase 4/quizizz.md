# 🧠 Cuestionario de Nivelación y Dinámica de Clase (Wayground / Quizizz)
## Trabajo Práctico N° 4: Gestión de Recursos e Interbloqueos (Deadlocks)
### Cátedra: Teoría de Sistemas Operativos — UNJu Facultad de Ingeniería (2026)

---

### Pregunta 1 (Correspondiente al Ejercicio 1: Algoritmo del Banquero y Matriz Necesidad)
Dentro del Algoritmo del Banquero, ¿qué representa formalmente cada elemento de la matriz Necesidad (Need)?
- A) La cantidad total de recursos físicos instalados en placa base
- B) La suma acumulada de instancias retenidas por procesos activos
- C) El porcentaje transitorio de ocupación del procesador central
- D) Los recursos adicionales que un proceso aún puede solicitar

**Respuesta Correcta:** D  
**Justificación Pedagógica:** La matriz Necesidad se calcula como Need[i,j] = Max[i,j] - Allocation[i,j] y define cuántas instancias adicionales de cada recurso podría requerir el proceso Pi antes de concluir su ejecución (Silberschatz Cap. 7.5.3; Diapositiva 24).

---

### Pregunta 2 (Correspondiente al Ejercicio 2: Condiciones de Coffman y Riesgos)
En un sistema donde todos los procesos retienen recursos mientras solicitan otros adicionales, pero no existe ningún ciclo cerrado de dependencias:
- A) Se produce indefectiblemente una caída de rendimiento del bus
- B) No existe interbloqueo debido a la ausencia de espera circular
- C) El núcleo debe reiniciar de inmediato la memoria virtual activa
- D) Se verifica la presencia simultánea de las cuatro condiciones

**Respuesta Correcta:** B  
**Justificación Pedagógica:** Para que exista un interbloqueo es estrictamente necesario que se cumplan las cuatro condiciones simultáneamente. Si no se verifica la espera circular, el sistema se mantiene libre de bloqueos mutuos (Silberschatz Cap. 7.1; Diapositiva 5).

---

### Pregunta 3 (Correspondiente al Ejercicio 3: Solicitud Dinámica y Estado Inseguro)
Si un proceso solicita recursos libres y el asignador simula la entrega descubriendo que ningún proceso podrá finalizar:
- A) Se concede la petición activando una señal de alerta de kernel
- B) Se aborta de inmediato a todos los procesos de baja prioridad
- C) Se posterga la solicitud manteniendo al proceso en espera
- D) Se compacta el espacio físico del subsistema de intercambio

**Respuesta Correcta:** C  
**Justificación Pedagógica:** El algoritmo del banquero solo concede solicitudes si el estado simulado resultante es seguro. Si el estado es inseguro, el sistema suspende al proceso hasta que otros liberen recursos (Silberschatz Cap. 7.5.4; Diapositiva 26).

---

### Pregunta 4 (Correspondiente al Ejercicio 4: Reducción de Grafos de Asignación)
Durante el procedimiento de reducción de un grafo de asignación, un proceso puede ser eliminado del grafo si:
- A) Sus requerimientos pendientes no superan los recursos libres
- B) Ha consumido la mayor cuota de tiempo en la cola de listos
- C) Posee asignado el recurso con menor identificador numérico
- D) Mantiene hilos de ejecución activos en segundo plano local

**Respuesta Correcta:** A  
**Justificación Pedagógica:** Una gráfica se reduce por un proceso Pi si todas las peticiones actuales de Pi pueden ser satisfechas con las instancias disponibles del sistema (Carretero Cap. 4.5.1; Diapositiva 33).

---

### Pregunta 5 (Correspondiente al Ejercicio 5: Modelado a partir de RAG)
En un grafo de asignación de recursos, si un tipo de recurso Rj tiene 7 instancias y parten 5 flechas hacia procesos:
- A) Existen 5 instancias disponibles libres en el sistema actual
- B) La clase Rj se encuentra en estado de bloqueo irrecuperable
- C) Hay 5 instancias asignadas y restan 2 instancias disponibles
- D) El sistema operativo debe desasignar de inmediato las aristas

**Respuesta Correcta:** C  
**Justificación Pedagógica:** Las flechas dirigidas desde el recurso hacia los procesos representan asignaciones activas. Las instancias disponibles se obtienen restando las asignadas del total (Silberschatz Cap. 7.2; Diapositiva 6).

---

### Pregunta 6 (Correspondiente al Ejercicio 6: Evaluación de Solicitudes Dinámicas)
¿Por qué una solicitud puede ser rechazada provisionalmente por el Banquero aun cuando hay suficientes recursos libres?
- A) Porque el temporizador del planificador de CPU ha caducado
- B) Porque concederla podría forzar al sistema a un estado inseguro
- C) Porque los descriptores de archivos carecen de exclusión mutua
- D) Porque el proceso solicitante superó su cuota de memoria swap

**Respuesta Correcta:** B  
**Justificación Pedagógica:** Disponer de recursos no garantiza que la concesión sea segura. Si tras otorgarlos los recursos restantes impiden que los procesos satisfagan sus demandas máximas, se ingresa a un estado inseguro (Silberschatz Cap. 7.5.1; Diapositiva 22).

---

### Pregunta 7 (Correspondiente al Ejercicio 7: Algoritmo de Detección Multi-Instancia)
En el algoritmo de detección matricial, ¿qué indica que al terminar el análisis varios procesos tengan Finish[i] = false?
- A) Que dichos procesos no requirieron memoria compartida de red
- B) Que el procesador se encuentra ejecutando rutinas del kernel
- C) Que los procesos concluyeron satisfactoriamente en segundo plano
- D) Que los procesos involucrados se encuentran en interbloqueo

**Respuesta Correcta:** D  
**Justificación Pedagógica:** El algoritmo de detección marca con true a los procesos cuyas solicitudes pueden completarse. Si algún Finish[i] permanece en false al terminar, dicho proceso está interbloqueado (Silberschatz Cap. 7.6.2; Diapositiva 37).

---

### Pregunta 8 (Correspondiente al Ejercicio 8: Selección de Víctima por Prioridades)
Al aplicar recuperación por terminación de procesos, ¿cuál es la razón técnica para seleccionar al de menor prioridad?
- A) Minimizar el impacto operativo y costo económico del sistema
- B) Evitar que los controladores de hardware queden desconectados
- C) Liberar exclusivamente la totalidad del espacio de paginación
- D) Impedir que los usuarios interactivos pierdan su conexión SSH

**Respuesta Correcta:** A  
**Justificación Pedagógica:** La selección de víctima evalúa la prioridad para descartar primero los trabajos menos críticos, minimizando el perjuicio sobre los procesos centrales del sistema (Silberschatz Cap. 7.7.1; Diapositiva 43).

---

### Pregunta 9 (Correspondiente al Ejercicio 9: Validación de Solicitudes de Recursos)
¿Qué acción emprende el sistema si un proceso solicita más instancias de las que declaró en su vector de Necesidad?
- A) Suspende de forma indefinida a todos los procesos secundarios
- B) Asigna de inmediato los recursos descontándolos de la memoria
- C) Genera una condición de error por exceder su demanda máxima
- D) Convierte la petición en un arco de asignación provisional

**Respuesta Correcta:** C  
**Justificación Pedagógica:** El paso 1 del algoritmo de solicitud establece que si Solicitud_i > Necesidad_i se debe generar un error, ya que el proceso intentó superar el límite máximo declarado (Silberschatz Cap. 7.5.4; Diapositiva 26).

---

### Pregunta 10 (Correspondiente al Ejercicio 10: Estrategias Combinadas y Jerarquía)
Para evitar que se generen interbloqueos entre diferentes clases disjuntas de recursos, la técnica recomendada es:
- A) Establecer una ordenación lineal estricta entre las clases
- B) Ejecutar permanentemente el algoritmo de Dijkstra en memoria
- C) Forzar el reinicio sincronizado de los dispositivos conectados
- D) Expropiar periódicamente los bloques del disco secundario

**Respuesta Correcta:** A  
**Justificación Pedagógica:** Subdividir los recursos en clases y exigir que los procesos soliciten las clases en un orden lineal ascendente elimina la posibilidad de que surjan ciclos cerrados interclase (Silberschatz Cap. 7.8; Diapositiva 47).
