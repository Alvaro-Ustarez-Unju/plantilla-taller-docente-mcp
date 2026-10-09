# SDD — Spec-Driven Development: Examen de 3 Temas
**Asignatura:** Algoritmos y Programación (Módulo 2)  
**Instancia:** [2do Parcial / 2do Simulacro / Recuperatorio Extraordinario]  
**Eje Temático:** [Nombre del Eje General, ej. Empresas Argentinas / Misión Espacial / F1]  
**Fecha:** [DD/MM/AAAA]  
**Duración:** 120-150 minutos  

---

## 1. Visión General y Eje Narrativo

### 1.1 Contexto Global
[Descripción breve del contexto inmersivo en el cual se ambientan los 3 problemas de examen. Ejemplo: Gestión logística y operativa de plantas industriales argentinas de alta exigencia.]

### 1.2 Estructura y Distribución de Puntaje
La evaluación consta de dos partes indivisibles:
- **Parte 1: Implementación en Código (PSeInt / C++) — 75%**
  - Estructura Principal y Menú (`Segun` / `switch`): **5%**
  - Módulo de Entrada y Validación de Rangos: **15%**
  - Módulo de Proceso 1 (Ciclos, Centinela y Acumuladores): **25%**
  - Módulo de Proceso 2 (Ciclo `Para`, Métrica y Búsqueda de Extremos): **30%**
- **Parte 2: Prueba de Escritorio (Papel y Lápiz) — 25%**
  - Trazado de variables, cantidad de iteraciones, condición lógica de salida y salida final.

---

## 2. Especificación de los 3 Temas

```
+---------------------------------------------------------------------------------------------------+
|                                  MATRIZ COMPARATIVA DE LOS 3 TEMAS                                |
+--------------------------+------------------------------+--------------------+--------------------+
| Dimensión                | Tema 1                       | Tema 2             | Tema 3             |
+--------------------------+------------------------------+--------------------+--------------------+
| Dominio / Contexto       | [Ej. YPF Refinería]          | [Ej. Quilmes Log.] | [Ej. Serenísima]   |
| Variable Entrada 1       | [tanques (1-15)]             | [lotes (1-12)]     | [silos (1-10)]     |
| Variable Entrada 2       | [capacidad (200-5000)]       | [volumen (100-3000)| [presión (50-1500)]|
| Proceso 1: Centinela     | [-1 o 0]                     | [-1 o 0]           | [-1 o 0]           |
| Proceso 1: Acumulador    | [mermas]                     | [despachos]        | [mermas lácteas]   |
| Proceso 1: Cálculo       | [% merma sobre esperado]     | [% merma / stock]  | [% merma / ordeñe] |
| Proceso 1: Estados       | Óptimo / Aceptable / Crítico | Idem               | Idem               |
| Proceso 2: Búsqueda      | MÁXIMO (Caudal)              | MÍNIMO (Tiempos)   | MÁXIMO (Rendim.)   |
| Proceso 2: Identificador | Nro de Tanque                | Nro de Lote        | Nro de Silo        |
| Escritorio: Iteraciones  | 4 o 5                        | 4 o 5              | 4 o 5              |
+--------------------------+------------------------------+--------------------+--------------------+
```

---

### 2.1 Tema 1: [Nombre de Fantasía del Tema 1]

- **Contexto Narrativo:**  
  [Descripción de la situación problemática en 2 o 3 párrafos.]
- **Módulo de Menú (`Segun` / `switch`):**
  - Opción 1: [Ingresar Datos]
  - Opción 2: [Proceso 1]
  - Opción 3: [Proceso 2]
  - Opción 4: [Mostrar Estado]
  - Opción 0: Salir
- **Módulo de Entrada y Validación:**
  - Variable(s) a ingresar: `[var1]`, `[var2]`.
  - Rango válido: `[A]` a `[B]`.
  - Validación con bucle `Repetir...Hasta Que`. Mensaje de error ante falla.
- **Módulo de Proceso 1 (Ciclos y Acumuladores):**
  - Variable de corte (centinela): valor `[0 / -1]`.
  - Acumulación: sumatoria de `[variable]`.
  - Cálculo: `[fórmula matemática precisa]`.
  - Clasificación condicional:
    - Menor a X%: [Estado 1]
    - Entre X% e Y%: [Estado 2]
    - Mayor a Y%: [Estado 3]
- **Módulo de Proceso 2 (Búsqueda de Extremos con Ciclo Determinado):**
  - Ciclo `Para` de 1 hasta `[var_entrada]`.
  - Ingreso de datos por iteración.
  - Cálculo de métrica unitaria: `[métrica] = [datoA] / [datoB]`.
  - Determinación de [MÁXIMO / MÍNIMO] y almacenamiento del identificador `[posicion/nombre]`.
- **Módulo de Estado Actual:**
  - Impresión de los valores actuales de las variables de configuración.
- **Parte 2: Algoritmo de Prueba de Escritorio:**
  ```text
  Algoritmo PruebaEscritorio_Tema1
      // [Pseudocódigo preciso de 12-16 líneas con bucle Mientras y 3 variables]
  FinAlgoritmo
  ```
  - **Tabla de Traza Esperada:**
    | Paso / Iteración | Var1 | Var2 | Var3 | Condición de Bucle | Salida en Pantalla |
    | :---: | :---: | :---: | :---: | :---: | :---: |
    | Inicio | ... | ... | ... | ... | |
    | Iteración 1 | ... | ... | ... | V | |
    | ... | ... | ... | ... | ... | |
    | Fin | ... | ... | ... | F (Corta ciclo) | [Texto exacto impreso] |
  - **Cantidad exacta de iteraciones:** [N]
  - **Condición lógica de salida:** `[expresión booleana]`

---

### 2.2 Tema 2: [Nombre de Fantasía del Tema 2]

- **Contexto Narrativo:** [Descripción inmersiva]
- **Módulo de Menú:** Opciones 1 a 4 y 0.
- **Módulo de Entrada y Validación:** Rango `[A]` a `[B]`.
- **Módulo de Proceso 1:** Centinela, acumulador, cálculo y estados.
- **Módulo de Proceso 2:** Ciclo `Para`, métrica y búsqueda de extremo [MÁXIMO / MÍNIMO] con identificador.
- **Módulo de Estado Actual:** Reporte de variables base.
- **Parte 2: Algoritmo de Prueba de Escritorio:**
  - Pseudocódigo con estructura equivalente.
  - Tabla de traza resuelta con igual número de iteraciones y complejidad.

---

### 2.3 Tema 3: [Nombre de Fantasía del Tema 3]

- **Contexto Narrativo:** [Descripción inmersiva]
- **Módulo de Menú:** Opciones 1 a 4 y 0.
- **Módulo de Entrada y Validación:** Rango `[A]` a `[B]`.
- **Módulo de Proceso 1:** Centinela, acumulador, cálculo y estados.
- **Módulo de Proceso 2:** Ciclo `Para`, métrica y búsqueda de extremo [MÁXIMO / MÍNIMO] con identificador.
- **Módulo de Estado Actual:** Reporte de variables base.
- **Parte 2: Algoritmo de Prueba de Escritorio:**
  - Pseudocódigo con estructura equivalente.
  - Tabla de traza resuelta con igual número de iteraciones y complejidad.

---

## 3. Matriz de Paridad Cognitiva y Psicométrica

Demostración técnica de que ningún alumno cuenta con ventajas ni desventajas en función del tema asignado:

| Criterio de Paridad | Tema 1 | Tema 2 | Tema 3 | Paridad Verificada |
| :--- | :--- | :--- | :--- | :---: |
| **Complejidad Ciclomática** | [X] caminos independientes | [X] caminos independientes | [X] caminos independientes | ✅ SÍ |
| **Número de Variables Principales** | [N] variables | [N] variables | [N] variables | ✅ SÍ |
| **Complejidad Aritmética** | Suma + Porcentaje | Suma + Porcentaje | Suma + Porcentaje | ✅ SÍ |
| **Tipo de Estructuras Utilizadas** | Repetir + Segun + Mientras + Para | Repetir + Segun + Mientras + Para | Repetir + Segun + Mientras + Para | ✅ SÍ |
| **Iteraciones de Prueba de Escritorio**| [K] iteraciones | [K] iteraciones | [K] iteraciones | ✅ SÍ |

---

## 4. Casos de Prueba (3 por Tema = 9 en total)

### 4.1 Casos de Prueba - Tema 1
- **Caso 1: Límites y Error en Entrada**
  - *Entrada Simulada:*
    ```text
    1
    [valor_erroneo_inferior]
    [valor_erroneo_superior]
    [valor_valido]
    4
    0
    ```
  - *Salida Esperada:*
    ```text
    [Transcripción completa de consola]
    ```
- **Caso 2: Flujo Completo Normal (Cálculos y Extremos)**
  - *Entrada Simulada:*
    ```text
    ...
    ```
  - *Salida Esperada:*
    ```text
    ...
    ```
- **Caso 3: Valores Frontera / Mínimos**
  - *Entrada Simulada:*
    ```text
    ...
    ```
  - *Salida Esperada:*
    ```text
    ...
    ```

### 4.2 Casos de Prueba - Tema 2
- **Caso 1:** Límites y Error en Entrada.
- **Caso 2:** Flujo Completo Normal.
- **Caso 3:** Valores Frontera.

### 4.3 Casos de Prueba - Tema 3
- **Caso 1:** Límites y Error en Entrada.
- **Caso 2:** Flujo Completo Normal.
- **Caso 3:** Valores Frontera.

---

## 5. Plan de Generación de Entregables (Fase 2)

Una vez aprobado este documento SDD, se procederá a emitir:
1. `index.html` (Hub responsivo con cards para Tema 1, Tema 2 y Tema 3).
2. `tema1.html`, `tema2.html`, `tema3.html` con tabuladores y switch de código.
3. `resolucion-tema1.psc` y `.cpp`.
4. `resolucion-tema2.psc` y `.cpp`.
5. `resolucion-tema3.psc` y `.cpp`.
6. `rubrica.md` para evaluación docente.
7. `prueba_escritorio_imprimir.html` y `prueba_escritorio_resuelto.html`.
