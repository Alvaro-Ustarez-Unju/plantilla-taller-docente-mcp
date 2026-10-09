# Rúbrica de Evaluación — 3er Simulacro de Examen (Módulo 3)
**Asignatura:** Algoritmos y Programación (Cátedra AyP - C++)  
**Módulo:** Módulo 3 — Arreglos Unidimensionales y Operaciones Fundamentales en C++  
**Eje Temático:** La Guerra del Streaming Argentino (Luzu TV, Olga, Blender)  
**Modalidad:** 100% Código en Computadora (Sin prueba de escritorio)  

Esta rúbrica establece los criterios objetivos para la corrección y calificación de las entregas de código en C++, totalizando **100 puntos**.

---

## 1. Menú Modular y Arquitectura del Programa (10%)
Se evalúa la coordinación de subprogramas en el `main()`, la estructura de control de repetición y selección múltiple, y el uso correcto de firmas y prototipos.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Menú y Switch Modular** | Implementa un bucle `do-while` con estructura `switch` limpia. Las opciones invocan funciones modulares pasando los parámetros adecuados (por referencia `int &tam` para inserciones/bajas, y por valor o `const` para lecturas). Menú encapsulado en `MostrarMenu()`. | El menú funciona pero presenta errores menores: pasa parámetros por referencia innecesariamente, duplica código dentro del `switch` o no separa la interfaz en un procedimiento dedicado. | No implementa menú interactivo, utiliza bucles infinitos no controlados, recurre a variables globales o agrupa toda la lógica en un `main()` monolítico sin modularizar. |

---

## 2. Carga / Inserción y Validación de Rango (20%)
Se evalúa la inserción de nuevos elementos controlando la capacidad máxima de memoria, la validación iterativa del dato y la carga a pedido del operador mediante confirmación interactiva (`Desea continuar ? (s/n)`).

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Control de Desbordamiento, Carga y Rango** | Verifica estrictamente `tam < CAPACIDAD` antes de solicitar el dato. Implementa un bucle interactivo a pedido del operador consultando si desea continuar. Valida que el valor esté en el rango numérico especificado emitiendo mensaje de error. Asigna en `arr[tam]` e incrementa `tam++`. Si el arreglo se llena, finaliza con mensaje oportuno. | Valida el rango pero no controla el desbordamiento de memoria (`tam >= CAPACIDAD`), o no implementa la confirmación interactiva para continuar cargando, o actualiza incorrectamente el índice. | No valida el rango numérico (acepta cualquier valor) o no actualiza el tamaño lógico del vector tras la carga. |

---

## 3. Consultas, Filtros y Estadísticas (20%)
Se evalúa el recorrido incondicional y condicional del arreglo respetando el tamaño lógico y aplicando predicados relacionales.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Recorridos y Filtros** | Protege el arreglo con `const` en el parámetro. Recorre estrictamente de `0` a `tam-1`. Muestra los datos formateados y cuenta con precisión cuántos superan el umbral relacional (Prime Time / Destacados / Alta Fidelidad). Muestra caso vector vacío. | Recorre el arreglo pero itera hasta `CAPACIDAD` procesando celdas con basura en memoria, o comete errores aritméticos en el cálculo del promedio/contador de filtro. | No implementa la lógica de filtrado o no respeta el tamaño lógico válido, generando lecturas fuera de rango. |

---

## 4. Búsqueda Lineal y Modificación (25%)
Se evalúa la implementación de una función de búsqueda secuencial y su reutilización para modificar datos existentes.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Búsqueda y Modificación** | Función de búsqueda secuencial independiente que recorre el vector y retorna el índice exacto (`0` a `tam-1`) o centinela (`-1`). El módulo de modificación invoca la búsqueda y, solo si existe, solicita el nuevo valor, lo valida y sobrescribe en `arr[pos]`. | La búsqueda funciona pero no está modularizada (código duplicado dentro de modificar), o permite modificar un valor sin validar el nuevo dato ingresado. | No implementa la búsqueda secuencial, no maneja el caso de elemento no encontrado o corrompe los índices del vector. |

---

## 5. Algoritmo Clave: Eliminación Shift-Left / Inserción Shift-Right (25%)
Se evalúa la capacidad de desplazar elementos en memoria contigua: baja física sin dejar huecos (*Shift-Left*) o inserción en posición intermedia abriendo espacio (*Shift-Right*).

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Shift-Left / Shift-Right** | **Temas 1 y 3 (Shift-Left):** Localiza la posición a eliminar. Si existe, ejecuta un ciclo desde `pos` hasta `tam - 2` desplazando los elementos siguientes: `arr[i] = arr[i + 1]`. Decrementa obligatoriamente el tamaño lógico (`tam--`) por referencia.<br>**Tema 2 (Shift-Right):** Valida `tam < CAPACIDAD` y posición `[0, tam]`. Desplaza hacia la derecha de atrás hacia adelante (`arr[i] = arr[i - 1]`) desde `tam` hasta `pos + 1`. Inserta en `arr[pos]` e incrementa `tam++` por referencia. | Realiza el desplazamiento pero con error en los límites del ciclo (duplicaciones, sobreescrituras en cadena o *off-by-one*), o no actualiza `tam` por referencia. | Aplica "baja o inserción mágica" pisando celdas sin desplazar elementos contiguos, o no actualiza el tamaño lógico. |

---

### Penalizaciones Directas
- **-10% sobre la nota total:** Código sin sangría (indentación) o con formato desordenado que dificulte la lectura.
- **-10% sobre la nota total:** Nombres de variables crípticos o no semánticos (ej: `a`, `b`, `x1` en lugar de `audiencias`, `tam`, `monto`).
- **-15% sobre la nota total:** Uso de variables globales para esquivar el pasaje de parámetros por valor y por referencia.
- **Anulación directa (Nota 0):** Evidencia comprobable de copia o plagio entre códigos entregados.

### Consideraciones Pedagógicas para el Docente
1. **Prioridad a la gestión de memoria estática:** El aspecto más crítico de este módulo es la comprensión de que un arreglo estático parcialmente lleno se administra siempre mediante el par `arr[]` y `tam`. Cualquier acceso a índices $\ge tam$ debe ser penalizado.
2. **Modularidad estricta:** Verificar que las funciones auxiliares de lectura no modifiquen el tamaño lógico y que las funciones de modificación de estructura reciban `int &tam`.
3. **Manejo de decimales:** El formateo con `<iomanip>` (`fixed`, `setprecision`) es deseable para la presentación en pantalla, pero no debe invalidar la lógica central si el alumno utilizó impresión básica con `cout`.
