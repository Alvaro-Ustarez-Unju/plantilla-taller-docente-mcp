# 🧠 Cuestionario Interactivo de Orientación Formativa (Quizizz / Wayground)
### Cátedra: Teoría de Sistemas Operativos — Ciclo Lectivo 2026
**Universidad Nacional de Jujuy (UNJu) — Facultad de Ingeniería**  
**Docente Responsable:** Ing. María Fernanda Vázquez  
**Jefe de Trabajos Prácticos:** Ing. Fabio D. Argañaraz  

---

## 🎯 Propósito del Cuestionario
Este cuestionario contiene **10 preguntas conceptuales formativas** diseñadas para dinamizar la clase y orientar a los estudiantes en los conceptos teóricos clave antes o durante la resolución de cada uno de los 10 ejercicios del [**Trabajo Práctico N° 1**](https://github.com/UNJU-Teoria-de-Sistemas-Operativos/TP1).

---

### 📌 Pregunta 1 (Guía para Ejercicio 01: Definición y Rol del SO)
**¿Cuál de las siguientes afirmaciones describe de manera más precisa el rol principal de un Sistema Operativo moderno?**
- A) Es una suite de aplicaciones ofimáticas para redactar textos y gestionar bases de datos.
- B) Es una capa de abstracción y administrador de recursos que gestiona el hardware (CPU, memoria, E/S) y ofrece una interfaz estandarizada para las aplicaciones y usuarios.
- C) Es un chip de hardware integrado en la placa madre que almacena las contraseñas de red.
- D) Es un protocolo de comunicación inalámbrico para sincronizar periféricos Bluetooth.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** El SO actúa fundamentalmente en dos roles: como *administrador y asignador de recursos* (resource allocator) y como *capa de abstracción / máquina extendida* que oculta la complejidad del hardware a las aplicaciones (Silberschatz Cap. 1.1, Carretero Cap. 2.1).

---

### 📌 Pregunta 2 (Guía para Ejercicio 02: Funciones del SO vs. Software de Aplicación)
**¿Cuál de las siguientes tareas constituye una responsabilidad propia del kernel del Sistema Operativo y NO de un software de aplicación de usuario?**
- A) Diseñar la interfaz visual y paleta de colores de un sitio web.
- B) Decidir qué proceso encolado obtiene el turno de CPU y asignar bloques de memoria RAM a los programas en ejecución.
- C) Redactar y corregir la ortografía de un informe académico.
- D) Editar y retocar las capas de una fotografía digital.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** La gestión de procesos (scheduling), administración de memoria, control de E/S y protección son funciones intrínsecas del kernel. El software de usuario (Word, Photoshop, navegadores) se ejecuta sobre los servicios que el kernel provee (Silberschatz Cap. 1.4-1.8, Stallings Cap. 2.1).

---

### 📌 Pregunta 3 (Guía para Ejercicio 03: Multihilamiento vs. Multinúcleo)
**En la arquitectura de microprocesadores modernos, ¿qué diferencia fundamental existe entre un procesador *Multinúcleo (Multicore)* y la tecnología de *Multihilamiento por Hardware (Hyper-Threading / SMT)*?**
- A) El multihilamiento duplica físicamente todos los transistores y memorias caché del chip, mientras que el multinúcleo es solo una simulación por software.
- B) El multinúcleo cuenta con dos o más unidades de procesamiento físicas completas e independientes en el mismo silicio, mientras que el multihilamiento duplica solo registros de estado y Program Counter dentro de un mismo núcleo físico para ocultar latencias de memoria.
- C) El multinúcleo solo funciona con sistemas operativos de 32 bits y el multihilamiento con 64 bits.
- D) No existe ninguna diferencia; son términos comerciales sinónimos que representan exactamente lo mismo a nivel de hardware.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** Un chip multinúcleo posee múltiples CPUs completas ejecutando en paralelo real; el multihilamiento (SMT) aprovecha los ciclos ociosos de las unidades de ejecución de un único núcleo duplicando su contexto de registros para presentar dos CPUs lógicas al SO (Silberschatz Cap. 1.3, Stallings Cap. 4.2).

---

### 📌 Pregunta 4 (Guía para Ejercicio 04: Programa vs. Proceso)
**¿Cuál es la distinción conceptual formal entre un *Programa* y un *Proceso* en la teoría de sistemas operativos?**
- A) Un programa es una entidad activa que consume ciclos de CPU, mientras que un proceso es un archivo de texto plano guardado en el disco.
- B) Un programa es una entidad pasiva (código ejecutable almacenado en disco), mientras que un proceso es una entidad activa (un programa en ejecución cargado en memoria RAM con contador de programa, registros y espacio de direcciones).
- C) Un proceso solo existe en sistemas Windows y un programa solo existe en sistemas Linux.
- D) Un programa puede acceder a la memoria física directamente, mientras que un proceso no puede interactuar con el procesador.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** El programa es el ejecutable inerte en almacenamiento secundario (entidad pasiva); se convierte en proceso (entidad activa) cuando el SO lo carga en memoria principal y le asigna recursos y contexto de ejecución (Silberschatz Cap. 3.1, Tanenbaum Cap. 2.1).

---

### 📌 Pregunta 5 (Guía para Ejercicio 05: Servicios del Kernel y Llamadas al Sistema)
**Cuando una aplicación de usuario necesita crear un archivo nuevo o enviar datos por la red, ¿a través de qué mecanismo solicita la intervención segura del Sistema Operativo?**
- A) Accediendo y escribiendo directamente en los registros del disco rígido mediante código ensamblador de usuario.
- B) Invocando una Llamada al Sistema (*System Call*), que genera una trampa/excepción de software para cambiar al modo privilegiado del kernel.
- C) Apagando temporalmente el procesador para que el disco funcione de manera autónoma.
- D) Modificando los archivos binarios de la BIOS en tiempo de ejecución.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** Las aplicaciones de usuario no tienen permisos para manipular hardware directamente; utilizan la interfaz de *System Calls* (ej. `open()`, `read()`, `write()`, `fork()`) que transfiere el control al kernel mediante una trampa por software (Silberschatz Cap. 2.2, Carretero Cap. 2.2).

---

### 📌 Pregunta 6 (Guía para Ejercicio 06: Modo Dual: Modo Usuario vs. Modo Kernel)
**¿Por qué las CPUs implementan a nivel de hardware el *Modo Dual* distinguiendo entre Modo Usuario (no privilegiado) y Modo Kernel (privilegiado)?**
- A) Para obligar a los programadores a comprar licencias comerciales de software.
- B) Para garantizar la protección del sistema, evitando que un programa erróneo o malicioso ejecute instrucciones privilegiadas, modifique la memoria de otros procesos o dañe el hardware.
- C) Para permitir que la pantalla muestre una mayor gama de colores durante la ejecución de videojuegos.
- D) Para duplicar la capacidad de almacenamiento del disco de estado sólido (SSD).

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** El bit de modo en el hardware asegura que solo el código confiable del kernel pueda ejecutar instrucciones críticas (manipular tablas de memoria, habilitar/deshabilitar interrupciones o acceder a puertos de E/S) (Silberschatz Cap. 1.5, Stallings Cap. 2.4).

---

### 📌 Pregunta 7 (Guía para Ejercicio 07: Estructuras del Kernel: Monolítico vs. Microkernel)
**¿Cuál es la principal ventaja de diseño que ofrece una arquitectura de *Microkernel* frente a una arquitectura *Monolítica* tradicional?**
- A) Mayor rendimiento absoluto al eliminar todas las llamadas al sistema.
- B) Mayor modularidad, seguridad y aislamiento de fallos, ya que la mayoría de los servicios (como controladores y sistemas de archivos) se ejecutan fuera del kernel en espacio de usuario.
- C) Menor uso de memoria RAM en un factor del 90% en cualquier computadora.
- D) Inmunidad total contra virus informáticos sin necesidad de software de protección.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** En un microkernel (ej. MINIX, QNX), si un driver de dispositivo falla, no colapsa todo el sistema operativo como ocurre en un kernel monolítico. La contrapartida es la sobrecarga de comunicación por paso de mensajes (IPC) (Silberschatz Cap. 2.7, Tanenbaum Cap. 1.7).

---

### 📌 Pregunta 8 (Guía para Ejercicio 08: Clasificación de Sistemas Operativos)
**¿Cuál es el rasgo definitorio fundamental de un *Sistema Operativo de Tiempo Real Estricto (Hard Real-Time)*?**
- A) Que debe procesar transacciones bancarias en menos de 24 horas.
- B) Que las operaciones y respuestas deben completarse obligatoriamente dentro de un plazo temporal estricto (*deadline*); de lo contrario, se produce una falla crítica del sistema.
- C) Que cuenta con una interfaz gráfica en 3D que actualiza a 144 cuadros por segundo.
- D) Que puede conectarse simultáneamente a millones de usuarios a través de la nube.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** En sistemas Hard Real-Time (control de vuelo, marcapasos, frenos ABS), la corrección del sistema no solo depende del resultado lógico, sino del instante exacto en que se entrega la respuesta (Silberschatz Cap. 1.2, Tanenbaum Cap. 1.2).

---

### 📌 Pregunta 9 (Guía para Ejercicio 09: Acceso Directo a Memoria - DMA)
**¿Por qué el mecanismo de *Acceso Directo a Memoria (DMA)* resulta indispensable en transferencias de Entrada/Salida de alta velocidad (como en discos SSD o placas de red Gigabit)?**
- A) Porque transfiere bloques completos de datos directamente entre el dispositivo y la memoria RAM, liberando a la CPU de procesar cada byte individual mediante interrupciones constantes.
- B) Porque reemplaza los módulos de memoria RAM física por memoria de video de la GPU.
- C) Porque enfría los componentes electrónicos reduciendo el consumo eléctrico a cero.
- D) Porque duplica la resolución de pantalla del monitor sin utilizar controladores.

> **Respuesta correcta:** **A**  
> **💡 Justificación pedagógica:** Con DMA, el controlador de E/S transfiere un bloque entero de memoria de forma autónoma y solo emite una única interrupción al finalizar la transferencia completa, evitando saturar a la CPU (Silberschatz Cap. 1.2, Carretero Cap. 1.7).

---

### 📌 Pregunta 10 (Guía para Ejercicio 10: Separación de Mecanismos y Políticas)
**En el diseño de sistemas operativos, ¿cómo se ilustra correctamente la separación entre un *Mecanismo* y una *Política*?**
- A) El Mecanismo define *qué* decisiones tomar (ej. prioridad del usuario), mientras que la Política es el hardware del procesador.
- B) El Mecanismo determina *CÓMO* se realiza una acción (la herramienta o soporte básico, ej. un temporizador que interrumpe la CPU), mientras que la Política determina *QUÉ* se decide hacer (el criterio configurable, ej. asignar un quantum de 20 ms a cada proceso).
- C) Ambos términos son idénticos y no pueden separarse en el diseño de un kernel moderno.
- D) La Política es un archivo de texto con la licencia de software y el Mecanismo es el disco físico.

> **Respuesta correcta:** **B**  
> **💡 Justificación pedagógica:** Separar mecanismos (estructuras estables y bajo nivel) de políticas (criterios y parámetros configurables) permite modificar el comportamiento del SO según el entorno sin tener que rediseñar su arquitectura fundamental (Silberschatz Cap. 2.6, Diapositiva 19 U2-3).

---

## 🚀 Instrucciones para el Docente / JTP (Uso en Wayground / Quizizz)
1. **Creación del Quiz:** Copia cada pregunta y sus 4 opciones en la plataforma [Wayground](https://wayground.com) o [Quizizz](https://quizizz.com).
2. **Tiempo sugerido por pregunta:** 30 a 45 segundos.
3. **Dinámica en Clase:**
   - Puede utilizarse como **disparador de inicio de clase** (Warm-up) para verificar la lectura previa.
   - O como **pausa activa** antes de que los estudiantes comiencen a resolver cada bloque de ejercicios en el TP1 interactivo.
