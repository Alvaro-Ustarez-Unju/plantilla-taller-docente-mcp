# SDD — Spec-Driven Development: 3er Simulacro de Examen (Módulo 3)
**Asignatura:** Algoritmos y Programación (Cátedra AyP - C++)  
**Módulo:** Módulo 3 — Arreglos Unidimensionales y Operaciones Fundamentales en C++  
**Instancia:** 3er Simulacro de Examen (Ciclo Lectivo 2026)  
**Eje Temático General:** *La Guerra del Streaming Argentino: Telemetría y Métricas en Vivo*  
**Modalidad:** 100% Código en Computadora (Laboratorio de C++). Sin prueba de escritorio.  
**Tiempo Estimado:** 120 - 150 minutos  

---

## 1. Visión General y Eje Narrativo

### 1.1 Contexto Global
El ecosistema de medios en Argentina ha sido transformado por los grandes canales de streaming en vivo (**Luzu TV**, **Olga** y **Blender**). La competencia por el rating digital, la fidelización de audiencias y la monetización en directo exige sistemas de control técnico en tiempo real (*Master Control Room*).

Los sistemas deben procesar en memoria estática de alta velocidad las mediciones emitidas durante las transmisiones. Para ello, se implementa una colección basada en un **arreglo unidimensional estático** con estricto control de **Capacidad Física (`CAPACIDAD = 15`)** frente a **Tamaño Lógico (`tamanoLogico`)**, aplicando las operaciones fundamentales de carga a pedido del operador, validación, filtrado, búsqueda lineal, modificación y los algoritmos fundamentales de **baja física por desplazamiento a la izquierda (*Shift-Left*)** e **inserción intermedia por desplazamiento a la derecha (*Shift-Right*)**.

### 1.2 Estructura y Distribución de Puntaje (100% Código en C++)

| Bloque Evaluado | Ponderación | Criterio Técnico |
| :--- | :---: | :--- |
| **1. Menú Modular y Arquitectura** | **10%** | Prototipos formales, bucle `do-while`, menú con `switch`, funciones modulares independientes y pasaje estricto de parámetros. |
| **2. Carga / Inserción y Validación** | **20%** | Inserción en `arr[tam]`, control estricto de desbordamiento (`tam < CAPACIDAD`), validación de rangos con bucle interactivo, carga a pedido del operador (`Desea continuar ? (s/n)`) e incremento `tam++`. |
| **3. Consultas, Filtros y Estadísticas** | **20%** | Recorrido selectivo con `const`, aplicación de predicados condicionales, conteo de emisiones destacadas y cálculo de promedios/extremos. |
| **4. Búsqueda Lineal y Modificación** | **25%** | Búsqueda secuencial retornando índice o `-1`, modificación condicionada a la existencia previa y validación del nuevo valor. |
| **5. Algoritmo Clave: Shift-Left / Shift-Right** | **25%** | Desplazamiento contiguo en memoria ($\mathcal{O}(N)$): baja física con compactación hacia la izquierda (*Shift-Left*) decrementando `tam--` (Temas 1 y 3) o inserción intermedia con desplazamiento a derecha (*Shift-Right*) incrementando `tam++` (Tema 2). |

> [!WARNING]
> **Aviso de Andamiaje Pedagógico (Simulacro vs. Examen Parcial):**  
> En esta instancia de **Simulacro** se proporciona una plantilla de código base con el menú resuelto y los prototipos de función a modo de guía formativa.  
> **Para el Examen Parcial real NO se brindará dicha ayuda**: los estudiantes deberán desarrollar la solución íntegramente desde cero (inclusión de librerías, constantes, prototipos, bucle interactivo, menú `switch` y todos los subprocesos).

---

## 2. Matriz Comparativa de los 3 Temas

```
+-----------------------------------------------------------------------------------------------------------------+
|                                MATRIZ DE EQUIVALENCIA Y PARIDAD - STREAMING ARGENTINO                           |
+--------------------------+------------------------------+------------------------------+------------------------+
| Dimensión Técnica        | Tema 1: Luzu TV              | Tema 2: Olga                 | Tema 3: Blender        |
+--------------------------+------------------------------+------------------------------+------------------------+
| Canal / Productora       | Luzu TV (Nadie Dice Nada)    | Olga (Soñé que Volaba)       | Blender (Hay Algo Ahí) |
| Variable Monitoreada     | Espectadores Concurrentes    | Superchats / Donaciones      | Tiempo de Retención    |
| Unidad de Medida         | Miles de personas (float)    | Miles de pesos ARS (float)   | Minutos por sesión (fl)|
| Capacidad Física (CAP)   | 15                           | 15                           | 15                     |
| Invariante de Tamaño     | 0 <= tam <= 15               | 0 <= tam <= 15               | 0 <= tam <= 15         |
| Rango Válido             | [5.0 a 150.0] miles          | [1.0 a 80.0] miles de ARS    | [2.0 a 90.0] minutos   |
| Umbral de Filtrado       | > 60.0 miles ("Prime Time")  | > 25.0 miles ("Destacado")   | > 40.0 min ("Alta Fid")|
| Búsqueda Lineal          | Búsqueda por valor (índice)  | Búsqueda por valor (índice)  | Búsqueda por valor     |
| Modificación Condicionada| Recalibrar medición          | Corregir aporte              | Ajustar tiempo sesión  |
| Algoritmo Clave O(N)     | Baja Física (Shift-Left)     | Inserción Intermedia (ShiftR)| Baja Física (Shift-Left|
| Estadísticas Globales    | Promedio y Pico MÁXIMO       | Promedio y Aporte MÍNIMO     | Promedio y Pico MÁXIMO |
+--------------------------+------------------------------+------------------------------+------------------------+
```

---

## 3. Especificación Detallada de los Temas

### 3.1 Tema 1: Luzu TV — Control de Audiencia y Picos de Viewers en Vivo

- **Contexto Narrativo:**  
  La productora Luzu TV transmite en vivo programas de alta convocatoria como *Nadie Dice Nada*. En su sala de control técnico necesitan registrar los picos de audiencia concurrente (medidos en miles de espectadores) a lo largo de cada bloque horario. El sistema debe permitir registrar nuevas mediciones, listar los bloques de mayor éxito (*Prime Time*), modificar registros mal informados por la plataforma y descartar mediciones corruptas compactando el arreglo.

- **Constantes y Variables Globales:**
  ```cpp
  const int CAPACIDAD = 15;
  ```

- **Firmas Modulares (Contratos de Interfaz):**
  ```cpp
  void MostrarMenu(int &opc);
  void RegistrarAudiencia(float arr[], int &tam, int capacidad);
  void ListarAudiencias(const float arr[], int tam, float umbralPrimeTime);
  int BuscarAudiencia(const float arr[], int tam, float valorBuscado);
  void ModificarAudiencia(float arr[], int tam);
  void EliminarMedicion(float arr[], int &tam);
  void CalcularEstadisticas(const float arr[], int tam);
  ```

- **Especificación de Operaciones del Menú:**
  - **Opción 1: Registrar Mediciones de Audiencia:**
    - Carga interactiva a pedido del operador mediante bucle `do-while` consultando `Desea continuar ? (s/n)`.
    - En cada iteración verifica si `tam < CAPACIDAD`. Si el vector se llena, emite mensaje `[Aviso] Se alcanzo la capacidad maxima del arreglo (15 elementos).` y finaliza.
    - Solicita la cantidad de espectadores concurrentes (en miles).
    - Valida con ciclo repetitivo que el valor se encuentre en el rango `[5.0, 150.0]`. Ante valores fuera de rango muestra: `[Error] El valor debe estar entre 5.0 y 150.0 miles de viewers.`
    - Almacena el valor en `arr[tam]` e incrementa `tam++`.
  - **Opción 2: Listar Mediciones y Filtrar Prime Time:**
    - Si `tam == 0`, muestra `[Aviso] No hay mediciones registradas.`
    - Recorre de `0` a `tam - 1` mostrando el índice y el valor.
    - Cuenta y muestra cuántos bloques superaron el umbral de Prime Time (`> 60.0` miles).
  - **Opción 3: Búsqueda y Modificación:**
    - Solicita al usuario el valor de audiencia a buscar.
    - Invoca a `BuscarAudiencia()`, la cual retorna la posición o `-1`.
    - Si se encuentra: solicita el nuevo valor, lo valida en `[5.0, 150.0]` y lo asigna en `arr[pos]`.
    - Si no existe: informa `[Error] No se encontró ninguna medición con ese valor.`
  - **Opción 4: Eliminar Medición (Shift-Left):**
    - Solicita el valor a eliminar. Invoca a `BuscarAudiencia()`.
    - Si existe en la posición `pos`:
      - Desplaza todos los elementos a la izquierda desde `pos` hasta `tam - 2`: `arr[i] = arr[i + 1]`.
      - Decrementa el tamaño lógico: `tam--`.
      - Informa `[Éxito] Medición eliminada y arreglo compactado correctamente.`
    - Si no existe: muestra `[Error] Valor no encontrado. No se realizó ninguna eliminación.`
  - **Opción 5: Estadísticas de Transmisión:**
    - Si `tam == 0`, informa lista vacía.
    - Calcula y muestra el promedio de audiencia de la transmisión.
    - Determina y muestra el pico **MÁXIMO** de audiencia registrado y en qué posición ocurrió.
  - **Opción 0: Salir.**

---

### 3.2 Tema 2: Olga — Monitoreo de Superchats y Donaciones de la Comunidad

- **Contexto Narrativo:**  
  El canal Olga, liderado por Migue Granados con programas como *Soñé que Volaba*, cuenta con una comunidad muy activa que realiza donaciones y superchats en directo. El equipo de administración necesita supervisar los ingresos registrados durante una emisión especial solidaria (medidos en miles de pesos ARS). El sistema debe almacenar las donaciones mediante carga interactiva a pedido del operador, filtrar aquellas que califican como destacadas, permitir corregir aportes por errores de tipeo e incorporar donaciones intermedias prioritarias desplazando los elementos hacia la derecha (*Shift-Right*).

- **Constantes y Variables Globales:**
  ```cpp
  const int CAPACIDAD = 15;
  ```

- **Firmas Modulares (Contratos de Interfaz):**
  ```cpp
  void MostrarMenu(int &opc);
  void RegistrarDonacion(float arr[], int &tam, int capacidad);
  void ListarDonaciones(const float arr[], int tam, float umbralDestacado);
  int BuscarDonacion(const float arr[], int tam, float valorBuscado);
  void ModificarDonacion(float arr[], int tam);
  void InsertarDonacionIntermedia(float arr[], int &tam, int capacidad);
  void CalcularEstadisticas(const float arr[], int tam);
  ```

- **Especificación de Operaciones del Menú:**
  - **Opción 1: Registrar Donaciones de la Comunidad:**
    - Carga interactiva a pedido del operador mediante bucle `do-while` consultando `Desea continuar ? (s/n)`.
    - En cada iteración verifica `tam < CAPACIDAD`. Si está lleno, emite mensaje de aviso y finaliza.
    - Solicita el monto de la donación (en miles de pesos).
    - Valida con ciclo repetitivo que el monto esté en `[1.0, 80.0]`. Si no: `[Error] El monto debe estar entre 1.0 y 80.0 miles de ARS.`
    - Guarda en `arr[tam]` y realiza `tam++`.
  - **Opción 2: Listar Donaciones y Aportes Destacados:**
    - Si `tam == 0`, muestra `[Aviso] No hay donaciones registradas.`
    - Lista los aportes y contabiliza cuántos superan el umbral destacado (`> 25.0` miles de ARS).
  - **Opción 3: Búsqueda y Modificación:**
    - Pide el monto a buscar. Invoca `BuscarDonacion()`.
    - Si existe: solicita el monto corregido, lo valida en `[1.0, 80.0]` y lo actualiza en `arr[pos]`.
    - Si no existe: informa `[Error] No se encontró ninguna donación con ese monto.`
  - **Opción 4: Insertar Donación Intermedia (Shift-Right):**
    - Verifica si `tam < CAPACIDAD`. Si el vector está lleno, emite `[Error] Memoria llena. No es posible realizar inserciones intermedias.`
    - Si `tam == 0`, emite aviso de que no hay donaciones para insertar en posición intermedia.
    - Solicita la posición a insertar, validando en rango `[0, tam]`.
    - Solicita el monto de la donación a insertar, validando en rango `[1.0, 80.0]`.
    - Ejecuta el desplazamiento hacia la derecha (`arr[i] = arr[i-1]`) desde `tam` hasta `pos + 1`.
    - Asigna el dato en `arr[pos]` e incrementa `tam++` recibido por referencia. Informa éxito.
  - **Opción 5: Estadísticas de Recaudación:**
    - Calcula el monto promedio de donación.
    - Determina el aporte **MÍNIMO** recibido durante el programa y su posición.
  - **Opción 0: Salir.**

---

### 3.3 Tema 3: Blender — Telemetría de Retención y Tiempo de Visualización

- **Contexto Narrativo:**  
  El canal Blender, con programas como *Hay Algo Ahí* conducido por Tomás Rebord, analiza métricas profundas de comportamiento del usuario. Para optimizar el ritmo editorial, registran el tiempo de retención continua (medido en minutos de sesión) de los espectadores que interactúan activamente. El sistema debe registrar las muestras de retención, filtrar las sesiones de "Alta Fidelidad", corregir muestras descalibradas y depurar sesiones atribuidas a bots o conexiones fantasmas mediante compactación física del vector.

- **Constantes y Variables Globales:**
  ```cpp
  const int CAPACIDAD = 15;
  ```

- **Firmas Modulares (Contratos de Interfaz):**
  ```cpp
  void MostrarMenu(int &opc);
  void RegistrarRetencion(float arr[], int &tam, int capacidad);
  void ListarRetenciones(const float arr[], int tam, float umbralAltaFidelidad);
  int BuscarRetencion(const float arr[], int tam, float valorBuscado);
  void ModificarRetencion(float arr[], int tam);
  void EliminarSesion(float arr[], int &tam);
  void CalcularEstadisticas(const float arr[], int tam);
  ```

- **Especificación de Operaciones del Menú:**
  - **Opción 1: Registrar Sesión de Retención:**
    - Verifica `tam < CAPACIDAD`. Si está lleno, emite mensaje `[Error] Memoria llena. No es posible registrar más sesiones.`
    - Solicita los minutos de retención continua.
    - Valida que el valor esté en `[2.0, 90.0]`. Si no: `[Error] El tiempo de retención debe estar entre 2.0 y 90.0 minutos.`
    - Guarda en `arr[tam]` y realiza `tam++`.
  - **Opción 2: Listar Sesiones y Alta Fidelidad:**
    - Si `tam == 0`, muestra `[Aviso] No hay sesiones registradas.`
    - Lista las sesiones y cuenta cuántas superaron el umbral de Alta Fidelidad (`> 40.0` minutos).
  - **Opción 3: Búsqueda y Modificación:**
    - Pide el tiempo a buscar. Invoca `BuscarRetencion()`.
    - Si existe: solicita el nuevo tiempo corregido, lo valida en `[2.0, 90.0]` y lo actualiza en `arr[pos]`.
    - Si no existe: informa `[Error] No se encontró ninguna sesión con ese tiempo.`
  - **Opción 4: Eliminar Sesión Descartada (Shift-Left):**
    - Pide el tiempo de sesión a descartar. Invoca `BuscarRetencion()`.
    - Si existe en `pos`: compacta a izquierda (`arr[i] = arr[i+1]`) desde `pos` hasta `tam - 2` y decrementa `tam--`.
    - Si no existe: muestra `[Error] Sesión no encontrada. No se realizó ninguna eliminación.`
  - **Opción 5: Estadísticas de Fidelización:**
    - Calcula el tiempo promedio de retención de la comunidad.
    - Determina el pico **MÁXIMO** de permanencia continua registrada y su posición.
  - **Opción 0: Salir.**

---

## 4. Matriz de Paridad Psicométrica y Cognitiva

Para garantizar la igualdad de condiciones entre estudiantes que rindan cualquiera de los 3 temas, se valida la paridad en todas las dimensiones:

| Dimensión de Paridad | Tema 1 (Luzu TV) | Tema 2 (Olga) | Tema 3 (Blender) | ¿Paridad Cumplida? |
| :--- | :--- | :--- | :--- | :---: |
| **Complejidad Ciclomática** | 5 ramas de menú + validaciones | Idéntica | Idéntica | ✅ SÍ |
| **Complejidad Temporal** | Búsqueda $\mathcal{O}(N)$, Shift-Left $\mathcal{O}(N)$ | Búsqueda $\mathcal{O}(N)$, Shift-Right $\mathcal{O}(N)$ | Búsqueda $\mathcal{O}(N)$, Shift-Left $\mathcal{O}(N)$ | ✅ SÍ |
| **Contratos de Interfaz** | `const float arr[]`, `float arr[]`, `int &tam` | Idénticos | Idénticos | ✅ SÍ |
| **Cantidad de Módulos** | 7 funciones/procedimientos | 7 funciones | 7 funciones | ✅ SÍ |
| **Estructuras de Control** | `do-while`, `switch`, `while`, `for` | Idénticas | Idénticas | ✅ SÍ |
| **Operación de Extremo** | Máximo | Mínimo | Máximo | ✅ SÍ (equivalente) |

---

## 5. Casos de Prueba Formales (9 Casos Totales)

### 5.1 Casos de Prueba — Tema 1: Luzu TV

#### Caso 1: Validación de Rango y Límite de Capacidad
- **Entrada (Simulada):**
  ```text
  1
  3.2
  165.0
  85.5
  s
  120.0
  n
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  === SISTEMA DE TELEMETRÍA - LUZU TV ===
  1. Registrar Mediciones de Audiencia
  2. Listar Mediciones y Filtrar Prime Time
  3. Buscar y Modificar Medición
  4. Eliminar Medición (Compactar Arreglo)
  5. Ver Estadísticas de Transmisión
  0. Salir
  Ingrese una opción: > 1
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 3.2
  [Error] El valor debe estar entre 5.0 y 150.0 miles de viewers.
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 165.0
  [Error] El valor debe estar entre 5.0 y 150.0 miles de viewers.
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 85.5
  [Éxito] Medición registrada correctamente en la posición 0.
  Desea continuar ? (s/n): > s
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 120.0
  [Éxito] Medición registrada correctamente en la posición 1.
  Desea continuar ? (s/n): > n

  Ingrese una opción: > 2
  --- REGISTRO DE AUDIENCIAS LUZU TV ---
  [0] 85.50 miles de viewers
  [1] 120.00 miles de viewers
  Bloques en Prime Time (> 60.00 miles): 2 de 2 mediciones.

  Ingrese una opción: > 0
  Finalizando sistema de telemetría de Luzu TV.
  ```

#### Caso 2: Carga Múltiple, Modificación y Estadísticas
- **Entrada (Simulada):**
  ```text
  1
  45.0
  s
  95.0
  s
  110.0
  n
  3
  95.0
  105.0
  5
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opción: > 1
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 45.0
  [Éxito] Medición registrada correctamente en la posición 0.
  Desea continuar ? (s/n): > s
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 95.0
  [Éxito] Medición registrada correctamente en la posición 1.
  Desea continuar ? (s/n): > s
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 110.0
  [Éxito] Medición registrada correctamente en la posición 2.
  Desea continuar ? (s/n): > n

  Ingrese una opción: > 3
  Ingrese el valor de audiencia que desea buscar: > 95.0
  Medición encontrada en la posición 1.
  Ingrese el nuevo valor calibrado (5.0 - 150.0): > 105.0
  [Éxito] Medición actualizada correctamente.

  Ingrese una opción: > 5
  --- ESTADÍSTICAS DE TRANSMISIÓN ---
  Cantidad de mediciones procesadas: 3
  Promedio general de audiencia: 86.67 miles de viewers
  Pico Máximo de audiencia: 110.0 miles alcanzado en la posición 2.

  Ingrese una opción: > 0
  Finalizando sistema de telemetría de Luzu TV.
  ```

#### Caso 3: Búsqueda Fallida y Eliminación Física (Shift-Left)
- **Entrada (Simulada):**
  ```text
  1
  50.0
  s
  75.0
  s
  90.0
  n
  4
  999.0
  4
  75.0
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opción: > 1
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 50.0
  [Éxito] Medición registrada correctamente en la posición 0.
  Desea continuar ? (s/n): > s
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 75.0
  [Éxito] Medición registrada correctamente en la posición 1.
  Desea continuar ? (s/n): > s
  Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): > 90.0
  [Éxito] Medición registrada correctamente en la posición 2.
  Desea continuar ? (s/n): > n

  Ingrese una opción: > 4
  Ingrese el valor de audiencia a eliminar: > 999.0
  [Error] Valor no encontrado. No se realizó ninguna eliminación.

  Ingrese una opción: > 4
  Ingrese el valor de audiencia a eliminar: > 75.0
  [Éxito] Medición eliminada y arreglo compactado correctamente.

  Ingrese una opción: > 2
  --- REGISTRO DE AUDIENCIAS LUZU TV ---
  [0] 50.00 miles de viewers
  [1] 90.00 miles de viewers
  Bloques en Prime Time (> 60.00 miles): 1 de 2 mediciones.

  Ingrese una opción: > 0
  Finalizando sistema de telemetría de Luzu TV.
  ```

---

### 5.2 Casos de Prueba — Tema 2: Olga

#### Caso 1: Validación de Rango y Capacidad
- **Entrada (Simulada):**
  ```text
  1
  0.5
  95.0
  30.0
  s
  50.0
  n
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  === SISTEMA DE DONACIONES - OLGA EN VIVO ===
  1. Registrar Donaciones de la Comunidad
  2. Listar Donaciones y Filtrar Destacadas
  3. Buscar y Modificar Donación
  4. Insertar Donacion Intermedia
  5. Ver Estadísticas de Recaudación
  0. Salir
  Ingrese una opción: > 1
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 0.5
  [Error] El monto debe estar entre 1.0 y 80.0 miles de ARS.
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 95.0
  [Error] El monto debe estar entre 1.0 y 80.0 miles de ARS.
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 30.0
  [Éxito] Donación registrada correctamente en la posición 0.
  Desea continuar ? (s/n): > s
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 50.0
  [Éxito] Donación registrada correctamente en la posición 1.
  Desea continuar ? (s/n): > n

  Ingrese una opción: > 2
  --- REGISTRO DE DONACIONES OLGA ---
  [0] $ 30.00 miles de ARS
  [1] $ 50.00 miles de ARS
  Aportes destacados (> 25.00 miles): 2 de 2 donaciones.

  Ingrese una opción: > 0
  Finalizando sistema de donaciones de Olga.
  ```

#### Caso 2: Modificación de Aporte y Estadísticas con Mínimo
- **Entrada (Simulada):**
  ```text
  1
  15.0
  s
  40.0
  s
  10.0
  n
  3
  40.0
  45.0
  5
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opción: > 1
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 15.0
  [Éxito] Donación registrada correctamente en la posición 0.
  Desea continuar ? (s/n): > s
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 40.0
  [Éxito] Donación registrada correctamente en la posición 1.
  Desea continuar ? (s/n): > s
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 10.0
  [Éxito] Donación registrada correctamente en la posición 2.
  Desea continuar ? (s/n): > n

  Ingrese una opción: > 3
  Ingrese el monto de donación que desea buscar: > 40.0
  Donación encontrada en la posición 1.
  Ingrese el nuevo monto corregido (1.0 - 80.0): > 45.0
  [Éxito] Donación actualizada correctamente.

  Ingrese una opción: > 5
  --- ESTADÍSTICAS DE RECAUDACIÓN ---
  Cantidad de donaciones procesadas: 3
  Promedio general de donación: $ 23.33 miles de ARS
  Aporte Mínimo recibido: $ 10.0 miles registrado en la posición 2.

  Ingrese una opción: > 0
  Finalizando sistema de donaciones de Olga.
  ```

#### Caso 3: Inserción Intermedia Shift-Right
- **Entrada (Simulada):**
  ```text
  1
  20.0
  s
  60.0
  s
  15.0
  n
  4
  -1
  99
  1
  99.0
  35.0
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opción: > 1
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 20.0
  [Éxito] Donación registrada correctamente en la posición 0.
  Desea continuar ? (s/n): > s
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 60.0
  [Éxito] Donación registrada correctamente en la posición 1.
  Desea continuar ? (s/n): > s
  Ingrese monto de donación en miles de ARS (1.0 - 80.0): > 15.0
  [Éxito] Donación registrada correctamente en la posición 2.
  Desea continuar ? (s/n): > n

  Ingrese una opción: > 4
  Ingrese la posicion donde desea insertar (0 a 3): > -1
  [Error] Posicion invalida. Debe ser un indice entre 0 y 3.
  Ingrese la posicion donde desea insertar (0 a 3): > 99
  [Error] Posicion invalida. Debe ser un indice entre 0 y 3.
  Ingrese la posicion donde desea insertar (0 a 3): > 1
  Ingrese monto de donacion a insertar en miles de ARS (1.0 - 80.0): > 99.0
  [Error] El monto debe estar entre 1.0 y 80.0 miles de ARS.
  Ingrese monto de donacion a insertar en miles de ARS (1.0 - 80.0): > 35.0
  [Éxito] Donacion insertada correctamente en la posicion 1.

  Ingrese una opción: > 2
  --- REGISTRO DE DONACIONES OLGA ---
  [0] $ 20.00 miles de ARS
  [1] $ 35.00 miles de ARS
  [2] $ 60.00 miles de ARS
  [3] $ 15.00 miles de ARS
  Aportes destacados (> 25.00 miles): 2 de 4 donaciones.
  Ingrese una opción: > 0
  Finalizando sistema de donaciones de Olga.
  ```

---

### 5.3 Casos de Prueba — Tema 3: Blender

#### Caso 1: Validación de Rango y Capacidad
- **Entrada (Simulada):**
  ```text
  1
  1.0
  110.0
  25.0
  1
  55.0
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  === SISTEMA DE TELEMETRÍA - BLENDER ===
  1. Registrar Sesión de Retención
  2. Listar Sesiones y Filtrar Alta Fidelidad
  3. Buscar y Modificar Sesión
  4. Descartar Sesión (Compactar Arreglo)
  5. Ver Estadísticas de Fidelización
  0. Salir
  Ingrese una opción: > 1
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 1.0
  [Error] El tiempo de retención debe estar entre 2.0 y 90.0 minutos.
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 110.0
  [Error] El tiempo de retención debe estar entre 2.0 y 90.0 minutos.
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 25.0
  [Éxito] Sesión registrada correctamente en la posición 0.

  Ingrese una opción: > 1
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 55.0
  [Éxito] Sesión registrada correctamente en la posición 1.

  Ingrese una opción: > 2
  --- REGISTRO DE RETENCIÓN BLENDER ---
  [0] 25.0 minutos
  [1] 55.0 minutos
  Sesiones con Alta Fidelidad (> 40.0 min): 1 de 2 sesiones.

  Ingrese una opción: > 0
  Finalizando sistema de telemetría de Blender.
  ```

#### Caso 2: Modificación y Estadísticas de Retención
- **Entrada (Simulada):**
  ```text
  1
  30.0
  1
  65.0
  1
  80.0
  3
  65.0
  70.0
  5
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opción: > 1
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 30.0
  [Éxito] Sesión registrada correctamente en la posición 0.

  Ingrese una opción: > 1
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 65.0
  [Éxito] Sesión registrada correctamente en la posición 1.

  Ingrese una opción: > 1
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 80.0
  [Éxito] Sesión registrada correctamente en la posición 2.

  Ingrese una opción: > 3
  Ingrese el tiempo de sesión que desea buscar: > 65.0
  Sesión encontrada en la posición 1.
  Ingrese el nuevo tiempo corregido (2.0 - 90.0): > 70.0
  [Éxito] Sesión actualizada correctamente.

  Ingrese una opción: > 5
  --- ESTADÍSTICAS DE FIDELIZACIÓN ---
  Cantidad de sesiones procesadas: 3
  Promedio general de permanencia: 60.00 minutos
  Pico Máximo de permanencia: 80.0 minutos registrado en la posición 2.

  Ingrese una opción: > 0
  Finalizando sistema de telemetría de Blender.
  ```

#### Caso 3: Descarte de Sesión Bot y Compactación Shift-Left
- **Entrada (Simulada):**
  ```text
  1
  15.0
  1
  50.0
  1
  85.0
  4
  50.0
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opción: > 1
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 15.0
  [Éxito] Sesión registrada correctamente en la posición 0.

  Ingrese una opción: > 1
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 50.0
  [Éxito] Sesión registrada correctamente en la posición 1.

  Ingrese una opción: > 1
  Ingrese tiempo de retención en minutos (2.0 - 90.0): > 85.0
  [Éxito] Sesión registrada correctamente en la posición 2.

  Ingrese una opción: > 4
  Ingrese el tiempo de sesión a descartar: > 50.0
  [Éxito] Sesión eliminada y arreglo compactado correctamente.

  Ingrese una opción: > 2
  --- REGISTRO DE RETENCIÓN BLENDER ---
  [0] 15.0 minutos
  [1] 85.0 minutos
  Sesiones con Alta Fidelidad (> 40.0 min): 1 de 2 sesiones.

  Ingrese una opción: > 0
  Finalizando sistema de telemetría de Blender.
  ```

---

## 6. Plan de Generación de Entregables (Fase 2)

Una vez obtenida la conformidad del docente sobre este `SDD.md`, se procederá a la emisión de los 6 artefactos de la Fase 2 en la carpeta `modulo-3/Examenes/3er-Simulacro-2026/`:
1. `index.html`: Portal principal con las tarjetas interactivas de **Luzu TV**, **Olga** y **Blender** con diseño Tailwind CSS y Google Fonts.
2. `tema1.html`: Enunciado web interactivo de Luzu TV (100% C++, tabs de casos de prueba, código base).
3. `tema2.html`: Enunciado web interactivo de Olga (100% C++, tabs de casos de prueba, código base).
4. `tema3.html`: Enunciado web interactivo de Blender (100% C++, tabs de casos de prueba, código base).
5. `resolucion-tema1.cpp`, `resolucion-tema2.cpp`, `resolucion-tema3.cpp`: Códigos de solución modelo compilables en C++ con todas las operaciones implementadas.
6. `rubrica.md`: Rúbrica de evaluación docente estandarizada (100% código, 0% prueba de escritorio).
