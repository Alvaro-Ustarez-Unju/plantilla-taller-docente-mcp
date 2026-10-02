# 🎮 Cuestionario Quizizz / Wayground — Unidad 3: Entrada/Salida y Sistema de Archivos en Linux

> **Universidad Nacional de Jujuy (UNJu) — Facultad de Ingeniería**  
> **Cátedra:** Sistemas Operativos II — Ciclo Lectivo 2026  
> **Equipo Docente:** Ing. María Fernanda Vázquez (Titular) | Ing. Fabio Damián Argañaraz Azua (JTP)  
> **Uso:** Actividad interactiva en vivo (10-15 min) para la apertura de la **Clase 3 / TP 03**.  

---

## 📋 Banco de Preguntas (Con distractores deliberadamente largos para neutralizar el sesgo de longitud)

---

### Pregunta 1 (30 segundos)
**En el modelo de Entrada/Salida de Linux y Unix, ¿cuál es el principio de diseño fundamental sobre los dispositivos periféricos?**

- [ ] A) Cada periférico físico requiere una llamada al sistema propietaria de bajo nivel codificada exclusivamente en lenguaje ensamblador para evitar la sobrecarga del kernel.
- [ ] B) Los dispositivos periféricos se gestionan como procesos independientes en espacio de usuario sin intervención de controladores en modo núcleo.
- [x] **C) Todo dispositivo se representa y manipula como un archivo en el sistema de directorios (`/dev`).** ✅
- [ ] D) El acceso a los buses de hardware se delega de forma directa a las aplicaciones cliente mediante la invocación continua de señales de interrupción de red TCP/IP.

> **💡 Explicación:** La máxima "en Linux todo es un archivo" unifica el acceso a hardware. Los dispositivos se exponen en `/dev` y los programas interactúan con ellos utilizando las mismas llamadas al sistema que para archivos regulares (`open()`, `read()`, `write()`, `close()`), simplificando el desarrollo y abstrayendo la arquitectura física (Silberschatz Cap. 12, Diapositivas U3).

---

### Pregunta 2 (30 segundos)
**En la identificación de archivos especiales en `/dev`, ¿qué representan respectivamente los números *Major* y *Minor*?**

- [x] **A) El *Major* identifica al driver correspondiente; el *Minor* distingue la unidad física o partición concreta.** ✅
- [ ] B) El *Major* especifica la cantidad máxima de bloques transferibles en un ciclo de reloj y el *Minor* la tasa de error por paridad en el bus PCIe.
- [ ] C) El *Major* representa el identificador único de proceso (PID) del administrador y el *Minor* el nivel de prioridad en el planificador de tiempo compartido.
- [ ] D) El *Major* define el protocolo de cifrado de red utilizado para la transmisión y el *Minor* el puerto lógico asignado por el cortafuegos.

> **💡 Explicación:** El número *Major* le indica al kernel qué manejador de dispositivo (*driver*) debe recibir las operaciones de E/S. El número *Minor* es interpretado por dicho driver para saber sobre cuál de los dispositivos bajo su control (ej. qué disco o partición particular) debe operar (Carretero Cap. 6, Diapositivas U3 - Slide 5).

---

### Pregunta 3 (30 segundos)
**¿Cuál es la diferencia operativa esencial entre un *dispositivo de caracteres* y un *dispositivo de bloques* en Linux?**

- [ ] A) Los dispositivos de caracteres solo admiten conexiones cifradas mediante túneles VPN y los de bloques operan exclusivamente sobre la memoria volátil de la GPU.
- [ ] B) Los dispositivos de bloques transmiten la información carácter por carácter a través de un puerto serie y los de caracteres requieren particionado previo.
- [ ] C) Los dispositivos de caracteres requieren obligatoriamente un sistema de archivos ext4 y los de bloques carecen de identificador de inodo en el sistema.
- [x] **D) Los de caracteres operan como un flujo secuencial sin direccionamiento; los de bloques permiten acceso aleatorio por bloques independientes.** ✅

> **💡 Explicación:** Los dispositivos de caracteres (como `/dev/tty`, teclado, mouse) transfieren datos como un flujo de bytes secuencial sin buffering directo. Los dispositivos de bloques (como discos duros `/dev/sda`, SSDs) permiten direccionar y leer/escribir bloques individuales de tamaño fijo en orden arbitrario (Tanenbaum Cap. 5, Diapositivas U3 - Slide 4).

---

### Pregunta 4 (30 segundos)
**En la interfaz de Sockets para comunicación de Entrada/Salida en red, ¿qué diferencia a `SOCK_STREAM` de `SOCK_DGRAM`?**

- [ ] A) `SOCK_STREAM` opera sin necesidad de sockets en el kernel mientras que `SOCK_DGRAM` requiere una tarjeta de fibra óptica dedicada.
- [x] **B) `SOCK_STREAM` ofrece flujo confiable orientado a conexión (TCP); `SOCK_DGRAM` envía datagramas independientes no confiables (UDP).** ✅
- [ ] C) `SOCK_STREAM` cifra automáticamente la carga útil con curvas elípticas de 512 bits y `SOCK_DGRAM` solo funciona en redes locales Token Ring.
- [ ] D) Ambos tipos de sockets son totalmente idénticos en protocolo y garantías, diferenciándose únicamente en el número de puerto de escucha predeterminado.

> **💡 Explicación:** Un socket es una interfaz abstracta de E/S de red. Al crearse devuelve un descriptor de archivo. El tipo `SOCK_STREAM` (basado en TCP) garantiza entrega ordenada, libre de errores y orientada a conexión. `SOCK_DGRAM` (basado en UDP) prioriza velocidad sin conexión previa ni garantía de entrega (Silberschatz Cap. 12, Diapositivas U3 - Slide 7).

---

### Pregunta 5 (30 segundos)
**¿Cuál es el rol del demonio de descarga de páginas sucias (*pdflush* / *flusher threads*) en la caché de disco de Linux?**

- [ ] A) Limpiar los archivos de registro histórico en `/var/log` para impedir que el volumen de almacenamiento supere el 80% de ocupación en disco.
- [ ] B) Recompilar de forma anticipada los controladores de hardware cuando se detecta una degradación térmica en los módulos de memoria RAM.
- [x] **C) Escribir de forma periódica o por presión de memoria las páginas modificadas (*dirty pages*) desde la RAM al almacenamiento físico.** ✅
- [ ] D) Monitorear las peticiones DNS del sistema y bloquear las direcciones IP que superen el límite de ancho de banda permitido por la política corporativa.

> **💡 Explicación:** Para acelerar la E/S, Linux escribe primero en la memoria RAM (*page cache*), marcando los bloques modificados como "páginas sucias" (*dirty*). Los hilos de volcado asíncrono (`pdflush`/`flush`/`kworker`) sincronizan periódicamente estos datos hacia el almacenamiento físico para resguardar la persistencia sin frenar al proceso emisor (Stallings Cap. 11, Diapositivas U3 - Slide 10).

---

### Pregunta 6 (30 segundos)
**¿Qué objetivo principal persiguen los algoritmos de planificación de disco, tales como el *Elevator Scheduler*?**

- [x] **A) Reordenar las peticiones según la ubicación de los sectores para minimizar el desplazamiento físico del cabezal de lectura/escritura.** ✅
- [ ] B) Suspender de inmediato los procesos con mayor consumo de CPU para priorizar la navegación en el entorno de ventanas X11.
- [ ] C) Modificar la tasa de muestreo del bus USB para prevenir interferencias electromagnéticas con la placa madre de la estación de trabajo.
- [ ] D) Duplicar la capacidad del disco rígido aplicando algoritmos de desduplicación continua en el microcódigo del controlador SATA.

> **💡 Explicación:** Mover el cabezal del disco mecánico o buscar bloques dispersos es costoso en latencia. El algoritmo de ascensor (*Elevator / SCAN*) ordena las peticiones pendientes según la dirección del cilindro/sector, atendiendo solicitudes en un sentido y luego en el otro para reducir el tiempo de búsqueda (*seek time*) (Silberschatz Cap. 12, Tanenbaum Cap. 5, Diapositivas U3 - Slide 11).

---

### Pregunta 7 (30 segundos)
**En la arquitectura del Virtual File System (VFS) de Linux, ¿qué información almacena un *Inodo* (*inode*)?**

- [ ] A) El nombre visible del archivo y su ruta jerárquica absoluta completa dentro del árbol de directorios del usuario.
- [ ] B) Una copia comprimida en memoria RAM de todos los bloques de datos del archivo para agilizar búsquedas de texto plano.
- [ ] C) La clave privada de descifrado SSH asociada al usuario propietario y los registros históricos de acceso en la red local.
- [x] **D) Los metadatos del archivo (permisos, propietario, tamaño, marcas de tiempo y punteros a bloques de datos), excluyendo el nombre.** ✅

> **💡 Explicación:** Un inodo contiene todos los atributos del archivo excepto su nombre. Los nombres residen en las entradas de directorio (*dentries*), las cuales asocian un nombre textual con un número de inodo. Por esto, un archivo puede tener múltiples nombres o rutas referenciando al mismo inodo mediante enlaces duros (Carretero Cap. 7, Diapositivas U3 - Slide 22).

---

### Pregunta 8 (30 segundos)
**Si creamos un *enlace duro* (*hard link*) con `ln origen enlace` y luego eliminamos el archivo `origen` con `rm`, ¿qué sucede con `enlace` y los datos?**

- [ ] A) El archivo `enlace` queda inmediatamente corrupto e inaccesible debido a la pérdida del puntero maestro de la partición ext4.
- [x] **B) `enlace` sigue existiendo y los datos permanecen intactos; el inodo se libera solo cuando su contador de enlaces llega a cero.** ✅
- [ ] C) El sistema operativo genera un fallo crítico de kernel (*Kernel Panic*) al detectar una referencia huérfana en el superbloque de la unidad.
- [ ] D) El kernel restaura automáticamente el archivo `origen` extrayendo una copia de respaldo oculta desde el directorio virtual `/proc`.

> **💡 Explicación:** Un hard link es una entrada de directorio adicional que apunta exactamente al mismo inodo. El inodo mantiene un contador de enlaces (`i_nlink`). Al hacer `rm origen`, el kernel decrementa el contador en 1. Mientras `i_nlink > 0`, los datos y el inodo siguen vivos y accesibles a través de los enlaces restantes (Tanenbaum Cap. 4, Diapositivas U3 - Slide 16).

---

### Pregunta 9 (30 segundos)
**¿Cuál es la principal ventaja técnica de la técnica de *Journaling* incorporada a partir de `ext3` respecto a `ext2`?**

- [x] **A) Registrar las transacciones de metadatos en un diario antes de aplicarlas, permitiendo una rápida recuperación tras una caída sin necesidad de un `fsck` completo.** ✅
- [ ] B) Multiplicar por cuatro el número de inodos disponibles mediante la sobreescritura dinámica del mapa de bits del superbloque secundario.
- [ ] C) Deshabilitar la caché de páginas en memoria RAM para asegurar que ninguna llamada al sistema quede en estado de espera activa.
- [ ] D) Formatear los discos en sectores variables de 64 bytes para evitar cualquier tipo de fragmentación en archivos ejecutables.

> **💡 Explicación:** En `ext2`, un apagón o caída inesperada requería verificar todo el disco con `fsck`, lo que podía tardar horas. `ext3` introdujo *Journaling*: registra la intención del cambio en un diario circular en disco antes de escribir en las estructuras principales. Tras un corte de energía, el sistema simplemente lee el diario y reconstruye o descarta las transacciones incompletas en segundos (Carretero Cap. 7, Diapositivas U3 - Slide 23 y 26).

---

### Pregunta 10 (30 segundos)
**En el sistema de archivos `ext4`, ¿qué mejora aportan los *Extents* (extensiones) frente al esquema tradicional de punteros de bloques de `ext2` y `ext3`?**

- [ ] A) Obligan a que cada archivo del sistema se fragmente en porciones de 512 bytes para optimizar el almacenamiento de archivos de configuración.
- [ ] B) Asignan bloques de forma aleatoria en la superficie del disco para equilibrar el desgaste físico de los sectores de memoria NAND flash.
- [x] **C) Reemplazan listas de bloques individuales por descriptores de rangos contiguos (bloque inicial y longitud), reduciendo metadatos y acelerando transferencias.** ✅
- [ ] D) Restringen el tamaño máximo de archivo a 2 GB para garantizar compatibilidad total con arquitecturas legacy de 32 bits.

> **💡 Explicación:** En `ext2/3`, un archivo grande requería una lista exhaustiva de punteros directos, indirectos, dobles y triples. `ext4` utiliza *Extents*: un único descriptor que indica "a partir del bloque 1000, los siguientes 500 bloques son contiguos". Esto disminuye drásticamente el espacio ocupado por metadatos, reduce la fragmentación y mejora el rendimiento de lectura y escritura secuencial (Silberschatz Cap. 11, Diapositivas U3 - Slide 27).

---

## 📦 Bloque de Importación para Moodle / Quizizz (Formato Aiken)

```text
En el modelo de Entrada/Salida de Linux, cual es el principio de diseno fundamental sobre los dispositivos?
A. Cada periferico requiere una llamada al sistema propietaria codificada en ensamblador.
B. Los dispositivos se gestionan como procesos independientes en espacio de usuario sin drivers.
C. Todo dispositivo se representa y manipula como un archivo en el sistema de directorios (/dev).
D. El acceso al hardware se delega a las aplicaciones mediante interrupciones de red TCP/IP.
ANSWER: C

En la identificacion de archivos especiales en /dev, que representan los numeros Major y Minor?
A. El Major identifica al driver correspondiente; el Minor distingue la unidad fisica o particion concreta.
B. El Major especifica la cantidad maxima de bloques y el Minor la tasa de error por paridad en el bus PCIe.
C. El Major representa el identificador unico de proceso y el Minor la prioridad en el scheduler.
D. El Major define el protocolo de cifrado de red y el Minor el puerto logico del cortafuegos.
ANSWER: A

Cual es la diferencia operativa esencial entre un dispositivo de caracteres y uno de bloques en Linux?
A. Los de caracteres operan con tuneles VPN y los de bloques sobre memoria volatil de la GPU.
B. Los de bloques transmiten caracter por caracter y los de caracteres requieren particionado previo.
C. Los de caracteres requieren sistema ext4 y los de bloques carecen de numero de inodo.
D. Los de caracteres operan como un flujo secuencial sin direccionamiento; los de bloques permiten acceso aleatorio por bloques independientes.
ANSWER: D

En la interfaz de Sockets para E/S en red, que diferencia a SOCK_STREAM de SOCK_DGRAM?
A. SOCK_STREAM opera sin sockets en el kernel y SOCK_DGRAM requiere fibra optica dedicada.
B. SOCK_STREAM ofrece flujo confiable orientado a conexion (TCP); SOCK_DGRAM envia datagramas independientes no confiables (UDP).
C. SOCK_STREAM cifra la carga con curvas elipticas y SOCK_DGRAM funciona solo en Token Ring.
D. Ambos tipos son identicos, diferenciandose solo en el numero de puerto de escucha predeterminado.
ANSWER: B

Cual es el rol del demonio de descarga de paginas sucias (pdflush / flusher) en la cache de disco?
A. Limpiar los archivos de log en /var/log para impedir que el volumen supere el 80% de ocupacion.
B. Recompilar anticipadamente los drivers al detectar degradacion termica en los modulos de RAM.
C. Escribir de forma periodica o por presion de memoria las paginas modificadas (dirty pages) desde la RAM al almacenamiento fisico.
D. Monitorear peticiones DNS y bloquear direcciones IP que superen el ancho de banda permitido.
ANSWER: C

Que objetivo principal persiguen los algoritmos de planificacion de disco como el Elevator Scheduler?
A. Reordenar las peticiones segun la ubicacion de los sectores para minimizar el desplazamiento fisico del cabezal de lectura/escritura.
B. Suspender los procesos con mayor consumo de CPU para priorizar la navegacion en ventanas X11.
C. Modificar la tasa de muestreo del bus USB para prevenir interferencias electromagneticas.
D. Duplicar la capacidad del disco aplicando desduplicacion continua en el controlador SATA.
ANSWER: A

En la arquitectura del Virtual File System (VFS) de Linux, que informacion almacena un Inodo (inode)?
A. El nombre visible del archivo y su ruta jerarquica absoluta completa en el arbol de directorios.
B. Una copia comprimida en memoria RAM de todos los bloques de datos para agilizar busquedas.
C. La clave privada SSH asociada al usuario propietario y los registros historicos de acceso.
D. Los metadatos del archivo (permisos, propietario, tamano, marcas de tiempo y punteros a bloques de datos), excluyendo el nombre.
ANSWER: D

Si creamos un enlace duro (hard link) con 'ln origen enlace' y luego eliminamos 'origen', que sucede?
A. El archivo enlace queda inmediatamente corrupto e inaccesible por perdida del puntero maestro.
B. enlace sigue existiendo y los datos permanecen intactos; el inodo se libera solo cuando su contador de enlaces llega a cero.
C. El sistema operativo genera un fallo critico de kernel (Kernel Panic) por referencia huerfana.
D. El kernel restaura automaticamente el archivo origen extrayendo una copia oculta de /proc.
ANSWER: B

Cual es la principal ventaja tecnica del Journaling incorporado en ext3 respecto a ext2?
A. Registrar las transacciones de metadatos en un diario antes de aplicarlas, permitiendo una rapida recuperacion tras una caida sin necesidad de un fsck completo.
B. Multiplicar por cuatro el numero de inodos mediante la sobreescritura dinamica del mapa de bits.
C. Deshabilitar la cache de paginas en RAM para asegurar que ninguna syscall quede en espera activa.
D. Formatear los discos en sectores de 64 bytes para evitar fragmentacion en archivos ejecutables.
ANSWER: A

En ext4, que mejora aportan los Extents frente a la lista tradicional de punteros a bloques de ext2/3?
A. Obligan a que cada archivo se fragmente en porciones de 512 bytes para optimizar archivos de configuracion.
B. Asignan bloques de forma aleatoria en la superficie del disco para equilibrar el desgaste fisico.
C. Reemplazan listas de bloques individuales por descriptores de rangos contiguos (bloque inicial y longitud), reduciendo metadatos y acelerando transferencias.
D. Restringen el tamano maximo de archivo a 2 GB para garantizar compatibilidad con sistemas de 32 bits.
ANSWER: C
```
