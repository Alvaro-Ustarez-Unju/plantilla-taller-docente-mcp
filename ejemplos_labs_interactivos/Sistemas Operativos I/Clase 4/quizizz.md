# 🎮 Cuestionario Quizizz / Wayground — Unidad 4: Seguridad y Protección en Sistemas Operativos

> **Universidad Nacional de Jujuy (UNJu) — Facultad de Ingeniería**  
> **Cátedra:** Sistemas Operativos II — Ciclo Lectivo 2026  
> **Equipo Docente:** Ing. María Fernanda Vázquez (Titular) | Ing. Fabio Damián Argañaraz Azua (JTP)  
> **Uso:** Actividad interactiva en vivo (10-15 min) para la apertura de la **Clase 4 / TP 04**.  
> **Pautas Pedagógicas:** Opciones redactadas sin negritas delatoras, simetría rigurosa de longitud, distractores técnicamente sólidos y distribución equitativa de respuestas correctas (A: 3, B: 2, C: 3, D: 2).

---

## 📋 Banco de Preguntas Evaluativas

---

### Pregunta 1 (30 segundos)
**En la teoría clásica de sistemas operativos, ¿cuál es la distinción conceptual precisa entre los términos Protección y Seguridad?**

- [ ] A) La protección se enfoca en resguardar el hardware físico ante desastres ambientales mientras que la seguridad administra la asignación de memoria swap en el kernel.
- [ ] B) Ambos términos son sinónimos técnicos intercambiables que describen el empleo de algoritmos criptográficos asimétricos en la capa de transporte de redes locales.
- [x] C) La protección es un problema interno que controla el acceso a datos y programas; la seguridad abarca además el entorno externo y el uso previsto de los recursos. ✅
- [ ] D) La seguridad es un mecanismo interno que supervisa los descriptores de archivos abiertos y la protección es una política externa orientada a evitar filtraciones físicas.

> **💡 Explicación:** La protección es estrictamente un mecanismo interno del sistema operativo para controlar y limitar el acceso de procesos y usuarios a los recursos del sistema (programas, memoria, archivos). La seguridad es un concepto más amplio que contempla las amenazas del entorno externo y garantiza que los recursos sean utilizados únicamente de la forma prevista y sin interferencias maliciosas o accidentales (Diapositivas Unidad 4 - Slides 3 y 4).

---

### Pregunta 2 (30 segundos)
**En el análisis de amenazas a la comunicación entre una fuente y un destino remoto, ¿qué categoría de ataque vulnera directamente la Confidencialidad de la información?**

- [x] A) Intercepción, cuando una entidad no autorizada logra acceder a los datos o escuchar la transmisión sin alterar necesariamente el flujo. ✅
- [ ] B) Interrupción, cuando se destruye un canal físico de comunicación o se eliminan registros en las unidades de almacenamiento secundario.
- [ ] C) Fabricación, cuando un atacante inserta mensajes espurios o genera transacciones falsas haciéndose pasar por una entidad de confianza del sistema.
- [ ] D) Modificación, cuando un intruso intercepta el paquete en tránsito y altera su contenido antes de que arribe al nodo receptor final de la red.

> **💡 Explicación:** La Intercepción consiste en que un intruso no autorizado obtiene acceso a información privada (ej. escuchas en línea, copias ilícitas), comprometiendo la Confidencialidad. En contraste, la Interrupción afecta la Disponibilidad, la Modificación afecta la Integridad y la Fabricación afecta la Autenticidad (Diapositivas Unidad 4 - Slides 10 a 15).

---

### Pregunta 3 (30 segundos)
**De acuerdo con la clasificación de intrusos vista en la teoría, ¿cómo se caracterizan los intrusos pasivos frente a los intrusos activos?**

- [ ] A) Los intrusos pasivos operan mediante la inyección de ransomware en servidores y los activos emplean scripts de automatización en segundo plano.
- [ ] B) Los intrusos activos pertenecen exclusivamente a la categoría de malware no convencional y los pasivos son usuarios sin privilegios de red.
- [ ] C) Los intrusos pasivos modifican subrepticiamente los registros de base de datos y los activos se limitan a recopilar metadatos de tráfico web.
- [x] D) Los intrusos pasivos solo buscan leer datos no autorizados sin alterarlos; los intrusos activos intentan realizar modificaciones no autorizadas en el sistema. ✅

> **💡 Explicación:** Según el diseño de sistemas seguros contra intrusos, un intruso pasivo intenta inspeccionar o leer información confidencial sin alterar los archivos ni el estado del sistema, mientras que un intruso activo interviene activamente modificando datos, alterando configuraciones o fabricando información espuria (Diapositivas Unidad 4 - Slide 7).

---

### Pregunta 4 (30 segundos)
**En la caracterización técnica del malware clásico, ¿qué propiedades definen al modelo DAS representativo de los virus informáticos?**

- [ ] A) Dinámico, Autenticado y Sincrónico, describiendo su capacidad para evadir cortafuegos mediante túneles encapsulados de red.
- [x] B) Dañino, Autorreplicante y Subrepticio, contemplando su capacidad destructiva, su propagación y su ejecución oculta al usuario. ✅
- [ ] C) Distribuido, Asimétrico y Segmentado, indicando su ejecución concurrente a través de múltiples hilos de procesamiento en el kernel.
- [ ] D) Descentralizado, Autónomo y Silencioso, reflejando su diseño para minar criptoactivos utilizando la memoria de la placa de video.

> **💡 Explicación:** El modelo DAS define a los virus mediante tres pilares: Dañino (contiene rutinas orientadas a provocar daños o consumo abusivo de recursos), Autorreplicante (posee un módulo de reproducción para parasitar ejecutables o documentos) y Subrepticio (actúa de manera oculta y clandestina sin el consentimiento explícito del operador) (Diapositivas Unidad 4 - Slides 18 y 20).

---

### Pregunta 5 (30 segundos)
**En los esquemas de autenticación de usuarios del sistema operativo, ¿a cuál de los tres principios generales pertenece el uso de tarjetas con franja magnética o chip inteligente?**

- [ ] A) Algo que CONOCE el usuario, dado que la tarjeta contiene una clave alfanumérica fija configurada por el administrador en su memoria de solo lectura.
- [ ] B) Algo que ES el usuario, ya que el chip se enlaza de forma unívoca con el patrón biométrico del iris o la geometría vascular de la mano del operador.
- [x] C) Algo que TIENE el usuario, constituyendo un elemento físico o dispositivo de posesión requerido para validar la identidad ante el sistema. ✅
- [ ] D) Algo que HACE el usuario, evaluando la cadencia de tipeo y la velocidad motriz con la que se inserta la tarjeta plástica en la ranura lectora.

> **💡 Explicación:** La autenticación se sustenta en tres principios: algo que se conoce (contraseñas, PINs), algo que se tiene (llaves, tarjetas magnéticas, tarjetas con chip inteligente, tokens OTP) y algo que se es (biometría: huellas dactilares, reconocimiento de voz o iris) (Diapositivas Unidad 4 - Slides 22 a 27).

---

### Pregunta 6 (30 segundos)
**En criptografía asimétrica, ¿en qué principio matemático radica la seguridad del algoritmo y la protección de la clave privada?**

- [x] A) En la extrema dificultad computacional para revertir funciones matemáticas de un solo sentido (como factorizar el producto de dos primos grandes). ✅
- [ ] B) En mantener el algoritmo de cifrado en estricto secreto comercial para que los intrusos desconozcan las transformaciones de bits aplicadas.
- [ ] C) En utilizar exactamente la misma clave secreta de 56 bits en ambos extremos acordada previamente mediante canales telefónicos seguros.
- [ ] D) En fragmentar los mensajes claros en bloques de longitud variable que se transmiten exclusivamente a través de circuitos locales de fibra oscura.

> **💡 Explicación:** En la criptografía de clave pública (asimétrica), las claves de cifrado y descifrado son distintas. La clave pública se puede divulgar abiertamente porque deducir la clave privada requiere resolver un problema matemático intratable en tiempo polinomial (función trampilla de un solo sentido, como la factorización de N = p*q en RSA o el logaritmo discreto) (Diapositivas Unidad 4 - Slides 34 y 35).

---

### Pregunta 7 (30 segundos)
**Para el algoritmo RSA, si se eligen los números primos p = 7 y q = 13, ¿cuáles son los valores del módulo N y de la función de Euler φ(N)?**

- [ ] A) El módulo es N = 20 y el valor de la función de Euler es φ(N) = 18.
- [ ] B) El módulo es N = 84 y el valor de la función de Euler es φ(N) = 78.
- [ ] C) El módulo es N = 91 y el valor de la función de Euler es φ(N) = 84.
- [x] D) El módulo es N = 91 y el valor de la función de Euler es φ(N) = 72. ✅

> **💡 Explicación:** El módulo del sistema RSA se calcula como el producto de ambos primos: N = p * q = 7 * 13 = 91. La función de Euler correspondiente es φ(N) = (p - 1) * (q - 1) = (7 - 1) * (13 - 1) = 6 * 12 = 72 (Diapositivas Unidad 4 - Slide 36).

---

### Pregunta 8 (30 segundos)
**¿Cuál de las siguientes afirmaciones describe con precisión una limitación fundamental de los cortafuegos (firewalls) explicada en la cátedra?**

- [ ] A) No pueden ejecutarse bajo ningún concepto como módulos de software dentro de sistemas operativos modernos tipo Linux o BSD.
- [x] B) No eliminan el malware que intenta ingresar al sistema ni protegen contra ataques cuyo tráfico no atraviese directamente el dispositivo. ✅
- [ ] C) Son incapaces de implementar políticas restrictivas de denegación por defecto sobre el tráfico entrante en redes de área local.
- [ ] D) Requieren obligatoriamente la instalación de un servidor de nombres DNS dedicado para filtrar paquetes a nivel de capa de enlace.

> **💡 Explicación:** Un cortafuegos bloquea accesos no autorizados a nivel de red, pero NO elimina el malware que intenta entrar (solo restringe puertos/IPs), no protege contra ataques internos o usuarios negligentes, no previene engaños de ingeniería social ni actúa sobre tráfico que circule por vías alternas sin pasar por él (Diapositivas Unidad 4 - Slide 42).

---

### Pregunta 9 (30 segundos)
**En el sistema de archivos de GNU/Linux, ¿qué función cumple el permiso de ejecución (x) cuando se encuentra asignado a un directorio?**

- [ ] A) Permite modificar el nombre de los inodos asociados a los archivos contenidos en el directorio sin contar con privilegios de root.
- [ ] B) Habilita al usuario para leer y listar los nombres de los archivos presentes en el directorio utilizando la orden ls de consola.
- [x] C) Permite al usuario atravesar o acceder al directorio (mediante cd) y alcanzar los inodos de los archivos almacenados en su interior. ✅
- [ ] D) Otorga automáticamente facultades para formatear la partición física sobre la cual fue montado el árbol de directorios del sistema.

> **💡 Explicación:** En Linux, sobre directorios: 'r' permite leer/listar el contenido; 'w' permite crear, renombrar o eliminar archivos dentro del directorio; y 'x' (búsqueda/ejecución) permite atravesar o posicionarse en el directorio mediante 'cd' y acceder a los atributos de los archivos que contiene (Diapositivas Unidad 4 - Slide 52).

---

### Pregunta 10 (30 segundos)
**En GNU/Linux, ¿qué problema de seguridad resuelve el bit especial SETUID (SUID) y cómo opera sobre las credenciales del proceso?**

- [x] A) Permite que un usuario normal ejecute temporalmente un comando con el UID del propietario del programa (ej. root) para tareas privilegiadas controladas. ✅
- [ ] B) Convierte al archivo ejecutable en un script protegido contra ingeniería inversa impidiendo que otros usuarios lean su código fuente en disco.
- [ ] C) Modifica de forma permanente el UID real del usuario en el archivo /etc/passwd cada vez que se invoca una llamada al sistema chmod().
- [ ] D) Evita que múltiples usuarios inicien sesión simultáneamente en la misma terminal de texto obligando al uso de contraseñas de un solo uso.

> **💡 Explicación:** Algunos comandos cotidianos necesitan realizar tareas privilegiadas (por ejemplo, 'passwd' debe modificar '/etc/shadow'). Con el bit SETUID activo en el ejecutable, el proceso adopta temporalmente como UID Efectivo el UID del propietario del archivo (root), permitiendo al usuario común ejecutar esa tarea crítica de manera estrictamente controlada (Diapositivas Unidad 4 - Slide 53).

---

## 🏛️ Bloque de Importación Formato Aiken (Moodle / Blackboard / Canvas)

```text
En la teoria clasica de sistemas operativos, ¿cual es la distincion conceptual precisa entre los terminos Proteccion y Seguridad?
A. La proteccion se enfoca en resguardar el hardware fisico ante desastres ambientales mientras que la seguridad administra la asignacion de memoria swap en el kernel.
B. Ambos terminos son sinonimos tecnicos intercambiables que describen el empleo de algoritmos criptograficos asimetricos en la capa de transporte de redes locales.
C. La proteccion es un problema interno que controla el acceso a datos y programas; la seguridad abarca ademas el entorno externo y el uso previsto de los recursos.
D. La seguridad es un mecanismo interno que supervisa los descriptores de archivos abiertos y la proteccion es una politica externa orientada a evitar filtraciones fisicas.
ANSWER: C

En el analisis de amenazas a la comunicacion entre una fuente y un destino remoto, ¿que categoria de ataque vulnera directamente la Confidencialidad de la informacion?
A. Intercepcion, cuando una entidad no autorizada logra acceder a los datos o escuchar la transmision sin alterar necesariamente el flujo.
B. Interrupcion, cuando se destruye un canal fisico de comunicacion o se eliminan registros en las unidades de almacenamiento secundario.
C. Fabricacion, cuando un atacante inserta mensajes espurios o genera transacciones falsas haciendose pasar por una entidad de confianza del sistema.
D. Modificacion, cuando un intruso intercepta el paquete en transito y altera su contenido antes de que arribe al nodo receptor final de la red.
ANSWER: A

De acuerdo con la clasificacion de intrusos vista en la teoria, ¿como se caracterizan los intrusos pasivos frente a los intrusos activos?
A. Los intrusos pasivos operan mediante la inyeccion de ransomware en servidores y los activos emplean scripts de automatizacion en segundo plano.
B. Los intrusos activos pertenecen exclusivamente a la categoria de malware no convencional y los pasivos son usuarios sin privilegios de red.
C. Los intrusos pasivos modifican subrepticiamente los registros de base de datos y los activos se limitan a recopilar metadatos de trafico web.
D. Los intrusos pasivos solo buscan leer datos no autorizados sin alterarlos; los intrusos activos intentan realizar modificaciones no autorizadas en el sistema.
ANSWER: D

En la caracterizacion tecnica del malware clasico, ¿que propiedades definen al modelo DAS representativo de los virus informaticos?
A. Dinamico, Autenticado y Sincronico, describiendo su capacidad para evadir cortafuegos mediante tuneles encapsulados de red.
B. Dañino, Autorreplicante y Subrepticio, contemplando su capacidad destructiva, su propagacion y su ejecucion oculta al usuario.
C. Distribuido, Asimetrico y Segmentado, indicando su ejecucion concurrente a traves de multiples hilos de procesamiento en el kernel.
D. Descentralizado, Autonomo y Silencioso, reflejando su diseño para minar criptoactivos utilizando la memoria de la placa de video.
ANSWER: B

En los esquemas de autenticacion de usuarios del sistema operativo, ¿a cual de los tres principios generales pertenece el uso de tarjetas con franja magnetica o chip inteligente?
A. Algo que CONOCE el usuario, dado que la tarjeta contiene una clave alfanumerica fija configurada por el administrador en su memoria de solo lectura.
B. Algo que ES el usuario, ya que el chip se enlaza de forma univoca con el patron biometrico del iris o la geometria vascular de la mano del operador.
C. Algo que TIENE el usuario, constituyendo un elemento fisico o dispositivo de posesion requerido para validar la identidad ante el sistema.
D. Algo que HACE el usuario, evaluando la cadencia de tipeo y la velocidad motriz con la que se inserta la tarjeta plastica en la ranura lectora.
ANSWER: C

En criptografia asimetrica, ¿en que principio matematico radica la seguridad del algoritmo y la proteccion de la clave privada?
A. En la extrema dificultad computacional para revertir funciones matematicas de un solo sentido (como factorizar el producto de dos primos grandes).
B. En mantener el algoritmo de cifrado en estricto secreto comercial para que los intrusos desconozcan las transformaciones de bits aplicadas.
C. En utilizar exactamente la misma clave secreta de 56 bits en ambos extremos acordada previamente mediante canales telefonicos seguros.
D. En fragmentar los mensajes claros en bloques de longitud variable que se transmiten exclusivamente a traves de circuitos locales de fibra oscura.
ANSWER: A

Para el algoritmo RSA, si se eligen los numeros primos p = 7 y q = 13, ¿cuales son los valores del modulo N y de la funcion de Euler phi(N)?
A. El modulo es N = 20 y el valor de la funcion de Euler es phi(N) = 18.
B. El modulo es N = 84 y el valor de la funcion de Euler es phi(N) = 78.
C. El modulo es N = 91 y el valor de la funcion de Euler es phi(N) = 84.
D. El modulo es N = 91 y el valor de la funcion de Euler es phi(N) = 72.
ANSWER: D

¿Cual de las siguientes afirmaciones describe con precision una limitacion fundamental de los cortafuegos (firewalls) explicada en la catedra?
A. No pueden ejecutarse bajo ningun concepto como modulos de software dentro de sistemas operativos modernos tipo Linux o BSD.
B. No eliminan el malware que intenta ingresar al sistema ni protegen contra ataques cuyo trafico no atraviese directamente el dispositivo.
C. Son incapaces de implementar politicas restrictivas de denegacion por defecto sobre el trafico entrante en redes de area local.
D. Requieren obligatoriamente la instalacion de un servidor de nombres DNS dedicado para filtrar paquetes a nivel de capa de enlace.
ANSWER: B

En el sistema de archivos de GNU/Linux, ¿que funcion cumple el permiso de ejecucion (x) cuando se encuentra asignado a un directorio?
A. Permite modificar el nombre de los inodos asociados a los archivos contenidos en el directorio sin contar con privilegios de root.
B. Habilita al usuario para leer y listar los nombres de los archivos presentes en el directorio utilizando la orden ls de consola.
C. Permite al usuario atravesar o acceder al directorio (mediante cd) y alcanzar los inodos de los archivos almacenados en su interior.
D. Otorga automaticamente facultades para formatear la particion fisica sobre la cual fue montado el arbol de directorios del sistema.
ANSWER: C

En GNU/Linux, ¿que problema de seguridad resuelve el bit especial SETUID (SUID) y como opera sobre las credenciales del proceso?
A. Permite que un usuario normal ejecute temporalmente un comando con el UID del propietario del programa (ej. root) para tareas privilegiadas controladas.
B. Convierte al archivo ejecutable en un script protegido contra ingenieria inversa impidiendo que otros usuarios lean su codigo fuente en disco.
C. Modifica de forma permanente el UID real del usuario en el archivo /etc/passwd cada vez que se invoca una llamada al sistema chmod().
D. Evita que multiples usuarios inicien sesion simultaneamente en la misma terminal de texto obligando al uso de contraseñas de un solo uso.
ANSWER: A
```
