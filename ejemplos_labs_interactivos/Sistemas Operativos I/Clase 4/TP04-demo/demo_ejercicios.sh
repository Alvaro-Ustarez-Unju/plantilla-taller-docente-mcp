#!/usr/bin/env bash
# ==============================================================================
# UNIVERSIDAD NACIONAL DE JUJUY (UNJu) - FACULTAD DE INGENIERÍA
# SISTEMAS OPERATIVOS II - CICLO LECTIVO 2026
# SCRIPT DE DEMOSTRACIÓN EN VIVO (DOCENTE) — TRABAJO PRÁCTICO N° 4
# ==============================================================================
# Docente a cargo de la demostración: Ing. Fabio Damián Argañaraz Azua (JTP)
# Cátedra: Ing. María Fernanda Vázquez (Titular) | Ing. Fabio D. Argañaraz (JTP)
# ==============================================================================
# Propósito pedagógico:
# Repositorio 100% resuelto y estructurado para la sesión de Live-Coding (20 min)
# en la apertura de la Clase 4. Cada ejercicio muestra la aplicación práctica de
# conceptos de seguridad del sistema operativo (/etc/passwd, UIDs/GIDs, permisos
# POSIX en archivos y carpetas, auditoría de bits SETUID/SETGID, e implementación
# paso a paso del algoritmo criptográfico asimétrico RSA).
#
# Cada sección incluye:
# 1. El enunciado / consigna demostrativa docente.
# 2. La función Bash completamente resuelta.
# 3. La GUÍA PASO A PASO con los comandos interactivos por separado y la
#    explicación detallada de cada comando para guiar a los alumnos durante la
#    clase en vivo antes de plasmar la lógica en la función automatizada.
# ==============================================================================

export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin
mkdir -p soluciones_demo

# ------------------------------------------------------------------------------
# DEMO EJERCICIO 1: Análisis de Cuentas del Sistema y Estructura de /etc/passwd
# ------------------------------------------------------------------------------
# ENUNCIADO / CONSIGNA DEMOSTRATIVA DOCENTE:
# "Durante la apertura de la clase, el docente proyecta la terminal y demuestra
# cómo Linux implementa el control de acceso multiusuario mediante UIDs y GIDs.
# Se inspeccionan las cuentas críticas del sistema en '/etc/passwd' (como root y
# nobody), se determina la identidad del operador con 'whoami' e 'id', se contabilizan
# las shells interactivas frente a las shells deshabilitadas de servicios, y se
# desglosa la anatomía de los 7 campos de cada registro hacia:
# 'soluciones_demo/analisis_cuentas_servicio.txt'."
# ------------------------------------------------------------------------------
demo_ejercicio1_cuentas_servicio() {
    echo "  [DEMO 1] Inspeccionando cuentas del sistema, identidades y /etc/passwd..."
    mkdir -p soluciones_demo
    local target="soluciones_demo/analisis_cuentas_servicio.txt"

    {
        echo "=== REPORTE DOCENTE: IDENTIDADES Y ESTRUCTURA DE /etc/passwd ==="
        echo "Fecha de ejecución: $(date -u)"
        echo ""
        echo "--- 1. Cuentas Críticas del Sistema ---"
        grep -E "^(root|nobody|daemon|syslog):" /etc/passwd 2>/dev/null || grep -E "^(root|nobody):" /etc/passwd
        echo ""
        echo "--- 2. Identidad del Operador Docente ---"
        echo "USUARIO_ACTUAL: $(whoami) | UID: $(id -u) | GID: $(id -g) | GRUPO: $(id -gn)"
        echo ""
        echo "--- 3. Conteo de Shells Interactivas vs Deshabilitadas ---"
        local con_shell=$(grep -E ':(/bin/bash|/bin/sh|/bin/zsh)$' /etc/passwd 2>/dev/null | wc -l)
        local sin_shell=$(grep -E ':(/usr/sbin/nologin|/bin/false)$' /etc/passwd 2>/dev/null | wc -l)
        echo "CUENTAS_CON_SHELL: $con_shell"
        echo "CUENTAS_SIN_SHELL: $sin_shell"
        echo ""
        echo "--- 4. Anatomía de los 7 Campos de /etc/passwd ---"
        echo "Campo 1: Nombre de usuario (login)"
        echo "Campo 2: Contraseña cifrada o 'x' (apunta a /etc/shadow)"
        echo "Campo 3: UID numérico (User ID, root=0)"
        echo "Campo 4: GID numérico principal (Group ID)"
        echo "Campo 5: GECOS / Nombre descriptivo del usuario"
        echo "Campo 6: Ruta absoluta al directorio Home"
        echo "Campo 7: Shell asignada por defecto (/bin/bash, /bin/false, etc.)"
    } > "$target"

    echo "  [OK] Generado '$target'."
}
# ------------------------------------------------------------------------------
# 💡 GUÍA PASO A PASO EN VIVO PARA MOSTRAR A LOS ALUMNOS (DEMO 1):
# ------------------------------------------------------------------------------
# Paso 1.0: Fundamento conceptual del modelo multiusuario y control de acceso DAC:
#   -> Identificadores en Linux (UID y GID):
#      En el kernel de Linux no existen los nombres textuales; todo proceso, archivo
#      o recurso está asociado a un identificador numérico de usuario (UID - User ID)
#      y un identificador numérico de grupo (GID - Group ID).
#   -> Convenciones de UIDs:
#      - UID 0: Superusuario omnipotente ('root'). Ejerce privilegios totales y no está
#        sujeto a las comprobaciones normales de permisos del sistema de archivos.
#      - UID 1 a 999: Cuentas de servicio o demonios del sistema (System / Service Accounts).
#        Se crean para aplicar el "Principio de Menor Privilegio" (PoLP): si un servicio es vulnerado,
#        el atacante queda atrapado en los límites de esa cuenta sin comprometer al resto del SO.
#        No tienen contraseña interactiva ni shell habilitado (su shell suele ser /usr/sbin/nologin o /bin/false).
#        ¿Qué representa cada una?:
#        * 'daemon': Cuenta histórica y genérica de UNIX para ejecutar demonios o tareas de fondo
#          que no requieren un usuario específico dedicado (ej. utilitarios heredados del sistema).
#        * 'syslog': Demonio de bitácoras y auditoría del sistema (rsyslogd / syslog-ng). Posee
#          permisos exclusivos para escribir logs en /var/log, evitando que otros procesos puedan
#          manipular, borrar o adulterar registros forenses.
#        * 'www-data': Servidores y aplicaciones web (Apache, Nginx, PHP-FPM). Confinada a leer
#          archivos en /var/www; si una web sufre un ataque (RCE, SQLi), el atacante no puede
#          acceder a claves del kernel ni a los directorios /home de usuarios humanos.
#        * 'systemd' (systemd-network, systemd-resolve, systemd-timesync, etc.): Cuentas creadas
#          por el gestor de inicio para resolver DNS, sincronizar hora (NTP) o configurar red de forma
#          aislada en el espacio de usuario, sin necesidad de ejecutar dichos servicios como root.
#      - UID 1000+: Usuarios regulares humanos asignados a sesiones interactivas.
#      - UID 65534: Usuario especial sin privilegios 'nobody' (grupo 'nogroup'),
#        utilizado para procesos que no deben tener derecho de escritura en el sistema.
#
# Paso 1.1: Inspeccionar cuentas en /etc/passwd con 'cat' y 'grep':
#   $ cat /etc/passwd | head -n 5
#   $ grep -E "^(root|nobody|daemon|syslog):" /etc/passwd
#   -> Explicación:
#      - 'grep -E': Emplea expresiones regulares extendidas (ERE).
#      - El carácter '^' ancla la búsqueda al inicio exacto de la línea.
#      - '(root|nobody|...)': Operador de alternancia (OR) para capturar varias cuentas.
#      - El carácter ':' al final asegura coincidencia exacta con el campo de login,
#        evitando falsos positivos (ej. usuarios llamados 'root2' o 'nobody_backup').
#
# Paso 1.2: Determinar la identidad del usuario activo con 'whoami' e 'id':
#   $ whoami
#   -> Retorna el nombre de usuario textual que posee la sesión actual.
#   $ id -u
#   -> Retorna únicamente el número entero UID (ej. 1000 para usuario regular, 0 para root).
#   $ id -g
#   -> Retorna únicamente el GID del grupo primario asignado.
#   $ id -gn
#   -> Retorna el nombre textual del grupo primario.
#   $ id
#   -> Muestra el resumen completo: UID, GID y los grupos secundarios (groups=...).
#   -> Concepto de kernel: Al bifurcar un proceso ('fork'), el kernel copia las credenciales
#      en la estructura 'struct cred' de la 'task_struct'. Cualquier archivo nuevo creado
#      por el proceso heredará automáticamente el UID y GID de esa estructura.
#
# Paso 1.3: Conteo de shells interactivas vs deshabilitadas:
#   $ grep -E ':(/bin/bash|/bin/sh|/bin/zsh)$' /etc/passwd | wc -l
#   $ grep -E ':(/usr/sbin/nologin|/bin/false)$' /etc/passwd | wc -l
#   -> Explicación:
#      - El carácter '$' ancla la coincidencia al final exacto de la línea (séptimo campo).
#      - 'wc -l' (Word Count - Lines) cuenta la cantidad de líneas devueltas.
#      - ¿Por qué las cuentas de servicio tienen '/usr/sbin/nologin' o '/bin/false'?:
#        Es una medida fundamental de seguridad (Hardening): si la clave de una cuenta
#        de servicio llega a filtrarse, el atacante no podrá abrir una sesión de terminal
#        interactiva por SSH ni consola local, bloqueando la intrusión.
#
# Paso 1.4: Desglose y anatomía de los 7 campos de /etc/passwd:
#   Ejemplo 1 (Superusuario):    root:x:0:0:root:/root:/bin/bash
#   Ejemplo 2 (Usuario regular):  fabi0x:x:1000:1000:,,,:/home/fabi0x:/bin/bash
#
#   1. Login (root / fabi0x): Nombre de cuenta único e inmutable en el sistema.
#   2. Password ('x'): Indicador de contraseña (Shadow Flag). Antiguamente guardaba el hash.
#      Como /etc/passwd requiere permisos de lectura pública (644) para que utilitarios
#      como 'ls -l' o 'ps' traduzcan UIDs a nombres, el hash se migró a '/etc/shadow'
#      (con permisos 640 o 000 solo legibles por root/shadow) para evitar ataques de fuerza bruta offline.
#   3. UID (0 vs 1000): Identificador numérico del usuario asignado por el kernel.
#      El 0 es superusuario root; a partir de 1000 se asignan a usuarios humanos regulares
#      (el UID 1000 corresponde al primer usuario creado al instalar el sistema).
#   4. GID (0 vs 1000): Identificador numérico del grupo principal. En Debian/Ubuntu se usa
#      el esquema UPG (User Private Group), donde cada usuario nuevo recibe un grupo propio
#      homónimo con el mismo ID (fabi0x:1000).
#   5. GECOS (root vs ',,,'): Información general y de contacto del usuario.
#      Históricamente en UNIX/Debian se estructura como:
#      [Nombre Completo],[Habitación/Oficina],[Teléfono Laboral],[Teléfono Particular].
#      Las comas ' ,,, ' ocurren cuando se crea la cuenta con el comando interactivo 'adduser'
#      y se presiona [Enter] para omitir dichos campos opcionales, quedando los delimitadores vacíos.
#   6. Directorio Home (/root vs /home/fabi0x): Carpeta de inicio donde aterriza el usuario al loguearse.
#   7. Shell (/bin/bash): Binario ejecutable del intérprete de comandos asignado a la sesión.
#
# Paso 1.5: Cómo plasmarlo en la función automatizada:
#   En la función 'demo_ejercicio1_cuentas_servicio()', se agrupan todos los comandos
#   dentro de un bloque de redirección '{ ... } > "$target"' para generar el reporte
#   completo de forma limpia y atómica en 'soluciones_demo/analisis_cuentas_servicio.txt'.

# ------------------------------------------------------------------------------
# DEMO EJERCICIO 2: Laboratorio de Permisos POSIX en Archivos y Carpetas (20 Pts)
# ------------------------------------------------------------------------------
# ENUNCIADO / CONSIGNA DEMOSTRATIVA DOCENTE:
# "El docente demuestra la gestión de permisos POSIX estándar sobre archivos y
# carpetas. Se crea una estructura de laboratorio con una carpeta privada (700)
# que contiene claves confidenciales (600) y un script con permisos simbólicos
# (u=rwx,g=,o=). Además se configura una carpeta colaborativa para grupos (770) con
# un archivo compartido (660). Finalmente se utiliza 'stat -c' para auditar los
# modos octales y simbólicos hacia: 'soluciones_demo/reporte_permisos_demo.txt'."
# ------------------------------------------------------------------------------
demo_ejercicio2_laboratorio_permisos() {
    echo "  [DEMO 2] Configurando permisos POSIX restrictivos y colaborativos..."
    local base="soluciones_demo/lab_permisos_demo"
    local rep="soluciones_demo/reporte_permisos_demo.txt"
    mkdir -p "$base/restringido" "$base/compartido"

    # a) Carpeta restringida solo para el dueño (700 / rwx------)
    chmod 700 "$base/restringido"

    # b) Archivo de claves privadas solo lectura/escritura dueño (600 / rw-------)
    echo "CLAVES_PRIVADAS_BACKUP_2026_CONFIDENCIAL" > "$base/restringido/claves_backup.txt"
    chmod 600 "$base/restringido/claves_backup.txt"

    # c) Script de despliegue con permisos simbólicos solo dueño (u=rwx,g=,o= -> 700)
    cat << 'EOF' > "$base/restringido/deploy.sh"
#!/usr/bin/env bash
echo "Despliegue docente autorizado."
EOF
    chmod u=rwx,g=,o= "$base/restringido/deploy.sh"

    # d) Carpeta compartida para grupo de trabajo (770 / rwxrwx---)
    chmod 770 "$base/compartido"

    # e) Archivo colaborativo de lectura y escritura para grupo (660 / rw-rw----)
    echo "NOTAS_DE_INVESTIGACION_CONJUNTA_SOII" > "$base/compartido/colaboracion.txt"
    chmod 660 "$base/compartido/colaboracion.txt"

    # Volcar reporte de stat
    {
        echo "=== REPORTE DOCENTE DE PERMISOS POSIX CON STAT ==="
        stat -c "%a | %A | %n" \
            "$base/restringido" \
            "$base/restringido/claves_backup.txt" \
            "$base/restringido/deploy.sh" \
            "$base/compartido" \
            "$base/compartido/colaboracion.txt"
    } > "$rep"

    echo "  [OK] Laboratorio de permisos generado en '$base' y reporte en '$rep'."
}
# ------------------------------------------------------------------------------
# 💡 GUÍA PASO A PASO EN VIVO PARA MOSTRAR A LOS ALUMNOS (DEMO 2):
# ------------------------------------------------------------------------------
# Paso 2.0: Fundamento conceptual de la matriz de 9 bits y el significado de 'x' en carpetas:
#   -> La matriz de 9 bits POSIX:
#      Cada inodo almacena 3 ternas de bits: Usuario (u), Grupo (g) y Otros (o).
#      Cada terna contiene los bits: 'r' (Read = 4), 'w' (Write = 2), 'x' (Execute = 1).
#   -> ¿Qué significa 'x' en archivos vs directorios? (Slide 52 de la teoría):
#      - En archivos regulares:
#        'r': Permite abrir y leer el contenido de datos.
#        'w': Permite modificar o truncar el archivo.
#        'x': Permite cargar el archivo en memoria y ejecutarlo como proceso ('execve').
#      - En directorios:
#        'r': Permite listar los nombres de los archivos internos con 'ls'.
#        'w': Permite CREAR, RENOMBRAR o BORRAR archivos dentro de esa carpeta
#             (¡el borrado depende de los permisos del directorio, no del archivo!).
#        'x' (Búsqueda / Travesía): Permite ATRAVESAR o ingresar al directorio con 'cd'
#             y acceder a los inodos de los archivos internos. Sin el permiso 'x' en el
#             directorio, un usuario NO PODRÁ leer ningún archivo adentro, incluso si
#             el archivo tuviera permisos 777.
#
# Paso 2.1: Crear la estructura de carpetas:
#   $ mkdir -p soluciones_demo/lab_permisos_demo/restringido
#   $ mkdir -p soluciones_demo/lab_permisos_demo/compartido
#   -> 'mkdir -p' crea directorios de forma recursiva sin arrojar error si ya existían.
#
# Paso 2.2: Asignar permisos octales 700 a la carpeta restringida:
#   $ chmod 700 soluciones_demo/lab_permisos_demo/restringido
#   -> Explicación:
#      - 700 = rwx------.
#      - Dueño (7 = 4+2+1): Puede listar, crear/borrar archivos y entrar con 'cd'.
#      - Grupo (0 = 0+0+0) y Otros (0): Bloqueo total. Ningún otro usuario del sistema
#        puede entrar ni ver qué archivos existen en su interior.
#
# Paso 2.3: Crear archivo de claves y protegerlo con permisos 600:
#   $ echo "CLAVES_PRIVADAS_BACKUP" > soluciones_demo/lab_permisos_demo/restringido/claves_backup.txt
#   $ chmod 600 soluciones_demo/lab_permisos_demo/restringido/claves_backup.txt
#   -> Explicación:
#      - 600 = rw-------.
#      - Dueño (6 = 4+2+0): Puede leer y escribir.
#      - No se asigna 'x' (1) porque las claves no son ejecutables (principio de mínimo privilegio).
#
# Paso 2.4: Crear script y configurar permisos en modo simbólico:
#   $ chmod u=rwx,g=,o= soluciones_demo/lab_permisos_demo/restringido/deploy.sh
#   -> Explicación de la sintaxis simbólica:
#      - 'u=rwx': Fija lectura, escritura y ejecución al propietario.
#      - 'g=': Deja vacío (elimina todo permiso al grupo).
#      - 'o=': Deja vacío (elimina todo permiso al resto del mundo).
#      - Equivale matemáticamente al modo octal 700.
#
# Paso 2.5: Configurar entorno colaborativo para grupos (770 y 660):
#   $ chmod 770 soluciones_demo/lab_permisos_demo/compartido
#   $ chmod 660 soluciones_demo/lab_permisos_demo/compartido/colaboracion.txt
#   -> Explicación:
#      - 770 = rwxrwx---. Permite que todos los integrantes del grupo ingresen, listen y creen archivos.
#      - 660 = rw-rw----. Permite que cualquier miembro del grupo lea y edite el documento de trabajo,
#        impidiendo el acceso a terceros ajenos al equipo ('o=---').
#
# Paso 2.6: Auditar permisos con 'stat -c':
#   $ stat -c "%a | %A | %n" soluciones_demo/lab_permisos_demo/restringido
#   -> Explicación de especificadores:
#      - '%a': Formato octal de permisos (ej. 700, 600, 770).
#      - '%A': Cadena simbólica de 10 caracteres legibles (ej. drwx------, -rw-------).
#      - '%n': Ruta del archivo inspeccionado.
#
# Paso 2.7: Cómo se plasma en la función automatizada:
#   La función 'demo_ejercicio2_laboratorio_permisos()' ejecuta los comandos secuencialmente
#   y vuelca el reporte unificado con 'stat -c' en 'soluciones_demo/reporte_permisos_demo.txt'.

# ------------------------------------------------------------------------------
# DEMO EJERCICIO 3: Auditoría de Bits Especiales SETUID y SETGID (20 Pts)
# ------------------------------------------------------------------------------
# ENUNCIADO / CONSIGNA DEMOSTRATIVA DOCENTE:
# "El docente explica el dilema de seguridad: ¿cómo un usuario normal puede cambiar
# su contraseña si '/etc/shadow' solo puede ser modificado por root?
# Se analiza el bit especial SETUID (4000) inspeccionando '/usr/bin/passwd',
# '/usr/bin/su' y '/usr/bin/sudo'. Se diferencia el UID Real del UID Efectivo
# y se auditan los binarios privilegiados del sistema volcando el resultado hacia:
# 'soluciones_demo/analisis_suid_demo.txt'."
# ------------------------------------------------------------------------------
demo_ejercicio3_analisis_suid_sgid() {
    echo "  [DEMO 3] Auditando binarios privilegiados con bit SETUID y SETGID..."
    mkdir -p soluciones_demo
    local target="soluciones_demo/analisis_suid_demo.txt"

    {
        echo "=== REPORTE DOCENTE: AUDITORÍA DE BITS ESPECIALES SUID Y SGID ==="
        echo ""
        echo "--- 1. Inspección de Ejecutables Privilegiados Clásicos ---"
        for bin in "/usr/bin/passwd" "/usr/bin/su" "/usr/bin/sudo"; do
            if [ -f "$bin" ]; then
                stat -c "%a | %A | Propietario: %U(%u) | %n" "$bin" 2>/dev/null
            fi
        done
        echo ""
        echo "--- 2. Justificación Técnica del Bit SETUID (Slide 53) ---"
        echo "El comando '/usr/bin/passwd' requiere escribir en '/etc/shadow', el cual"
        echo "pertenece a 'root:shadow' con permisos estrictos (640 / 000). Al ejecutarse,"
        echo "el bit SETUID (4000) hace que el proceso adopte el UID Efectivo de root (0)"
        echo "temporalmente, permitiendo que usuarios sin privilegios modifiquen su clave de forma controlada."
        echo "Diferencia de Identificadores:"
        echo "- UID Real: Usuario que lanzó la ejecución del proceso en su shell."
        echo "- UID Efectivo: Credencial utilizada por el kernel para evaluar permisos de acceso."
        echo ""
        echo "--- 3. Muestra de Ejecutables con SETUID / SETGID en /usr/bin ---"
        find /usr/bin \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null | head -n 8
    } > "$target"

    echo "  [OK] Generado '$target'."
}
# ------------------------------------------------------------------------------
# 💡 GUÍA PASO A PASO EN VIVO PARA MOSTRAR A LOS ALUMNOS (DEMO 3):
# ------------------------------------------------------------------------------
# Paso 3.0: Fundamento conceptual del bit SETUID y la resolución del dilema de privilegios:
#   -> El dilema de seguridad:
#      Cualquier usuario común necesita poder cambiar su propia contraseña mediante el
#      comando '/usr/bin/passwd'. Sin embargo, las contraseñas cifradas residen en '/etc/shadow',
#      un archivo propiedad de root con permisos '640' (o '000' en algunos sistemas).
#      Un usuario regular NO TIENE permiso de escritura sobre '/etc/shadow'.
#   -> La solución del kernel: El bit especial SETUID (octal 4000) (Slide 53):
#      Cuando un binario tiene activo el bit SETUID, al ejecutarse, el proceso resultante
#      adopta temporalmente el UID del PROPIETARIO del archivo (en este caso root, UID 0).
#   -> Distinción crucial entre UID Real y UID Efectivo:
#      - UID Real (RUID): Identifica al usuario humano que ejecutó el comando desde la consola.
#        Se obtiene en C con la llamada al sistema 'getuid()'.
#      - UID Efectivo (EUID): Es el identificador que el kernel consulta y evalúa para validar
#        los permisos en llamadas al sistema como 'open()', 'write()' o 'chmod()'.
#        Se obtiene en C con 'geteuid()'.
#      - Al ejecutar 'passwd': RUID = 1000 (usuario común), pero EUID = 0 (root).
#        Por ende, la escritura en '/etc/shadow' es autorizada por el kernel.
#
# Paso 3.1: Inspeccionar '/usr/bin/passwd' con 'ls -l' y 'stat':
#   $ ls -l /usr/bin/passwd
#   $ stat -c "%a | %A | Propietario: %U(%u) | %n" /usr/bin/passwd
#   -> Explicación de la salida:
#      - Observar los permisos: '-rwsr-xr-x' y el modo octal '4755'.
#      - La letra 's' minúscula en la posición de ejecución del dueño ('rws') denota el bit SETUID activo.
#      - Si el archivo no tuviera permiso de ejecución para el dueño ('rw-'), el bit se mostraría
#        con una 'S' mayúscula como advertencia de anomalía.
#
# Paso 3.2: Comparación de los tres bits especiales de Linux:
#   1. SETUID (4000): Ejecuta adoptando temporalmente el UID del propietario (ej: passwd, su, sudo).
#   2. SETGID (2000):
#      - En archivos ejecutables: Adopta el GID del grupo del archivo (ej: '/usr/bin/wall' o 'crontab').
#      - En directorios: Todo archivo creado adentro hereda automáticamente el grupo del directorio padre
#        en lugar del grupo primario del usuario creador (clave en carpetas de proyectos compartidos).
#   3. Sticky Bit (1000):
#      - En directorios compartidos de escritura pública como '/tmp' ('1777' / 'drwxrwxrwt'), impide que
#        un usuario borre o renombre archivos creados por otros usuarios. Solo el dueño del archivo o root
#        pueden eliminarlo.
#
# Paso 3.3: Localizar binarios privilegiados en el sistema con 'find':
#   $ find /usr/bin -perm -4000 -type f 2>/dev/null | head -n 5
#   $ find /usr/bin \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null | head -n 8
#   -> Explicación de los parámetros de 'find':
#      - '-perm -4000': El prefijo '-' indica que los bits especificados deben estar activos
#        (captura 4755, 4711, etc.).
#      - '-type f': Filtra solo archivos regulares, descartando carpetas.
#      - '\( ... -o ... \)': Paréntesis escapados y operador OR (-o) para buscar SUID o SGID simultáneamente.
#      - '2>/dev/null': Redirige los mensajes de error a /dev/null para no ensuciar la salida.
#
# Paso 3.4: Riesgo de seguridad en producción:
#   Los binarios con SETUID representan un vector crítico de ataque: si un binario SUID de root
#   posee una vulnerabilidad (desbordamiento de buffer, inyección de variables de entorno),
#   un intruso puede escalar privilegios a root. Por eso, auditorías de seguridad monitorean
#   continuamente cualquier nuevo ejecutable SUID que aparezca en el sistema.
#
# Paso 3.5: Cómo se plasma en la función automatizada:
#   La función 'demo_ejercicio3_analisis_suid_sgid()' inspecciona los binarios clave, documenta
#   la justificación de UID Real vs Efectivo y guarda el listado en 'soluciones_demo/analisis_suid_demo.txt'.

# ------------------------------------------------------------------------------
# DEMO EJERCICIO 4: Criptografía Asimétrica RSA (Caso Oficial Diapositiva 36) (20 Pts)
# ------------------------------------------------------------------------------
# ENUNCIADO / CONSIGNA DEMOSTRATIVA DOCENTE:
# "El docente presenta los fundamentos matemáticos de la criptografía de clave pública
# RSA siguiendo el caso exacto de la Diapositiva 36 de la cátedra:
# Primos p = 7 y q = 13, módulo N = 91, función de Euler phi(N) = 72, clave pública
# e = 5 y clave privada d = 29.
# Se demuestra el cifrado del mensaje claro M = 69 obteniendo el criptograma C = 62,
# y su posterior descifrado recuperando M = 69. Los cálculos y mensajes adicionales
# se registran en: 'soluciones_demo/criptografia_rsa_demo.txt'."
# ------------------------------------------------------------------------------
demo_ejercicio4_criptografia_rsa_slide36() {
    echo "  [DEMO 4] Calculando criptografía asimétrica RSA (Ejemplo Diapositiva 36)..."
    mkdir -p soluciones_demo
    local target="soluciones_demo/criptografia_rsa_demo.txt"

    # Ejecutar cálculos exactos en Python
    python3 -c "
p = 7
q = 13
N = p * q
phi = (p - 1) * (q - 1)
e = 5
d = 29

assert (e * d) % phi == 1, 'Error en clave privada'

# Mensajes a procesar
mensajes = [69, 18, 25, 45]
cifrados = [pow(m, e, N) for m in mensajes]
descifrados = [pow(c, d, N) for c in cifrados]

with open('$target', 'w', encoding='utf-8') as f:
    f.write('=== REPORTE DOCENTE: ALGORITMO CRIPTOGRÁFICO RSA (SLIDE 36) ===\n\n')
    f.write('1. Parámetros Fundamentales:\n')
    f.write(f'   - Número primo p = {p}\n')
    f.write(f'   - Número primo q = {q}\n')
    f.write(f'   - Módulo del sistema N = p * q = {N}\n')
    f.write(f'   - Función de Euler phi(N) = (p-1)*(q-1) = {phi}\n')
    f.write(f'   - Clave pública e = {e} (coprimo con {phi})\n')
    f.write(f'   - Clave privada d = {d} (puesto que ({e} * {d}) mod {phi} = {(e*d)%phi})\n\n')
    f.write('2. Procesamiento de Mensajes Claros y Criptogramas:\n')
    for m, c, desc in zip(mensajes, cifrados, descifrados):
        f.write(f'   - Mensaje Claro M = {m}\n')
        f.write(f'     Cifrado: C = ({m}^{e}) mod {N} = {c}\n')
        f.write(f'     Descifrado: M = ({c}^{d}) mod {N} = {desc}\n')
        assert m == desc
    f.write('\n3. Verificación de Integridad Matemática: EXITOSA [100%]\n')
"
    echo "  [OK] Criptografía RSA calculada y guardada en '$target'."
}
# ------------------------------------------------------------------------------
# 💡 GUÍA PASO A PASO EN VIVO PARA MOSTRAR A LOS ALUMNOS (DEMO 4):
# ------------------------------------------------------------------------------
# Paso 4.0: Fundamento conceptual de la Criptografía Asimétrica de Clave Pública:
#   -> Criptografía Simétrica vs Asimétrica (Slides 33 y 34):
#      - Simétrica (DES, 3DES, AES): Se utiliza la misma clave para cifrar y descifrar.
#        Problema: ¿Cómo acordar la clave secreta inicialmente sin que sea interceptada?
#      - Asimétrica (Diffie-Hellman, RSA): Utiliza un par de claves matemáticamente enlazadas:
#        * Clave Pública (e, N): Se distribuye abiertamente a cualquier persona que desee enviar datos.
#        * Clave Privada (d, N): Se custodia en estricto secreto por el receptor legítimo.
#   -> Principio matemático de una sola dirección con trampa (Trapdoor One-Way Function):
#      - Multiplicar dos primos grandes p y q para obtener N = p*q es trivial en microsegundos.
#      - Invertir el proceso (factorizar N para descubrir p y q) es un problema computacionalmente
#        intratable cuando los primos tienen miles de bits (2048 o 4096 bits en RSA moderno).
#
# Paso 4.1: Desarrollo matemático paso a paso con los valores de la Diapositiva 36:
#   1. Elegir dos números primos:
#      p = 7 y q = 13.
#   2. Calcular el módulo del sistema N:
#      N = p * q = 7 * 13 = 91.
#      (N es público y define el rango numérico de los mensajes: 0 <= M < N).
#   3. Calcular la función indicatriz de Euler phi(N):
#      phi(N) = (p - 1) * (q - 1) = (7 - 1) * (13 - 1) = 6 * 12 = 72.
#   4. Elegir la clave pública e:
#      Debe cumplir: 1 < e < phi(N) y gcd(e, phi(N)) = 1 (coprimo con 72).
#      Factores de 72 = 2^3 * 3^2.
#      Elegimos e = 5 (no comparte ningún factor primo con 72).
#      -> Clave Pública del receptor: Kp = (e=5, N=91).
#   5. Calcular la clave privada d (Inverso modular multiplicativo):
#      Debe satisfacer la congruencia: (e * d) mod phi(N) = 1.
#      (5 * d) mod 72 = 1.
#      Probamos múltiplos de 72:
#      - 72 * 1 + 1 = 73 (no divisible por 5).
#      - 72 * 2 + 1 = 145 -> 145 / 5 = 29 (exacto).
#      Por lo tanto: d = 29.
#      -> Clave Privada del receptor: Ks = (d=29, N=91).
#
# Paso 4.2: Cifrar interactivamente el mensaje claro M = 69 desde la terminal:
#   -> Fórmula de cifrado: C = (M ^ e) mod N
#      C = (69 ^ 5) mod 91
#   -> Ejecutar en el shell con una sola línea de Python:
#      $ python3 -c "print(pow(69, 5, 91))"
#   -> Resultado en pantalla: 62.
#      El mensaje cifrado (criptograma) que viaja por el canal inseguro es C = 62.
#
# Paso 4.3: Descifrar interactivamente el criptograma C = 62 con la clave privada:
#   -> Fórmula de descifrado: M = (C ^ d) mod N
#      M = (62 ^ 29) mod 91
#   -> Ejecutar en el shell con Python:
#      $ python3 -c "print(pow(62, 29, 91))"
#   -> Resultado en pantalla: 69.
#      ¡El receptor recupera exactamente el mensaje original M = 69!
#
# Paso 4.4: Procesar otros mensajes claros en vivo:
#   $ python3 -c "for m in [18, 25, 45]: c = pow(m, 5, 91); print(f'M={m} -> C={c} -> M={pow(c, 29, 91)}')"
#   -> Muestra cómo cualquier mensaje dentro de [0, 90] se cifra y descifra sin pérdida.
#
# Paso 4.5: Cómo se plasma en la función automatizada:
#   En la función 'demo_ejercicio4_criptografia_rsa_slide36()', se invoca el cálculo mediante
#   un bloque Python embebido que verifica matemáticamente las aserciones y escribe el
#   reporte formal en 'soluciones_demo/criptografia_rsa_demo.txt'.

# ------------------------------------------------------------------------------
# DEMO EJERCICIO 5: Verificación del Módulo Web Docente con autograder_tp4_demo.py
# ------------------------------------------------------------------------------
# ENUNCIADO / CONSIGNA DEMOSTRATIVA DOCENTE:
# "El docente demuestra el flujo de evaluación criptográfica 'Zero-Knowledge'
# utilizando 'autograder_tp4_demo.py'. El script valida las respuestas exportadas
# de la web frente a los hashes SHA-256 de la rúbrica protegida con el salt de
# cátedra, alcanzando 100/100 Pts."
# ------------------------------------------------------------------------------
demo_ejercicio5_autoevaluacion_web() {
    echo "  [DEMO 5] Verificando módulo web demo con autograder_tp4_demo.py..."
    local target="soluciones_demo/respuestas_tp4_demo.json"
    if [ ! -f "$target" ]; then
        echo "  [ERROR] No se encontró '$target'."
        return 1
    fi
    python3 autograder_tp4_demo.py "$target" --rubric rubric_tp4_demo.json
}
# ------------------------------------------------------------------------------
# 💡 GUÍA PASO A PASO EN VIVO PARA MOSTRAR A LOS ALUMNOS (DEMO 5):
# ------------------------------------------------------------------------------
# Paso 5.0: Filosofía de evaluación protegida con SHA-256 y Salt de Cátedra:
#   -> ¿Por qué la rúbrica no contiene las respuestas en texto claro?:
#      Para evitar que los alumnos simplemente lean el archivo JSON de corrección
#      y copien las respuestas sin razonar los conceptos.
#   -> Algoritmo de hash de evaluación:
#      hash = SHA256( ejercicio_id + ":" + item_id + ":" + valor + ":" + CATEDRA_SALT )
#      Donde CATEDRA_SALT es una clave secreta del cuerpo docente que previene ataques
#      de tablas arcoíris (Rainbow Tables).
#
# Paso 5.1: Ejecutar la autoevaluación manualmente desde el shell:
#   $ python3 autograder_tp4_demo.py soluciones_demo/respuestas_tp4_demo.json --rubric rubric_tp4_demo.json
#   -> Explicación:
#      El script procesa cada sección:
#      - Sección 1: Conceptos Fundamentales (20 Pts)
#      - Sección 2: Switches Segmentados (20 Pts)
#      - Sección 3: Laboratorio RSA (25 Pts)
#      - Sección 4: Orden del Login Seguro en Linux (20 Pts)
#      - Sección 5: Matriz de Permisos POSIX y SUID (15 Pts)
#      Si todas las firmas criptográficas coinciden, otorga 100 / 100 Pts y sale con código 0.
#
# Paso 5.2: Ejecución de la suite completa de pruebas:
#   $ ./test_demo.sh
#   -> Valida automáticamente las 5 funciones demostrativas, verifica la existencia
#      de los reportes en 'soluciones_demo/' y muestra el resumen calificado final.

ejecutar_todas_las_demos() {
    echo "=================================================================="
    echo " INICIANDO EJECUCIÓN DE TODAS LAS DEMOSTRACIONES DOCENTES (TP 4)  "
    echo "=================================================================="
    demo_ejercicio1_cuentas_servicio
    demo_ejercicio2_laboratorio_permisos
    demo_ejercicio3_analisis_suid_sgid
    demo_ejercicio4_criptografia_rsa_slide36
    demo_ejercicio5_autoevaluacion_web
    echo "=================================================================="
    echo " DEMOSTRACIONES DOCENTES COMPLETADAS EXITOSAMENTE EN soluciones_demo/"
    echo "=================================================================="
}

# Ejecución automática al llamar directamente este script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    ejecutar_todas_las_demos
fi
