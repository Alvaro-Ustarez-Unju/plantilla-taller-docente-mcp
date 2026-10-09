# SDD — Spec-Driven Development: 3er Examen Parcial (Módulo 3)
**Asignatura:** Algoritmos y Programación (Cátedra AyP - C++)  
**Módulo:** Módulo 3 — Arreglos Unidimensionales y Operaciones Fundamentales en C++  
**Instancia:** 3er Examen Parcial de Promoción / Regularidad (Ciclo Lectivo 2026)  
**Eje Temático General:** *Venta de Entradas y Boletería de Eventos Populares Argentinos (Cine, Teatro y Festivales)*  
**Modalidad:** 100% Código en Computadora (Laboratorio de C++). Sin prueba de escritorio.  
**Tiempo Estimado:** 120 - 150 minutos  
**Condición Especial:** **SIN CÓDIGO BASE.** Los estudiantes deberán desarrollar la solución completa desde cero (declaración de directivas, constantes, prototipos, función `main`, menú interactivo y la totalidad de los subprocesos).  

---

## 1. Visión General y Eje Narrativo

### 1.1 Contexto Global
El sector cultural y de entretenimiento masivo en Argentina moviliza a millones de personas anualmente a través de sus salas de cine emblemáticas (**Espacio INCAA / Cine Gaumont**), la mítica cartelera teatral de la Avenida Corrientes (**Teatro Gran Rex**) y los festivales de música al aire libre más convocantes del país (**Cosquín Rock / Quilmes Rock**).

Los sistemas de boletería y control de aforo requieren procesar con máxima velocidad y confiabilidad las cantidades de entradas emitidas en cada función o sector. La gestión se realiza en memoria física fija mediante un **arreglo unidimensional estático** con estricto control de **Capacidad Física (`CAPACIDAD = 15`)** frente a **Tamaño Lógico (`tamanoLogico`)**, aplicando operaciones de inserción validada, recorridos selectivos, búsqueda lineal, actualización de valores y **baja física con compactación por desplazamiento a la izquierda (*Shift-Left*)**.

```
Representación en Memoria RAM del Arreglo (CAPACIDAD = 15):
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-----+--------+
|  120  |  250  |  180  |  300  |   ?   |   ?   |   ?   |   ?   |   ?   | ... |   ?    |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-----+--------+
  [0]     [1]     [2]     [3]     [4]     [5]     [6]     [7]     [8]          [14]
 <----- ELEMENTOS VÁLIDOS -----> <---------------- BASURA EN MEMORIA ----------------->
       (tamanoLogico = 4)
```

### 1.2 Estructura y Distribución de Puntaje (100% Código en C++)

| Bloque Evaluado | Ponderación | Criterio Técnico |
| :--- | :---: | :--- |
| **1. Menú Modular y Arquitectura** | **10%** | Inclusión de librerías, prototipos de función, bucle interactivo `do-while`, menú con `switch`, funciones modulares independientes y pasaje estricto de parámetros (valor vs. referencia). |
| **2. Carga / Inserción y Validación** | **20%** | Inserción en `arr[tam]`, control estricto de memoria llena (`tam < CAPACIDAD`), validación de rangos numéricos con bucle interactivo e incremento `tam++`. |
| **3. Consultas, Filtros y Estadísticas** | **20%** | Recorrido selectivo con `const`, aplicación de predicados condicionales, conteo de funciones destacadas y cálculo de promedios/extremos. |
| **4. Búsqueda Lineal y Modificación** | **25%** | Búsqueda secuencial retornando índice (`0` a `tam-1`) o `-1`, modificación condicionada a la existencia previa y validación del nuevo valor. |
| **5. Algoritmo Clave: Eliminación Shift-Left** | **25%** | Baja física con desplazamiento hacia la izquierda desde la posición encontrada hasta `tam - 2` (`arr[i] = arr[i + 1]`), y decremento del tamaño lógico (`tam--`) recibido por referencia. |

> [!IMPORTANT]
> **Condición de Evaluación Real (Desarrollo desde Cero):**  
> En esta instancia formal de **Examen Parcial**, los estudiantes **NO recibirán ninguna plantilla ni código base prehecho**. Deberán codificar la solución completa en su IDE (CLion / Code::Blocks / VS Code) a partir de la hoja de consignas.

---

## 2. Matriz Comparativa de los 3 Temas

```
+-----------------------------------------------------------------------------------------------------------------+
|                                MATRIZ DE EQUIVALENCIA Y PARIDAD - BOLETERÍA ARGENTINA                           |
+--------------------------+------------------------------+------------------------------+------------------------+
| Dimensión Técnica        | Tema 1: Cine Gaumont         | Tema 2: Teatro Gran Rex      | Tema 3: Cosquín Rock   |
+--------------------------+------------------------------+------------------------------+------------------------+
| Ámbito Cultural          | Cine Nacional / Espacio INCAA| Teatro de Revista / Musical  | Festival de Rock       |
| Variable Monitoreada     | Entradas vendidas / Función  | Butacas vendidas / Función   | Abonos por Sector      |
| Tipo de Dato             | int                          | int                          | int                    |
| Capacidad Física (CAP)   | 15                           | 15                           | 15                     |
| Invariante de Tamaño     | 0 <= tam <= 15               | 0 <= tam <= 15               | 0 <= tam <= 15         |
| Rango Válido             | [10 a 300] entradas          | [50 a 800] butacas           | [100 a 2500] abonos    |
| Umbral de Filtrado       | > 180 ("Sala Llena")         | > 500 ("Gran Convocatoria")  | > 1500 ("Agotado")     |
| Búsqueda Lineal          | Búsqueda por cantidad        | Búsqueda por cantidad        | Búsqueda por cantidad  |
| Modificación Condicionada| Rectificar venta de función  | Ajustar venta por canjes     | Reasignar abonos       |
| Baja Física (Shift-Left) | Cancelación por falla técnica| Anulación por reprogramación | Clausura por clima     |
| Estadísticas Globales    | Promedio y Venta MÁXIMA      | Promedio y Venta MÍNIMA      | Promedio y Venta MÁXIMA|
| Código Base de Ayuda     | NINGUNO (Desde Cero)         | NINGUNO (Desde Cero)         | NINGUNO (Desde Cero)   |
+--------------------------+------------------------------+------------------------------+------------------------+
```

---

## 3. Especificación Detallada de los Temas

### 3.1 Tema 1: Cine — Espacio INCAA / Cine Gaumont (Venta de Entradas y Aforo por Función)

- **Contexto Narrativo:**  
  El histórico **Cine Gaumont** (Espacio INCAA km 0), ubicado frente a la Plaza del Congreso en Buenos Aires, proyecta estrenos y retrospectivas del cine nacional. La administración de boletería necesita controlar la cantidad de entradas vendidas para cada una de las funciones programadas en el día (hasta un máximo de **15 funciones**). El sistema debe permitir registrar la venta de entradas de una función, listar aquellas que alcanzaron la categoría de *Sala Llena*, rectificar ventas por canjes de prensa o promociones estudiantiles, y cancelar funciones imprevistas (por fallas en el proyector o corte de energía) aplicando el algoritmo de **compactación por desplazamiento a la izquierda (*Shift-Left*)**.

- **Constantes del Sistema:**
  ```cpp
  const int CAPACIDAD = 15;
  ```

- **Firmas Modulares Requeridas (Contratos de Interfaz):**
  ```cpp
  void MostrarMenu(int &opc);
  void RegistrarFuncion(int arr[], int &tam, int capacidad);
  void ListarFunciones(const int arr[], int tam, int umbralSalaLlena);
  int BuscarFuncion(const int arr[], int tam, int valorBuscado);
  void ModificarEntradas(int arr[], int tam);
  void CancelarFuncion(int arr[], int &tam);
  void CalcularEstadisticas(const int arr[], int tam);
  ```

- **Especificación de Operaciones del Menú:**
  - **Opción 1: Registrar Venta de Función:**
    - Verifica si `tam < CAPACIDAD`. Si el vector está lleno, emite mensaje `[Error] Capacidad completa. No se pueden registrar mas funciones en cartelera.`
    - Solicita la cantidad de entradas vendidas para la función.
    - Valida mediante bucle iterativo que el valor se encuentre estrictamente en el rango `[10, 300]`. Ante valores inválidos emite: `[Error] La cantidad de entradas debe estar entre 10 y 300.`
    - Asigna el valor en `arr[tam]` e incrementa `tam++`. Informa la posición asignada.
  - **Opción 2: Listar Funciones y Filtrar Salas Llenas:**
    - Si `tam == 0`, muestra `[Aviso] No hay funciones registradas en cartelera.`
    - Recorre de `0` a `tam - 1` con parámetro `const` mostrando índice y cantidad de entradas.
    - Contabiliza y muestra cuántas funciones alcanzaron la categoría de *Sala Llena* (`> 180` entradas).
  - **Opción 3: Búsqueda y Rectificación de Entradas:**
    - Solicita la cantidad de entradas a buscar.
    - Invoca a `BuscarFuncion()`, retornando la posición o `-1`.
    - Si existe: solicita la nueva cantidad rectificada, la valida en `[10, 300]` y actualiza `arr[pos]`.
    - Si no existe: informa `[Error] No se encontro ninguna funcion con esa cantidad de entradas vendidas.`
  - **Opción 4: Cancelar Función (Shift-Left):**
    - Solicita la cantidad de entradas de la función a cancelar. Invoca a `BuscarFuncion()`.
    - Si existe en la posición `pos`:
      - Desplaza todos los elementos posteriores hacia la izquierda desde `pos` hasta `tam - 2`: `arr[i] = arr[i + 1]`.
      - Decrementa el tamaño lógico: `tam--` recibido por referencia.
      - Informa `[Exito] Funcion cancelada y cartelera compactada correctamente.`
    - Si no existe: muestra `[Error] Funcion no encontrada. No se realizo ninguna cancelacion.`
  - **Opción 5: Ver Estadísticas de Boletería:**
    - Calcula y muestra el promedio de entradas vendidas por función.
    - Determina y muestra la **MÁXIMA** venta registrada y en qué número de función (posición) ocurrió.
  - **Opción 0: Salir.**

---

### 3.2 Tema 2: Teatro — Teatro Gran Rex / Calle Corrientes (Venta de Localidades por Función)

- **Contexto Narrativo:**  
  El icónico **Teatro Gran Rex**, epicentro de la escena teatral sobre la Calle Corrientes, produce exitosas comedias y comedias musicales de gran formato. La jefatura de sala necesita un programa para monitorear la venta de localidades y butacas por función durante la temporada invernal (hasta un máximo de **15 funciones**). El sistema debe registrar las funciones emitidas, listar aquellas con el rótulo de *Gran Convocatoria*, rectificar la cantidad de butacas asignadas por liberaciones de reservas institucionales, y anular funciones levantadas por reprogramación de elenco mediante **compactación física con *Shift-Left***.

- **Constantes del Sistema:**
  ```cpp
  const int CAPACIDAD = 15;
  ```

- **Firmas Modulares Requeridas (Contratos de Interfaz):**
  ```cpp
  void MostrarMenu(int &opc);
  void RegistrarFuncion(int arr[], int &tam, int capacidad);
  void ListarFunciones(const int arr[], int tam, int umbralConvocatoria);
  int BuscarFuncion(const int arr[], int tam, int valorBuscado);
  void ModificarButacas(int arr[], int tam);
  void AnularFuncion(int arr[], int &tam);
  void CalcularEstadisticas(const int arr[], int tam);
  ```

- **Especificación de Operaciones del Menú:**
  - **Opción 1: Registrar Venta de Localidades:**
    - Verifica `tam < CAPACIDAD`. Si está lleno: `[Error] Capacidad completa. No se pueden registrar mas funciones teatrales.`
    - Solicita la cantidad de butacas vendidas.
    - Valida mediante bucle que el valor se encuentre en el rango `[50, 800]`. Si no: `[Error] La cantidad de butacas debe estar entre 50 y 800.`
    - Guarda en `arr[tam]` y realiza `tam++`.
  - **Opción 2: Listar Funciones y Gran Convocatoria:**
    - Si `tam == 0`, muestra `[Aviso] No hay funciones registradas.`
    - Lista las funciones válidas y cuenta cuántas superaron el umbral de *Gran Convocatoria* (`> 500` butacas).
  - **Opción 3: Búsqueda y Rectificación de Butacas:**
    - Solicita el valor a buscar. Invoca `BuscarFuncion()`.
    - Si existe: solicita el nuevo valor rectificado, lo valida en `[50, 800]` y actualiza `arr[pos]`.
    - Si no existe: informa `[Error] No se encontro ninguna funcion con esa cantidad de butacas.`
  - **Opción 4: Anular Función por Reprogramación (Shift-Left):**
    - Solicita la cantidad de butacas de la función a anular. Invoca `BuscarFuncion()`.
    - Si existe en `pos`: ejecuta el desplazamiento a la izquierda (`arr[i] = arr[i+1]`) desde `pos` hasta `tam - 2` y decrementa `tam--`. Informa éxito.
    - Si no existe: muestra `[Error] Funcion no encontrada. No se realizo ninguna anulacion.`
  - **Opción 5: Ver Estadísticas de Temporada:**
    - Calcula y muestra el promedio de butacas ocupadas por función.
    - Determina la función con **MÍNIMA** convocatoria registrada y su posición para análisis de retiro de cartelera.
  - **Opción 0: Salir.**

---

### 3.3 Tema 3: Eventos / Festivales — Cosquín Rock (Abonos Vendidos por Sector)

- **Contexto Narrativo:**  
  El festival **Cosquín Rock**, que reúne anualmente a más de 100.000 fanáticos en el Aeródromo de Santa María de Punilla (Córdoba), organiza su predio en escenarios temáticos y sectores de acampe/tribunas. La organización necesita supervisar la cantidad de abonos y pulseras vendidas en cada uno de los sectores habilitados (hasta un máximo de **15 sectores**). El sistema debe registrar las ventas por sector, alertar sobre sectores con *Aforo Agotado*, rectificar abonos por ampliaciones de vallas perimetrales, y clausurar sectores inhabilitados por lluvias o razones de seguridad compactando físicamente el arreglo mediante ***Shift-Left***.

- **Constantes del Sistema:**
  ```cpp
  const int CAPACIDAD = 15;
  ```

- **Firmas Modulares Requeridas (Contratos de Interfaz):**
  ```cpp
  void MostrarMenu(int &opc);
  void RegistrarSector(int arr[], int &tam, int capacidad);
  void ListarSectores(const int arr[], int tam, int umbralAgotado);
  int BuscarSector(const int arr[], int tam, int valorBuscado);
  void ModificarAbonos(int arr[], int tam);
  void ClausurarSector(int arr[], int &tam);
  void CalcularEstadisticas(const int arr[], int tam);
  ```

- **Especificación de Operaciones del Menú:**
  - **Opción 1: Registrar Abonos de Sector:**
    - Verifica `tam < CAPACIDAD`. Si está lleno: `[Error] Capacidad completa. No se pueden registrar mas sectores en el predio.`
    - Solicita la cantidad de abonos vendidos.
    - Valida mediante bucle que el valor se encuentre en el rango `[100, 2500]`. Si no: `[Error] La cantidad de abonos debe estar entre 100 y 2500.`
    - Guarda en `arr[tam]` y realiza `tam++`.
  - **Opción 2: Listar Sectores y Aforo Agotado:**
    - Si `tam == 0`, muestra `[Aviso] No hay sectores registrados en el predio.`
    - Lista los sectores y cuenta cuántos alcanzaron la alerta de *Aforo Agotado* (`> 1500` abonos).
  - **Opción 3: Búsqueda y Rectificación de Abonos:**
    - Solicita el valor a buscar. Invoca `BuscarSector()`.
    - Si existe: solicita el nuevo valor rectificado, lo valida en `[100, 2500]` y actualiza `arr[pos]`.
    - Si no existe: informa `[Error] No se encontro ningun sector con esa cantidad de abonos.`
  - **Opción 4: Clausurar Sector por Seguridad (Shift-Left):**
    - Solicita la cantidad de abonos del sector a clausurar. Invoca `BuscarSector()`.
    - Si existe en `pos`: ejecuta el desplazamiento hacia la izquierda (`arr[i] = arr[i+1]`) desde `pos` hasta `tam - 2` y decrementa `tam--`.
    - Si no existe: muestra `[Error] Sector no encontrado. No se realizo ninguna clausura.`
  - **Opción 5: Ver Estadísticas del Festival:**
    - Calcula el promedio de abonos vendidos por sector.
    - Determina el sector con la **MÁXIMA** concentración de público y su posición.
  - **Opción 0: Salir.**

---

## 4. Matriz de Paridad Psicométrica y Cognitiva

Para asegurar equidad absoluta en la evaluación entre las distintas comisiones y temas:

| Dimensión de Paridad | Tema 1 (Cine Gaumont) | Tema 2 (Gran Rex) | Tema 3 (Cosquín Rock) | ¿Paridad Cumplida? |
| :--- | :--- | :--- | :--- | :---: |
| **Tipo de Estructura de Datos** | Arreglo unidimensional `int` | Arreglo unidimensional `int` | Arreglo unidimensional `int` | ✅ SÍ |
| **Complejidad Ciclomática** | 5 opciones en `switch` + validaciones | Idéntica | Idéntica | ✅ SÍ |
| **Complejidad Temporal** | Búsqueda $\mathcal{O}(N)$, Shift-Left $\mathcal{O}(N)$ | $\mathcal{O}(N)$, $\mathcal{O}(N)$ | $\mathcal{O}(N)$, $\mathcal{O}(N)$ | ✅ SÍ |
| **Contratos de Interfaz** | `const int arr[]`, `int arr[]`, `int &tam` | Idénticos | Idénticos | ✅ SÍ |
| **Cantidad de Módulos** | 7 funciones con firmas homogéneas | 7 funciones | 7 funciones | ✅ SÍ |
| **Operación de Extremo** | Máximo | Mínimo | Máximo | ✅ SÍ (equivalente) |
| **Dificultad de Codificación** | Desarrollo desde cero sin plantilla | Desarrollo desde cero sin plantilla | Desarrollo desde cero sin plantilla | ✅ SÍ |

---

## 5. Casos de Prueba Formales (9 Casos Totales)

### 5.1 Casos de Prueba — Tema 1: Cine Gaumont

#### Caso 1: Validación de Rango y Capacidad
- **Entrada (Simulada):**
  ```text
  1
  5
  350
  120
  1
  220
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  === SISTEMA DE BOLETERIA - CINE GAUMONT ===
  1. Registrar Venta de Funcion
  2. Listar Funciones y Filtrar Salas Llenas
  3. Buscar y Modificar Venta
  4. Cancelar Funcion (Compactar Cartelera)
  5. Ver Estadisticas de Boleteria
  0. Salir
  Ingrese una opcion: > 1
  Ingrese cantidad de entradas vendidas (10 - 300): > 5
  [Error] La cantidad de entradas debe estar entre 10 y 300.
  Ingrese cantidad de entradas vendidas (10 - 300): > 350
  [Error] La cantidad de entradas debe estar entre 10 y 300.
  Ingrese cantidad de entradas vendidas (10 - 300): > 120
  [Exito] Funcion registrada correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de entradas vendidas (10 - 300): > 220
  [Exito] Funcion registrada correctamente en la posicion 1.

  Ingrese una opcion: > 2
  --- CARTELERA CINE GAUMONT ---
  [0] 120 entradas
  [1] 220 entradas
  Funciones con Sala Llena (> 180 entradas): 1 de 2 funciones.

  Ingrese una opcion: > 0
  Finalizando sistema de boleteria del Cine Gaumont.
  ```

#### Caso 2: Carga Múltiple, Modificación y Estadísticas (Máximo)
- **Entrada (Simulada):**
  ```text
  1
  90
  1
  150
  1
  250
  3
  150
  195
  5
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opcion: > 1
  Ingrese cantidad de entradas vendidas (10 - 300): > 90
  [Exito] Funcion registrada correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de entradas vendidas (10 - 300): > 150
  [Exito] Funcion registrada correctamente en la posicion 1.

  Ingrese una opcion: > 1
  Ingrese cantidad de entradas vendidas (10 - 300): > 250
  [Exito] Funcion registrada correctamente en la posicion 2.

  Ingrese una opcion: > 3
  Ingrese cantidad de entradas a buscar: > 150
  Funcion encontrada en la posicion 1.
  Ingrese nueva cantidad de entradas rectificada (10 - 300): > 195
  [Exito] Funcion actualizada correctamente.

  Ingrese una opcion: > 5
  --- ESTADISTICAS DE BOLETERIA ---
  Cantidad de funciones en cartelera: 3
  Promedio de entradas por funcion: 178.33 entradas
  Maxima venta registrada: 250 entradas en la posicion 2.

  Ingrese una opcion: > 0
  Finalizando sistema de boleteria del Cine Gaumont.
  ```

#### Caso 3: Búsqueda Fallida y Cancelación Física (Shift-Left)
- **Entrada (Simulada):**
  ```text
  1
  100
  1
  160
  1
  280
  4
  999
  4
  160
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opcion: > 1
  Ingrese cantidad de entradas vendidas (10 - 300): > 100
  [Exito] Funcion registrada correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de entradas vendidas (10 - 300): > 160
  [Exito] Funcion registrada correctamente en la posicion 1.

  Ingrese una opcion: > 1
  Ingrese cantidad de entradas vendidas (10 - 300): > 280
  [Exito] Funcion registrada correctamente en la posicion 2.

  Ingrese una opcion: > 4
  Ingrese cantidad de entradas de la funcion a cancelar: > 999
  [Error] Funcion no encontrada. No se realizo ninguna cancelacion.

  Ingrese una opcion: > 4
  Ingrese cantidad de entradas de la funcion a cancelar: > 160
  [Exito] Funcion cancelada y cartelera compactada correctamente.

  Ingrese una opcion: > 2
  --- CARTELERA CINE GAUMONT ---
  [0] 100 entradas
  [1] 280 entradas
  Funciones con Sala Llena (> 180 entradas): 1 de 2 funciones.

  Ingrese una opcion: > 0
  Finalizando sistema de boleteria del Cine Gaumont.
  ```

---

### 5.2 Casos de Prueba — Tema 2: Teatro Gran Rex

#### Caso 1: Validación de Rango y Capacidad
- **Entrada (Simulada):**
  ```text
  1
  20
  950
  450
  1
  620
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  === SISTEMA DE BOLETERIA - TEATRO GRAN REX ===
  1. Registrar Venta de Localidades
  2. Listar Funciones y Filtrar Gran Convocatoria
  3. Buscar y Modificar Butacas
  4. Anular Funcion por Reprogramacion (Compactar Arreglo)
  5. Ver Estadisticas de Temporada
  0. Salir
  Ingrese una opcion: > 1
  Ingrese cantidad de butacas vendidas (50 - 800): > 20
  [Error] La cantidad de butacas debe estar entre 50 y 800.
  Ingrese cantidad de butacas vendidas (50 - 800): > 950
  [Error] La cantidad de butacas debe estar entre 50 y 800.
  Ingrese cantidad de butacas vendidas (50 - 800): > 450
  [Exito] Funcion registrada correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de butacas vendidas (50 - 800): > 620
  [Exito] Funcion registrada correctamente en la posicion 1.

  Ingrese una opcion: > 2
  --- TEMPORADA TEATRO GRAN REX ---
  [0] 450 butacas
  [1] 620 butacas
  Funciones con Gran Convocatoria (> 500 butacas): 1 de 2 funciones.

  Ingrese una opcion: > 0
  Finalizando sistema de boleteria del Teatro Gran Rex.
  ```

#### Caso 2: Modificación y Mínima Convocatoria
- **Entrada (Simulada):**
  ```text
  1
  300
  1
  550
  1
  210
  3
  550
  580
  5
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opcion: > 1
  Ingrese cantidad de butacas vendidas (50 - 800): > 300
  [Exito] Funcion registrada correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de butacas vendidas (50 - 800): > 550
  [Exito] Funcion registrada correctamente en la posicion 1.

  Ingrese una opcion: > 1
  Ingrese cantidad de butacas vendidas (50 - 800): > 210
  [Exito] Funcion registrada correctamente en la posicion 2.

  Ingrese una opcion: > 3
  Ingrese cantidad de butacas a buscar: > 550
  Funcion encontrada en la posicion 1.
  Ingrese nueva cantidad de butacas rectificada (50 - 800): > 580
  [Exito] Funcion actualizada correctamente.

  Ingrese una opcion: > 5
  --- ESTADISTICAS DE TEMPORADA ---
  Cantidad de funciones evaluadas: 3
  Promedio de butacas por funcion: 363.33 butacas
  Minima convocatoria registrada: 210 butacas en la posicion 2.

  Ingrese una opcion: > 0
  Finalizando sistema de boleteria del Teatro Gran Rex.
  ```

#### Caso 3: Anulación Shift-Left de Función
- **Entrada (Simulada):**
  ```text
  1
  400
  1
  720
  1
  280
  4
  720
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opcion: > 1
  Ingrese cantidad de butacas vendidas (50 - 800): > 400
  [Exito] Funcion registrada correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de butacas vendidas (50 - 800): > 720
  [Exito] Funcion registrada correctamente en la posicion 1.

  Ingrese una opcion: > 1
  Ingrese cantidad de butacas vendidas (50 - 800): > 280
  [Exito] Funcion registrada correctamente en la posicion 2.

  Ingrese una opcion: > 4
  Ingrese cantidad de butacas de la funcion a anular: > 720
  [Exito] Funcion anulada y cartelera compactada correctamente.

  Ingrese una opcion: > 2
  --- TEMPORADA TEATRO GRAN REX ---
  [0] 400 butacas
  [1] 280 butacas
  Funciones con Gran Convocatoria (> 500 butacas): 0 de 2 funciones.

  Ingrese una opcion: > 0
  Finalizando sistema de boleteria del Teatro Gran Rex.
  ```

---

### 5.3 Casos de Prueba — Tema 3: Cosquín Rock

#### Caso 1: Validación de Rango y Capacidad
- **Entrada (Simulada):**
  ```text
  1
  50
  3000
  1200
  1
  1800
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  === SISTEMA DE AFORO - COSQUIN ROCK ===
  1. Registrar Abonos de Sector
  2. Listar Sectores y Filtrar Aforo Agotado
  3. Buscar y Modificar Abonos
  4. Clausurar Sector por Seguridad (Compactar Predio)
  5. Ver Estadisticas del Festival
  0. Salir
  Ingrese una opcion: > 1
  Ingrese cantidad de abonos vendidos (100 - 2500): > 50
  [Error] La cantidad de abonos debe estar entre 100 y 2500.
  Ingrese cantidad de abonos vendidos (100 - 2500): > 3000
  [Error] La cantidad de abonos debe estar entre 100 y 2500.
  Ingrese cantidad de abonos vendidos (100 - 2500): > 1200
  [Exito] Sector registrado correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de abonos vendidos (100 - 2500): > 1800
  [Exito] Sector registrado correctamente en la posicion 1.

  Ingrese una opcion: > 2
  --- CONTROL DE SECTORES COSQUIN ROCK ---
  [0] 1200 abonos
  [1] 1800 abonos
  Sectores con Aforo Agotado (> 1500 abonos): 1 de 2 sectores.

  Ingrese una opcion: > 0
  Finalizando sistema de aforo de Cosquin Rock.
  ```

#### Caso 2: Modificación y Máxima Concentración
- **Entrada (Simulada):**
  ```text
  1
  800
  1
  1600
  1
  2100
  3
  1600
  1750
  5
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opcion: > 1
  Ingrese cantidad de abonos vendidos (100 - 2500): > 800
  [Exito] Sector registrado correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de abonos vendidos (100 - 2500): > 1600
  [Exito] Sector registrado correctamente en la posicion 1.

  Ingrese una opcion: > 1
  Ingrese cantidad de abonos vendidos (100 - 2500): > 2100
  [Exito] Sector registrado correctamente en la posicion 2.

  Ingrese una opcion: > 3
  Ingrese cantidad de abonos a buscar: > 1600
  Sector encontrado en la posicion 1.
  Ingrese nueva cantidad de abonos rectificada (100 - 2500): > 1750
  [Exito] Sector actualizado correctamente.

  Ingrese una opcion: > 5
  --- ESTADISTICAS DEL FESTIVAL ---
  Cantidad de sectores habilitados: 3
  Promedio de abonos por sector: 1550.00 abonos
  Maxima concentracion registrada: 2100 abonos en la posicion 2.

  Ingrese una opcion: > 0
  Finalizando sistema de aforo de Cosquin Rock.
  ```

#### Caso 3: Clausura de Sector por Seguridad y Shift-Left
- **Entrada (Simulada):**
  ```text
  1
  900
  1
  2200
  1
  1400
  4
  2200
  2
  0
  ```
- **Salida Esperada por Pantalla:**
  ```text
  Ingrese una opcion: > 1
  Ingrese cantidad de abonos vendidos (100 - 2500): > 900
  [Exito] Sector registrado correctamente en la posicion 0.

  Ingrese una opcion: > 1
  Ingrese cantidad de abonos vendidos (100 - 2500): > 2200
  [Exito] Sector registrado correctamente en la posicion 1.

  Ingrese una opcion: > 1
  Ingrese cantidad de abonos vendidos (100 - 2500): > 1400
  [Exito] Sector registrado correctamente en la posicion 2.

  Ingrese una opcion: > 4
  Ingrese cantidad de abonos del sector a clausurar: > 2200
  [Exito] Sector clausurado y predio compactado correctamente.

  Ingrese una opcion: > 2
  --- CONTROL DE SECTORES COSQUIN ROCK ---
  [0] 900 abonos
  [1] 1400 abonos
  Sectores con Aforo Agotado (> 1500 abonos): 0 de 2 sectores.

  Ingrese una opcion: > 0
  Finalizando sistema de aforo de Cosquin Rock.
  ```

---

## 6. Plan de Generación de Entregables (Fase 2)

Aprobado este documento `SDD.md`, se generarán los siguientes artefactos en `modulo-3/Examenes/3er-Examen-2026/`:
1. `index.html`: Portal principal interactivo con tarjetas temáticas de los 3 temas (Cine Gaumont, Teatro Gran Rex, Cosquín Rock).
2. `tema1.html`, `tema2.html`, `tema3.html`: Portales web con enunciados, tooltips de rúbrica, tabs interactivos de casos de prueba y aviso formal de **Desarrollo desde cero (Sin código base)**.
3. `resolucion-tema1.cpp`, `resolucion-tema2.cpp`, `resolucion-tema3.cpp`: Códigos de solución modelo completos para uso exclusivo del docente.
4. `rubrica.md`: Criterios estandarizados de calificación sobre 100 puntos de programación en C++.
