# Trabajo Práctico N° 5: Seguridad en GNU/Linux

> **Materia:** Sistemas Operativos II  
> **Fecha de Presentación:** Jueves 20/11/2025  
> **Modalidad:** Grupal (La práctica debe realizarse en la consola del servidor Linux en AWS)  
> **Temas:**
> - **Conceptos Fundamentales:** Protección vs. Seguridad, Dominios de Protección, Listas de Control de Acceso (ACLs).
> - **Mecanismos del Sistema:** Llamadas al sistema de seguridad, Autenticación y Autorización, Contraseñas y Criptografía.
> - **Amenazas y Defensas:** Amenazas en programas y red, Implementación de defensas, Cortafuegos y Permisos de Archivos en Linux.

---

## Cuestionario Teórico

1. **Defina con sus palabras** los términos **Protección** y **Seguridad**.
2. **¿Qué es un dominio de protección?** Explique de qué manera se implementa el control de acceso a los objetos que pertenecen a un dominio.
3. **¿Cómo puede violarse la seguridad en un sistema operativo?** Explique algunas formas de acceso malintencionado (ej. escalada de privilegios, puertas traseras, inyección de código).
4. **Explique métodos para validar y autenticar usuarios** en el sistema (contraseñas, certificados, tokens 2FA/MFA, biometría, PAM).
5. **¿Qué recomendaciones daría para la selección de contraseñas seguras?** ¿Cuáles son los errores más comunes que cometen los usuarios?
6. **¿Qué entiende por criptografía?** Cite las ventajas de cifrar los datos almacenados y mencione los algoritmos de hash y encriptación de claves que utiliza Linux (ej. SHA-512, yescrypt, bcrypt en `/etc/shadow`).
7. **¿Qué es una ACL (Access Control List)?** ¿Cómo se utilizan en Linux (`getfacl`/`setfacl`) y en qué sistemas operativos están soportadas?
8. **Mencione dos aspectos** por los que considera que el SO Linux ofrece ventajas de seguridad respecto a Windows en entornos de servidores.

---

## Práctica en Servidor GNU/Linux

> [!NOTE]
> Para cada punto práctico se debe incluir la **captura de pantalla** que visualice los comandos ejecutados y la salida obtenida en la terminal.

1. **El comando `login` verifica el *username* y la clave de acceso:**  
   ¿En qué archivos del sistema realiza esta verificación? (`/etc/passwd`, `/etc/shadow`, módulos PAM).

2. **¿Un usuario común puede cambiar su propia clave de acceso?** ¿Qué comando utiliza?
   ```bash
   passwd
   ```

3. **¿Qué usuario tiene permisos para cambiar la clave de otros usuarios?** ¿Con qué comando lo realiza?
   ```bash
   sudo passwd <nombre_usuario>
   ```

4. **¿Qué usuarios tienen autorización para modificar los permisos de un determinado archivo?** (El propietario y el superusuario `root`).

5. **¿Qué operaciones se pueden realizar sobre un directorio si éste tiene asignado el permiso de ejecución (`x`)?**  
   *(Permite atravesar/acceder al directorio mediante `cd`, listar sus i-nodos internos y acceder a los archivos que contiene).*

6. **Gestión de contraseñas de usuarios:**  
   - ¿Puede un usuario cambiar su propia contraseña?
   - ¿Puede cambiar la de todos los usuarios? ¿Por qué?

7. **Permisos de Archivos del Sistema:**  
   Visualice los permisos otorgados a los siguientes archivos críticos y explique su significado:
   ```bash
   ls -l /etc/passwd
   ls -l /etc/shadow
   ls -l /bin/login
   ls -l /bin/ls
   ```
   > - **`/etc/passwd`:** `___________________________________`
   > - **`/etc/shadow`:** `___________________________________`
   > - **`/bin/login`:** `___________________________________`
   > - **`/bin/ls`:** `___________________________________`

8. **Crear una copia de `/etc/shadow` y analizar permisos:**
   ```bash
   sudo cat /etc/shadow > copiaclave
   ls -l copiaclave
   ```
   > Analice los permisos asignados por defecto al archivo recién creado.

9. **Modificar permisos en modo simbólico (lectura para todos):**  
   Otorgar permisos de solo lectura al propietario (`u`), al grupo (`g`) y a otros (`o`):
   ```bash
   chmod ugo=r copiaclave
   # ó
   chmod a=r copiaclave

   # Verificar:
   ls -l copiaclave
   ```
   > *Permisos esperados:* `r--r--r--`

10. **Modificar permisos en modo simbólico (lectura/ejecución al dueño, lectura al grupo):**
    Haga una copia de `copiaclave` llamada `copiaclave2` y modifique sus permisos:
    ```bash
    cp copiaclave copiaclave2
    chmod u=rx,g=r,o= copiaclave2

    # Verificar:
    ls -l copiaclave2
    ```
    > *Permisos esperados:* `r-xr-----`

11. **Modificar permisos en modo numérico / octal:**  
    Otorgue los mismos derechos del punto anterior al archivo `copiaclave`, pero utilizando el valor octal (`540`):
    ```bash
    chmod 540 copiaclave

    # Verificar:
    ls -l copiaclave
    ```
    > *Permisos esperados:* `r-xr-----`

12. **Crear un subdirectorio llamado `prueba` y comprobar permisos por defecto:**
    ```bash
    mkdir prueba
    ls -ld prueba
    ```

13. **Modificar permisos del directorio `prueba`:**  
    Ajuste los permisos para que queden como `r--r-----` (`440`):
    ```bash
    chmod 440 prueba
    ls -ld prueba
    ```

14. **Visualizar permisos de utilitarios y configuración:**
    ```bash
    ls -l /etc/crontab
    ls -l /bin/cat
    ls -l /usr/bin/yes
    ```
    > - **`/etc/crontab`:** `___________________________________`
    > - **`/bin/cat`:** `___________________________________`
    > - **`/usr/bin/yes`:** `___________________________________`

15. **Crear archivo `comandos` con el contenido del directorio `/bin`:**
    ```bash
    ls /bin > comandos
    cat comandos | head -n 15
    ls -l comandos
    ```

16. **Modificar permisos de `comandos` en modo simbólico:**  
    Otorgar lectura y ejecución al propietario, y solo lectura al grupo y al resto:
    ```bash
    chmod u=rx,g=r,o=r comandos
    ls -l comandos
    ```
    > *Permisos esperados:* `r-xr--r--`

17. **Modificar permisos de `comandos` en modo numérico / octal (`755`):**  
    Otorgar todos los permisos (`rwx`) al dueño, y lectura/ejecución (`r-x`) al grupo y otros:
    ```bash
    chmod 755 comandos
    ls -l comandos
    ```
    > *Permisos esperados:* `rwxr-xr-x`