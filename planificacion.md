# Planificación de la materia: Teoría de los Sistemas Operativos

## 1. Fundamentación
La materia propone que el estudiante comprenda cómo un sistema operativo organiza, coordina y protege los recursos de una computadora para permitir el uso eficiente y seguro de la misma. Se trabaja desde la abstracción del hardware hasta la complejidad de la gestión concurrente y la administración de memoria.

## 2. Objetivos generales
- Analizar la estructura funcional de un sistema operativo.
- Comprender el ciclo de vida de procesos y threads.
- Evaluar políticas de planificación y su impacto en la ejecución.
- Resolver problemas de sincronización y coordinación entre procesos.
- Reconocer situaciones de interbloqueo y aplicar estrategias de prevención o tratamiento.
- Entender la administración de memoria y almacenamiento.
- Relacionar los conceptos teóricos con casos reales de implementación.

## 3. Metodología
- Clases teóricas con fundamentos conceptuales.
- Ejercicios de análisis y resolución de problemas.
- Discusión de casos reales y analogías técnicas.
- Prácticas de laboratorio con simulación de comportamiento de procesos y memoria.
- Evaluación continua con preguntas conceptuales, ejercicios y actividades de aplicación.

## 4. Plan de contenidos por unidad

### Unidad 1. Introducción a los sistemas operativos
- Definición y evolución de los sistemas operativos.
- Objetivos y funciones del SO.
- Servicios del sistema, mecanismos y políticas.
- Estructura de un SO y tipos de kernel.

### Unidad 2. Procesos y threads
- Concepto de proceso.
- Estados y transiciones.
- Bloques de control y contexto.
- Threads: ventajas, diferencias y modelos.
- Creación, terminación y comunicación de procesos.

### Unidad 3. Planificación de la CPU
- Criterios de planificación.
- Algoritmos de planificación: FCFS, SJF, Round Robin, prioridad, etc.
- Evaluación de rendimiento: throughput, tiempo de respuesta y tiempo de espera.
- Multiprogramación y multitarea.

### Unidad 4. Sincronización y concurrencia
- Condiciones de carrera.
- Secciones críticas.
- Mutex, semáforos y monitores.
- Comunicación entre procesos.
- Problemas clásicos: productor-consumidor, lectores-escritores, filósofos.

### Unidad 5. Interbloqueo
- Condición necesaria para el interbloqueo.
- Modelos de recursos.
- Detección, prevención, evitación y recuperación.
- Algoritmos de asignación segura.

### Unidad 6. Gestión de memoria
- Organización de la memoria principal.
- Particiones y asignación contigua.
- Segmentación y paginación.
- Tablas de páginas y traducción de direcciones.
- Fragmentación y políticas de asignación.

### Unidad 7. Memoria virtual
- Paginación bajo demanda.
- Reemplazo de páginas: FIFO, LRU, LFU, optimal.
- Marcas de referencia y bits de uso.
- Thrashing y su impacto en rendimiento.

### Unidad 8. Sistemas de archivos
- Conceptos de archivo, directorio y volumen.
- Estructuras lógicas y físicas.
- Métodos de acceso.
- Protección y permisos.
- Sistemas de archivos modernos.

### Unidad 9. Entrada/salida y dispositivos
- Administración de E/S.
- Controladores y drivers.
- Buffering, spooling y caché.
- Planificación de dispositivos.

### Unidad 10. Seguridad y protección
- Modelo de protección.
- Mecanismos de autenticación y permisos.
- Integridad y aislamiento de procesos.
- Principios de seguridad de sistemas operativos.

## 5. Distribución sugerida a lo largo del cuatrimestre

| Semana | Tema principal |
|---|---|
| 1 | Presentación y conceptos generales |
| 2 | Evolución y funciones del SO |
| 3 | Procesos y estados |
| 4 | Threads y concurrencia |
| 5 | Planificación de CPU |
| 6 | Planificación avanzada |
| 7 | Sincronización |
| 8 | Problemas clásicos de concurrencia |
| 9 | Interbloqueo |
| 10 | Gestión de memoria |
| 11 | Paginación y memoria virtual |
| 12 | Reemplazo de páginas |
| 13 | Sistemas de archivos |
| 14 | E/S y seguridad |
| 15 | Integración y repaso final |

## 6. Evaluación sugerida
- Parciales teóricos: 40%
- Trabajos prácticos y ejercicios: 30%
- Evaluación de laboratorio o simulación: 20%
- Participación y resolución de casos: 10%

## 7. Criterios de aprobación
- Comprensión conceptual de los temas principales.
- Capacidad de resolver problemas con razonamiento técnico.
- Correcta utilización de terminología del área.
- Habilidad para relacionar teoría y práctica.

## 8. Bibliografía mínima recomendada
- Silberschatz et al. - Operating System Concepts
- Tanenbaum y Bos - Modern Operating Systems
- Stallings - Operating Systems: Internals and Design Principles

## 9. Producto esperado del curso
El estudiante debe poder explicar cómo funciona un sistema operativo en términos de gestión de recursos, concurrencia y rendimiento, y aplicar esos principios al análisis de sistemas reales y ejercicios académicos.
