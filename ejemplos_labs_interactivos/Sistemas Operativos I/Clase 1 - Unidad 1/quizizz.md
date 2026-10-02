# 🎮 Cuestionario Quizizz / Wayground — Unidad 1: Introducción, Procesos e Interbloqueos

> **Universidad Nacional de Jujuy (UNJu) — Facultad de Ingeniería**  
> **Cátedra:** Sistemas Operativos II — Ciclo Lectivo 2026  
> **Equipo Docente:** Ing. María Fernanda Vázquez | Ing. Fabio Damián Argañaraz Azua  
> **Uso:** Actividad interactiva en vivo (10-15 min) para la apertura de la **Clase 2**.

---

## 📋 Banco de Preguntas (Con distractores largos para evitar el sesgo de longitud)

---

### Pregunta 1 (30 segundos)
**¿Cuál es la principal diferencia entre una interrupción de hardware y una interrupción por software (TRAP / Excepción)?**

- [ ] A) La de hardware la genera la CPU cuando un hilo de usuario intenta acceder a una instrucción privilegiada y el TRAP lo produce el compilador en tiempo de compilación.
- [x] **B) La de hardware es asíncrona (externa); el TRAP es síncrono del programa.** ✅
- [ ] C) La de hardware ocurre al reiniciar el equipo y el TRAP al apagarlo.
- [ ] D) La de hardware corre en modo usuario y el TRAP en modo protegido.

> **💡 Explicación:** Las interrupciones de hardware provienen de periféricos de forma asíncrona con el reloj de la CPU; los TRAPs son provocados síncronamente por una instrucción del propio proceso (ej: una llamada al sistema `syscall` o división por cero).

---

### Pregunta 2 (30 segundos)
**En la arquitectura de sistemas operativos modernos, ¿qué ocurre cuando un proceso en Modo Usuario ejecuta una llamada al sistema (*System Call*)?**

- [ ] A) El proceso se reinicia forzadamente, libera todos sus descriptores de archivos abiertos y el planificador del kernel le reasigna un nuevo identificador de proceso (PID).
- [x] **B) Conmuta el privilegio de CPU de Modo Usuario a Modo Kernel mediante un TRAP.** ✅
- [ ] C) El sistema operativo desactiva temporalmente la memoria de intercambio en disco.
- [ ] D) El proceso toma control directo del bus físico de datos sin pasar por el kernel.

> **💡 Explicación:** El mecanismo de llamadas al sistema conmuta de forma segura el nivel de privilegio de la CPU para que el kernel ejecute la operación solicitada (abrir archivo, crear proceso) y luego devuelva el control en modo usuario.

---

### Pregunta 3 (30 segundos)
**¿Cuál es la función principal de los módulos dinámicos del Kernel en GNU/Linux (`.ko`)?**

- [ ] A) Reconstruir y recompilar el árbol de código fuente del kernel completo en cada inicio del sistema operativo para adaptar los controladores.
- [x] **B) Cargar y descargar controladores en caliente sin reiniciar el equipo.** ✅
- [ ] C) Aumentar dinámicamente el tamaño del archivo swap en el almacenamiento secundario.
- [ ] D) Traducir scripts de Bash a lenguaje ensamblador en tiempo de carga.

> **💡 Explicación:** Linux tiene un kernel monolítico modular. Los módulos permiten cargar drivers en memoria (`modprobe`, `insmod`) solo cuando el hardware está conectado, ahorrando memoria y evitando reboots.

---

### Pregunta 4 (30 segundos)
**¿En qué directorio del sistema de archivos de Linux se almacenan los módulos compilados correspondientes a la versión actual del kernel?**

- [ ] A) `/etc/kernel/modules/dynamic/drivers/storage/`
- [x] **B) `/lib/modules/$(uname -r)/`** ✅
- [ ] C) `/var/log/kernel/drivers/`
- [ ] D) `/usr/bin/kernel/modules/`

> **💡 Explicación:** El estándar FHS de Linux ubica los módulos del kernel en `/lib/modules/` organizados por cada versión del kernel instalada (`uname -r`).

---

### Pregunta 5 (30 segundos)
**¿Cuáles de los siguientes son intérpretes de comandos (*Shells*) reales y estándar en entornos UNIX/Linux?**

- [ ] A) CASH, DOS, CMD, NOTEPAD, EDIT, SYSTEMD, JOURNALCTL, GRUB
- [x] **B) BASH, ZSH, KSH, FISH, SH** ✅
- [ ] C) KERNEL, SYSTEMD, GRUB, INIT, UDEV
- [ ] D) GETTY, TELNET, SSH, PUTTY, TMUX

> **💡 Explicación:** Los shells estándar de UNIX/Linux incluyen Bourne Shell (`sh`), Bourne Again Shell (`bash`), Z Shell (`zsh`), Korn Shell (`ksh`), C Shell (`csh`/`tcsh`) y Friendly Interactive Shell (`fish`).

---

### Pregunta 6 (30 segundos)
**¿Qué información crucial almacena el Bloque de Control de Proceso (PCB / *task_struct* en Linux)?**

- [ ] A) Nombre del usuario activo, historial completo de comandos ejecutados en la terminal, contraseñas de red y certificados TLS del sistema.
- [x] **B) PID, estado, contador de programa (PC), registros y tabla de archivos.** ✅
- [ ] C) Código binario completo del programa cargado y sus librerías dinámicas.
- [ ] D) Tabla de particiones del disco rígido y configuración del gestor GRUB.

> **💡 Explicación:** El PCB es la estructura de datos que representa la identidad y estado completo del proceso para que el planificador (*scheduler*) pueda realizar cambios de contexto (*context switch*).

---

### Pregunta 7 (30 segundos)
**Al presionar la combinación de teclas `Ctrl + Z` en una terminal Linux mientras corre un comando en primer plano, ¿qué señal envía el sistema operativo al proceso?**

- [ ] A) `SIGKILL (9)`: Termina el proceso inmediatamente sin permitirle guardar su estado actual en memoria ni cerrar sus archivos abiertos.
- [ ] B) `SIGINT (2)`: Interrumpe y finaliza la ejecución del proceso actual.
- [x] **C) `SIGTSTP (20)`: Pausa el proceso y lo envía a segundo plano.** ✅
- [ ] D) `SIGHUP (1)`: Notifica al proceso que la terminal de control se cerró.

> **💡 Explicación:** `Ctrl + C` envía `SIGINT` (mata/interrumpe), mientras que `Ctrl + Z` envía `SIGTSTP` (pausa el proceso para poder continuarlo con `bg` o `fg`).

---

### Pregunta 8 (30 segundos)
**En Linux, el pseudocódigo o sistema de archivos virtual `/proc` se caracteriza por:**

- [ ] A) Directorio físico en disco que almacena respaldos persistentes de seguridad y volcados de memoria de las sesiones de usuario cerradas.
- [x] **B) Interfaz en RAM generada por el Kernel con estado y métricas del sistema.** ✅
- [ ] C) Directorio donde residen los binarios y ejecutables de los usuarios estándar.
- [ ] D) Base de datos que almacena las claves privadas y certificados del equipo.

> **💡 Explicación:** `/proc` es un sistema de archivos virtual (`procfs`) montado en memoria que permite leer el estado del kernel y de cada proceso vivo como si fueran archivos de texto.

---

### Pregunta 9 (45 segundos)
**¿Cuáles son las 4 condiciones necesarias de Coffman para que ocurra un Interbloqueo (*Deadlock*) en un sistema operativo?**

- [ ] A) Multiprocesamiento simétrico, memoria virtual paginada, algoritmos de reemplazo de páginas y saturación por hiperpaginación del bus.
- [ ] B) Modo usuario, modo kernel, interrupciones por hardware y drivers de periféricos.
- [x] **C) Exclusión mutua, retención y espera, no apropiación y espera circular.** ✅
- [ ] D) Procesador ocioso, memoria RAM agotada, disco lleno y red inaccesible.

> **💡 Explicación:** Si se rompe al menos una de estas 4 condiciones de Coffman, el interbloqueo es matemáticamente imposible de producirse.

---

### Pregunta 10 (45 segundos)
**Dos procesos P1 y P2 necesitan los recursos exclusivos Cinta (C) e Impresora (I). ¿Qué secuencia de ejecución generará con seguridad un Interbloqueo (*Deadlock*)?**

- [ ] A) P1 toma C -> P1 toma I -> P1 procesa datos -> P1 libera I -> P1 libera C -> P2 toma C -> P2 toma I -> P2 libera todo.
- [x] **B) P1 retiene C -> P2 retiene I -> P1 solicita I -> P2 solicita C.** ✅
- [ ] C) P1 solicita C -> P1 libera C -> P2 solicita I -> P2 libera I.
- [ ] D) P1 y P2 leen C e I en modo compartido sin solicitar acceso exclusivo.

> **💡 Explicación:** Es el clásico interbloqueo cruzado: P1 retiene C y espera I, mientras P2 retiene I y espera C. Se produce una espera circular donde ninguno puede avanzar.

---

## 📥 Formato Aiken (Listo para importar en Moodle / Wayground)

```text
Cual es la principal diferencia entre una interrupcion de hardware y un TRAP?
A. La de hardware la genera la CPU cuando un hilo de usuario intenta acceder a una instruccion privilegiada y el TRAP lo produce el compilador en tiempo de compilacion.
B. La de hardware es asincrona (externa); el TRAP es sincrono del programa.
C. La de hardware ocurre al reiniciar el equipo y el TRAP al apagarlo.
D. La de hardware corre en modo usuario y el TRAP en modo protegido.
ANSWER: B

En la arquitectura de sistemas operativos que ocurre al ejecutar una llamada al sistema?
A. El proceso se reinicia forzadamente, libera todos sus descriptores de archivos abiertos y el planificador del kernel le reasigna un nuevo identificador de proceso (PID).
B. Conmuta el privilegio de CPU de Modo Usuario a Modo Kernel mediante un TRAP.
C. El sistema operativo desactiva temporalmente la memoria de intercambio en disco.
D. El proceso toma control directo del bus fisico de datos sin pasar por el kernel.
ANSWER: B

Cual es la funcion principal de los modulos dinamicos del Kernel en Linux (.ko)?
A. Reconstruir y recompilar el arbol de codigo fuente del kernel completo en cada inicio del sistema operativo para adaptar los controladores.
B. Cargar y descargar controladores en caliente sin reiniciar el equipo.
C. Aumentar dinamicamente el tamano del archivo swap en el almacenamiento secundario.
D. Traducir scripts de Bash a lenguaje ensamblador en tiempo de carga.
ANSWER: B

En que directorio se almacenan los modulos compilados del kernel actual?
A. /etc/kernel/modules/dynamic/drivers/storage/
B. /lib/modules/$(uname -r)/
C. /var/log/kernel/drivers/
D. /usr/bin/kernel/modules/
ANSWER: B

Cuales son los interpretes de comandos estandar en Linux?
A. CASH, DOS, CMD, NOTEPAD, EDIT, SYSTEMD, JOURNALCTL, GRUB
B. BASH, ZSH, KSH, FISH, SH
C. KERNEL, SYSTEMD, GRUB, INIT, UDEV
D. GETTY, TELNET, SSH, PUTTY, TMUX
ANSWER: B

Que informacion crucial almacena el Bloque de Control de Proceso (PCB)?
A. Nombre del usuario activo, historial completo de comandos ejecutados en la terminal, contrasenas de red y certificados TLS del sistema.
B. PID, estado, contador de programa (PC), registros y tabla de archivos.
C. Codigo binario completo del programa cargado y sus librerias dinamicas.
D. Tabla de particiones del disco rigido y configuracion del gestor GRUB.
ANSWER: B

Al presionar Ctrl + Z en la terminal, que senal se envia al proceso?
A. SIGKILL (9): Termina el proceso inmediatamente sin permitirle guardar su estado actual en memoria ni cerrar sus archivos abiertos.
B. SIGINT (2): Interrumpe y finaliza la ejecucion del proceso actual.
C. SIGTSTP (20): Pausa el proceso y lo envia a segundo plano.
D. SIGHUP (1): Notifica al proceso que la terminal de control se cerro.
ANSWER: C

En Linux, el pseudo-filesystem /proc se caracteriza por:
A. Directorio fisico en disco que almacena respaldos persistentes de seguridad y volcados de memoria de las sesiones de usuario cerradas.
B. Interfaz en RAM generada por el Kernel con estado y metricas del sistema.
C. Directorio donde residen los binarios y ejecutables de los usuarios estandar.
D. Base de datos que almacena las claves privadas y certificados del equipo.
ANSWER: B

Cuales son las 4 condiciones de Coffman para que ocurra un Interbloqueo (Deadlock)?
A. Multiprocesamiento simetrico, memoria virtual paginada, algoritmos de reemplazo de paginas y saturacion por hiperpaginacion del bus.
B. Modo usuario, modo kernel, interrupciones por hardware y drivers de perifericos.
C. Exclusion mutua, retencion y espera, no apropiacion y espera circular.
D. Procesador ocioso, memoria RAM agotada, disco lleno y red inaccesible.
ANSWER: C

Dos procesos P1 y P2 necesitan recursos exclusivos Cinta e Impresora. Que secuencia genera Deadlock?
A. P1 toma C -> P1 toma I -> P1 procesa datos -> P1 libera I -> P1 libera C -> P2 toma C -> P2 toma I -> P2 libera todo.
B. P1 retiene C -> P2 retiene I -> P1 solicita I -> P2 solicita C.
C. P1 solicita C -> P1 libera C -> P2 solicita I -> P2 libera I.
D. P1 y P2 leen C e I en modo compartido sin solicitar acceso exclusivo.
ANSWER: B
```
