# Trabajo Práctico N° 4: Seguridad y Protección en Sistemas Operativos

> **Materia:** Sistemas Operativos II  
> **Tema:** Seguridad y Protección  
> **Modalidad:** Grupal / Individual  
>
> ### Introducción Teórica
> *La **protección** en un sistema operativo es estrictamente un problema **interno** y se refiere al hecho de controlar el acceso a los programas y datos almacenados. La **seguridad** no solo requiere un sistema de protección apropiado, sino también considerar el entorno **externo** en el que opera el sistema.*  
> *La información almacenada (código y datos) debe protegerse contra accesos no autorizados, destrucción o alteración malintencionada y la introducción accidental de inconsistencias.*

---

## Cuestionario Teórico

1. **Defina con sus palabras** los términos **Protección** y **Seguridad** en el contexto de los Sistemas Operativos.

2. **Responda Verdadero (V) o Falso (F)** y justifique brevemente cada respuesta:
   - **1)** [ ] La protección de memoria evita que un proceso acceda a áreas de memoria asignadas a otros procesos.
   - **2)** [ ] La autenticación y la autorización son procesos equivalentes dentro de la seguridad de un sistema operativo.
   - **3)** [ ] El kernel del sistema operativo se ejecuta en modo usuario para garantizar mayor seguridad.
   - **4)** [ ] El principio de mínimo privilegio reduce la superficie de ataque de un sistema informático.
   - **5)** [ ] La escalada de privilegios es un problema que afecta principalmente al hardware del sistema.
   - **6)** [ ] El sistema operativo es responsable de controlar el acceso de los usuarios a los recursos del sistema.
   - **7)** [ ] La autenticación y la autorización son el mismo proceso dentro de la seguridad del sistema operativo.
   - **8)** [ ] Un sistema operativo seguro elimina completamente la posibilidad de ataques externos.
   - **9)** [ ] El principio de mínimo privilegio consiste en otorgar a los usuarios solo los permisos estrictamente necesarios.
   - **10)** [ ] El antivirus forma parte obligatoria del kernel del sistema operativo.
   - **11)** [ ] Un firewall personal puede formar parte de los mecanismos de protección del sistema operativo.
   - **12)** [ ] La seguridad física no tiene relación con la seguridad del sistema operativo.
   - **13)** [ ] El aislamiento de procesos evita que un programa acceda directamente a la memoria de otro.
   - **14)** [ ] Un usuario con privilegios de administrador puede representar un riesgo crítico si su cuenta es comprometida.
   - **15)** [ ] Los sistemas operativos no intervienen en la protección de la información, solo gestionan hardware.

3. **Explique cómo se realiza la autenticación de usuarios** en Windows y en Linux. Mencione el componente principal involucrado en cada caso (por ejemplo, LSASS/SAM/Active Directory en Windows vs. PAM/shadow en Linux).

4. **Compare el control de acceso a archivos** en Windows (basado en listas ACL discretas e integradas) y en Linux (permisos estándar POSIX de usuario/grupo/otros y ACLs extendidas) utilizando un ejemplo concreto.

5. **Explique qué rol cumple la criptografía** en un sistema operativo y qué dimensiones de la seguridad fortalece (confidencialidad, integridad, autenticidad, no repudio).

---

## Ejercicios Prácticos

### Parte 1: Aspectos de Seguridad, Amenazas y Vulnerabilidades

1. **Relacione cada situación** con el pilar de la seguridad de la información afectado (**Confidencialidad**, **Integridad**, **Disponibilidad** o **No Repudio**):

   | Situación | Objetivo / Pilar Afectado |
   | :--- | :--- |
   | Un correo electrónico es interceptado y leído por una persona que no es el destinatario legítimo. | |
   | Al acercar un imán a un disco magnético, se corrompen y dañan parte de los datos almacenados. | |
   | Se compra un artículo por Internet y el comprador niega haber realizado la transacción. | |
   | Envío de un mensaje de mensajería (ej. WhatsApp) desde mi teléfono suplantando mi identidad. | |
   | Confirmación de entrega y lectura (doble tilde azul) en un sistema de mensajería. | |
   | Un corte de energía en el datacenter deja inoperativo el servidor durante toda la noche. | |

2. **Identifique para cada caso si se trata de una Amenaza o una Vulnerabilidad** y justifique su respuesta:
   - **a)** Un vaso con café al lado del equipo informático.
   - **b)** Escribir la contraseña en un papel adhesivo pegado al monitor.
   - **c)** Un troyano/malware oculto en una imagen descargada de internet.
   - **d)** No aplicar los parches de seguridad ni actualizar el Sistema Operativo.
   - **e)** Dejar la sesión de usuario abierta en un equipo de acceso compartido.

3. **Para cada una de las siguientes vulnerabilidades**, proporcione un ejemplo concreto de una posible amenaza que podría explotarla:
   - **a)** Software de servidor mal configurado.
   - **b)** Sistema operativo desactualizado con vulnerabilidades conocidas (CVEs).
   - **c)** Ausencia de copias de seguridad o backups incompletos y no probados.
   - **d)** Cuentas de usuario con privilegios excesivos o contraseñas por defecto.

---

### Parte 2: Criptografía y Algoritmo RSA

1. **Explique el concepto de clave pública y clave privada:**
   - ¿Cómo se implementa el esquema asimétrico con RSA?
   - ¿Cómo se seleccionan y calculan sus parámetros fundamentales ($p, q, n, \phi(n), e, d$)?

2. **Cifrado RSA:**  
   Dados los parámetros:
   - $p = 5$
   - $q = 7$
   - Clave pública $K_p = e = 17$

   > **Consigna:** Cifre los siguientes mensajes claros: $M \in \{33, 18, 29, 12\}$.

3. **Descifrado y asignación de máquinas en RSA:**  
   Se tienen los siguientes mensajes cifrados: $C \in \{34, 79, 25, 50\}$, y las siguientes claves públicas:
   - **Máquina 1:** $N = 55$, $K_p = 27$
   - **Máquina 2:** $N = 143$, $K_p = 89$
   - **Máquina 3:** $N = 289$, $K_p = 87$

   > **Consigna:**  
   > Indique para cada mensaje cifrado la máquina desde donde se envió, teniendo en cuenta las claves privadas $K_s \in \{29, 7, 3\}$ y los mensajes descifrados $M \in \{40, 241, 66, 34\}$.  
   > Obtenga para cada máquina los factores primos $p$ y $q$.

4. **Validación de Claves Públicas en RSA:**  
   Para un sistema de cifra RSA con $p = 97$ y $q = 31$:
   - Calcule $\phi(n) = (p - 1)(q - 1)$.
   - Se proponen las siguientes claves públicas candidatas:
     - **a)** $24$
     - **b)** $33$
     - **c)** $45$
     - **d)** $49$

   > **Pregunta:** ¿Cuáles de ellas son claves públicas válidas ($e$ coprimo con $\phi(n)$ y $1 < e < \phi(n)$) y cuáles no? Justifique matemáticamente su respuesta.

---

### Parte 3: Seguridad en GNU/Linux y Windows

5. **Dado el siguiente listado del archivo `/etc/passwd` en Linux:**

   ![Listado de /etc/passwd][image1]

   - **1)** ¿Qué información contiene este archivo y qué función cumple?
   - **2)** Identifique y describa cada uno de los 7 campos delimitados por dos puntos (`:`) para una línea.
   - **3)** ¿Quién es el superusuario o `root` y cómo se lo identifica inequívocamente a nivel de UID/GID?
   - **4)** ¿En qué otro archivo del sistema se almacenan los hashes de las contraseñas cifradas y por qué motivo se separaron de `/etc/passwd`?

6. **Un usuario ejecuta una aplicación maliciosa desde su cuenta sin privilegios de administrador:**  
   Explique qué ocurre en Windows y en Linux desde el punto de vista del aislamiento de procesos, permisos sobre el sistema de archivos y posible impacto en el resto del sistema.

7. **Explique cómo Windows y Linux permiten auditar acciones y eventos de seguridad** (ej. Visor de Eventos/Event Log vs. `/var/log/auth.log`, `syslog`, `auditd`).

8. **Justifique las razones técnicas y de diseño** por las cuales Linux predomina en entornos de servidores y Windows en estaciones de trabajo y entornos corporativos.

---

### Parte 4: Caso de Estudio

#### Situación
La *Dirección Provincial de Administración* cuenta con un servidor Linux centralizado que almacena información sensible:
- Legajos del personal
- Información salarial y bancaria
- Reportes contables internos

El servidor es accedido por distintos usuarios desde la red interna:
1. **Administradores del sistema**
2. **Empleados administrativos**
3. **Usuarios invitados** (consultas limitadas)

---

#### Problemas Detectados durante la Auditoría
- Un empleado administrativo accedió indebidamente a carpetas salariales que no correspondían a su área.
- Un proceso no controlado ejecutado por un usuario consumió el 100% de la memoria RAM, provocando una denegación de servicio (DoS) en el servidor.
- Múltiples usuarios utilizaban contraseñas débiles y predecibles.
- No existían registros ni trazabilidad de auditoría sobre quién leía o modificaba los archivos confidenciales.

---

#### Consignas a Resolver
- **a)** Identifique qué mecanismos de seguridad del sistema operativo fallaron o no fueron implementados.
- **b)** Explique qué medidas de protección técnicas debería configurar el administrador en el SO para mitigar cada problema (permisos POSIX/ACLs, límites con `cgroups`/`ulimit`, políticas PAM en `/etc/pam.d/common-password`, etc.).
- **c)** Indique qué principios de seguridad informática fueron vulnerados (mínimo privilegio, separación de funciones, auditoría, defensa en profundidad).
- **d)** Proponga una **solución integral** de configuración que contemple gestión de usuarios y grupos, control de acceso a archivos, cuotas/límites de recursos y políticas de auditoría.

---

[image1]: <data:image/png;base64,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>