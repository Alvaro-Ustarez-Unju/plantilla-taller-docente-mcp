# Rúbrica de Evaluación — 3er Examen Parcial (Módulo 3)
**Asignatura:** Algoritmos y Programación (Cátedra AyP - C++)  
**Módulo:** Módulo 3 — Arreglos Unidimensionales y Operaciones Fundamentales en C++  
**Instancia:** 3er Examen Parcial (Ciclo Lectivo 2026)  
**Eje Temático:** Venta de Entradas y Boletería de Eventos Populares Argentinos (Cine Gaumont, Teatro Gran Rex, Cosquín Rock)  
**Modalidad:** 100% Código en Computadora (Sin prueba de escritorio)  
**Condición Especial:** Desarrollo 100% desde cero (Sin código base de ayuda).

Esta rúbrica establece los criterios objetivos para la corrección y calificación de las entregas de código en C++, totalizando **100 puntos**.

---

## 1. Menú Modular y Arquitectura del Programa (10%)
Se evalúa la coordinación de subprogramas en el `main()`, la estructura de control de repetición y selección múltiple, y el uso correcto de firmas y prototipos sin código base provisto.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Menú y Switch Modular** | Implementa un bucle `do-while` con estructura `switch` limpia. Las opciones invocan funciones modulares pasando los parámetros adecuados (por referencia `int &tam` para inserciones/bajas, y por valor o `const` para lecturas). Menú encapsulado en `MostrarMenu()`. | El menú funciona pero presenta errores menores: pasa parámetros por referencia innecesariamente, duplica código dentro del `switch` o no separa la interfaz en un procedimiento dedicado. | No implementa menú interactivo, utiliza bucles infinitos no controlados, recurre a variables globales o agrupa toda la lógica en un `main()` monolítico sin modularizar. |

---

## 2. Carga / Inserción y Validación de Rango (20%)
Se evalúa la inserción de nuevos elementos controlando la capacidad máxima de memoria (`tam < CAPACIDAD`) y la validación iterativa del dato en el rango estipulado.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Control de Desbordamiento y Rango** | Verifica estrictamente `tam < CAPACIDAD` antes de solicitar el dato emitiendo aviso de lleno. Implementa un bucle `do-while` / `while` para validar que el valor esté en el rango numérico especificado emitiendo mensaje de error. Asigna en `arr[tam]` e incrementa `tam++`. | Valida el rango pero no controla el desbordamiento de memoria (`tam >= CAPACIDAD`), o actualiza incorrectamente el índice provocando escrituras fuera de límite (*buffer overflow*). | No valida el rango numérico (acepta cualquier valor) o no actualiza el tamaño lógico del vector tras la carga. |

---

## 3. Consultas, Filtros y Estadísticas (20%)
Se evalúa el recorrido incondicional y condicional del arreglo respetando el tamaño lógico y aplicando predicados relacionales.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Recorridos y Filtros con `const`** | Protege el arreglo con `const` en el parámetro. Recorre estrictamente de `0` a `tam-1`. Muestra los datos formateados y cuenta con precisión cuántos superan el umbral relacional (Sala Llena / Gran Convocatoria / Aforo Agotado). Muestra aviso si el vector está vacío y calcula promedios y extremos correctamente. | Recorre el arreglo pero itera hasta `CAPACIDAD` procesando celdas con basura en memoria, o comete errores aritméticos en el cálculo del promedio o contador de filtro. | No implementa la lógica de filtrado o no respeta el tamaño lógico válido, generando lecturas fuera de rango o caídas del programa. |

---

## 4. Búsqueda Lineal y Modificación (25%)
Se evalúa la implementación de una función de búsqueda secuencial y su reutilización para modificar datos existentes.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Búsqueda y Modificación** | Función de búsqueda secuencial independiente que recorre el vector y retorna el índice exacto (`0` a `tam-1`) o centinela (`-1`). El módulo de modificación invoca la búsqueda y, solo si existe, solicita el nuevo valor, lo valida en el rango permitido y sobrescribe en `arr[pos]`. | La búsqueda funciona pero no está modularizada (código duplicado dentro de modificar), o permite modificar un valor sin validar el nuevo dato ingresado. | No implementa la búsqueda secuencial, no maneja el caso de elemento no encontrado o corrompe los índices del vector. |

---

## 5. Algoritmo Clave: Eliminación Física con Compactación Shift-Left (25%)
Se evalúa la capacidad de eliminar un elemento en memoria contigua sin dejar celdas vacías intermedias (*huecos*).

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Compactación Shift-Left** | Localiza la posición a eliminar. Si existe, ejecuta un ciclo desde `pos` hasta `tam - 2` desplazando los elementos siguientes: `arr[i] = arr[i + 1]`. Decrementa obligatoriamente el tamaño lógico (`tam--`) recibido por referencia. Informa si el elemento no fue hallado. | Realiza el desplazamiento pero con error en los límites del ciclo (deja el último elemento duplicado sin compactar o genera *off-by-one*), o no actualiza `tam` por referencia. | Aplica una "baja lógica" asignando cero o dejando huecos en el vector sin desplazar los elementos contiguos, o no decrementa el tamaño lógico. |

---

### Penalizaciones Directas
- **-10% sobre la nota total:** Código sin sangría (indentación) o con formato desordenado que dificulte la lectura.
- **-10% sobre la nota total:** Nombres de variables crípticos o no semánticos (ej: `a`, `b`, `x1` en lugar de `funciones`, `tam`, `entradas`).
- **-15% sobre la nota total:** Uso de variables globales para esquivar el pasaje de parámetros por valor y por referencia.
- **Anulación directa (Nota 0):** Evidencia comprobable de copia o plagio entre códigos entregados.

### Consideraciones Pedagógicas para el Docente
1. **Desarrollo desde Cero:** A diferencia del simulacro, el alumno no tuvo plantilla prehecha. Se debe valorar especialmente que haya respetado los prototipos solicitados y la división modular limpia.
2. **Prioridad a la gestión de memoria estática:** El aspecto más crítico de este módulo es la comprensión de que un arreglo estático parcialmente lleno se administra siempre mediante el par `arr[]` y `tam`. Cualquier acceso a índices $\ge tam$ debe ser penalizado.
3. **Modularidad estricta:** Verificar que las funciones de lectura no modifiquen el tamaño lógico (`const int arr[]`, `int tam`) y que las funciones de mutación estructural reciban `int &tam` por referencia.
4. **Formateo de salida:** El uso de `<iomanip>` (`fixed`, `setprecision`) es deseable para el promedio, pero no debe invalidar la lógica central si el estudiante utilizó impresión estándar con `cout`.
