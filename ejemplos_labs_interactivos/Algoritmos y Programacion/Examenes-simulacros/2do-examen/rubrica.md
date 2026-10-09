# Rúbrica de Evaluación - 2do Examen (Módulo 2)
**Asignatura:** Algoritmos y Programación
**Temas:** 1 y 2 (Mundial 2026)

Esta rúbrica establece los criterios estandarizados para la evaluación y calificación de las resoluciones entregadas por los alumnos (en PSeInt o C++).

---

## 1. Estructura Principal y Menú (5%)
Se evalúa la correcta implementación de la selección múltiple en el menú de opciones del programa principal.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Estructura Segun/Switch** | Implementa correctamente la estructura condicional múltiple, invocando los subprocesos correspondientes a cada opción (1, 2, 3, 4 y 0). | Implementa la estructura pero con errores menores (ej. falta llamar a un submódulo o manejar una opción). | No implementa la estructura correctamente, usa múltiples condicionales simples de manera ineficiente o no funciona. |

## 2. Módulo de Entrada y Validación (15%)
Se evalúa la capacidad de solicitar datos y asegurar que cumplan con las restricciones establecidas.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Validación de Rangos** | Utiliza una estructura repetitiva (Repetir/Mientras o do-while/while) adecuada para validar que el dato (Amistosos o Presupuesto) esté estrictamente dentro del rango solicitado. | Realiza la validación pero permite valores límite incorrectos o el bucle se ejecuta de manera no óptima. | No valida el ingreso de datos o la validación es totalmente incorrecta (ej. usa solo un `Si` simple). |

## 3. Módulo de Proceso 1 - Ciclos y Acumuladores (25%)
Se evalúa el uso de ciclos controlados por evento o condición, y el manejo de acumuladores/saldos.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Corte de Control / Umbrales** | Implementa un ciclo (Mientras/Repetir) que corta correctamente al ingresar `0` (Tema 1) o cuando el saldo cae por debajo del umbral (Tema 2). | El ciclo corta pero tiene errores lógicos menores (ej. ejecuta una iteración extra o condición de corte dudosa). | El ciclo no corta cuando debería o se genera un bucle infinito. |
| **Acumuladores y Cálculos** | Acumula correctamente los pases/gastos y calcula el porcentaje u operaciones aritméticas sin errores de lógica. | Calcula con errores de tipo de dato (ej. división entera en vez de real) o acumula de forma errónea el último valor. | Los cálculos son erróneos o no usa acumuladores. |

## 4. Módulo de Proceso 2 - Búsqueda de Extremos (30%)
Se evalúa el algoritmo para determinar máximos o mínimos y asociarles información correspondiente.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Algoritmo de Extremos** | Inicializa correctamente la variable extremo (bandera o valor extremo) y encuentra exitosamente el Máximo/Mínimo junto a su identificador (partido/nombre). | Encuentra el extremo pero falla en casos límite (ej. inicializa mal la variable de comparación) o pierde la referencia del identificador. | No implementa la lógica de búsqueda de máximos o mínimos. |
| **Ciclos Definidos** | Utiliza un ciclo (Para/For o similar) de manera adecuada según la cantidad ingresada. | Usa un ciclo pero sus límites son incorrectos (off-by-one). | No usa ciclos para procesar los datos iterativos. |

## 5. Prueba de Escritorio (25%)
Se evalúa el seguimiento manual de algoritmos.

| Criterio | Excelente (100%) | Aceptable (50%) | Insuficiente (0%) |
| :--- | :--- | :--- | :--- |
| **Traza de Variables y Salida** | Refleja paso a paso el cambio de valor de cada variable y anota la salida exacta por pantalla esperada. | Registra la mayoría de los cambios pero comete algún error aritmético o de condición; la salida es parcialmente correcta. | La prueba de escritorio es incomprensible, está vacía o la salida no tiene relación con el algoritmo. |

---

### Penalizaciones
- **-10% sobre la nota total**: Código sin indentación (sangría) o extremadamente desordenado.
- **-10% sobre la nota total**: Nombres de variables poco descriptivos (ej. usar `a`, `b`, `c` en lugar de `presupuesto`, `gasto`).
- **Anulación**: Evidencia de copia o plagio entre entregas.

### Consideraciones Generales para el Docente
- Si el alumno eligió C++, ser tolerante con errores de sintaxis menores propios de la transición desde PSeInt, priorizando siempre la **lógica del algoritmo**.
- Los cálculos de porcentajes pueden mostrar decimales o redondearse; ambas son aceptables siempre que la matemática sea correcta.
- En la prueba de escritorio, valorar el procedimiento y la comprensión del ciclo `Mientras` / `Repetir` por sobre pequeños errores de suma aritmética manual.
