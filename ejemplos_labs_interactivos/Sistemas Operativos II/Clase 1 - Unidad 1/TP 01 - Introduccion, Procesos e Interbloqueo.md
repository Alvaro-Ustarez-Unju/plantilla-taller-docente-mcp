# Trabajo Práctico N° 1: Introducción, Procesos e Interbloqueo

> **Materia:** Sistemas Operativos II  
> **Fecha de Presentación:** Martes 26/08/2025  
> **Modalidad:** Grupal  
> **Temas:**
> - **Introducción:** Objetivos, Interfaces, El Shell, Programas Utilitarios, Estructura del Kernel.
> - **Procesos:** Conceptos Fundamentales, Llamadas al sistema para administrar procesos, Implementación de procesos e hilos, Planificación, Arranque.
> - **Interbloqueo:** Caracterización, Detección y Recuperación, Prevención, Predicción.

---

## Sección 1: Introducción al SO GNU/Linux

1. **Enumere tres características** que considere importantes mencionar del SO GNU/Linux y realice una breve descripción de cada una.

2. **El núcleo del sistema GNU/Linux se denomina:**
   - [ ] a) Shell
   - [ ] b) BIOS
   - [ ] c) Kernel
   - [ ] d) File System
   - [ ] e) Ninguna de las anteriores

   > **Pregunta:** Explique con sus palabras qué es el núcleo de un SO y cómo es la estructura del mismo en GNU/Linux teniendo en cuenta lo estudiado en Sistemas Operativos I.

3. **Marque cuáles de los siguientes son shells de Linux:**
   - [ ] a) KSH
   - [ ] b) FISH
   - [ ] c) BASH
   - [ ] d) CASH
   - [ ] e) ZSH
   - [ ] f) TCSH
   - [ ] g) Z SHELL

   > **Pregunta:** Explique a qué hace referencia el *Shell* y cuál de ellos es el más utilizado.

4. **Verdadero o Falso:** Los módulos del Kernel se guardan en el directorio `/lib/modules/<versión>`.  
   - **Respuesta:** `V` ó `F`

5. **Verdadero o Falso:** Todas las funciones de un determinado módulo deben formar parte fija del kernel.  
   - **Respuesta:** `V` ó `F`

6. **¿Cuál de las siguientes opciones son distribuciones de Linux?:**
   - [ ] a) RedHat
   - [ ] b) Conectiva
   - [ ] c) Karatte
   - [ ] d) Ubuntu
   - [ ] e) AutoLink
   - [ ] f) Suse
   - [ ] g) Debian

   > **Pregunta:** Explique qué es una distribución y por qué existen para los SO GNU/Linux.

7. **Muestre qué distribución Linux tiene instalada:**
   ```bash
   lsb_release -a
   # ó
   cat /etc/os-release
   ```

8. **Muestre información sobre el S.O. instalado:**
   ```bash
   uname -a
   ```

9. **¿Cuál es la versión del kernel que utiliza su distribución?:**
   ```bash
   uname -v
   # ó
   uname -r
   ```

10. Abra una sesión de trabajo con un nombre de usuario que le asigne su administrador y ejecute el comando `who`.  
    > **Responda:** ¿Para qué se utiliza dicho comando?

11. **¿Qué función cumple el proceso `getty`?**
    - [ ] a) Inicializa la terminal
    - [ ] b) Inicializa los drivers
    - [ ] c) Determina el runlevel

12. **El Runlevel por defecto es:**
    - [ ] a) Monousuario
    - [ ] b) Multiusuario con red y X Window
    - [ ] c) Multiusuario sin red

13. **El proceso `shutdown` efectúa:**
    - [ ] a) Cierre de sesión
    - [ ] b) Termina los procesos y cierra archivos
    - [ ] c) Cierra archivos solamente

---

## Sección 2: Administración de Procesos en GNU/Linux

1. ¿Para qué se utiliza el **PID** de un proceso?
2. ¿Pueden existir dos PID iguales en un instante dado? ¿Por qué?
3. ¿Puede un usuario modificar la prioridad de un proceso perteneciente a otro usuario? ¿Por qué? ¿En qué casos podría realizarlo?

### Ejercicios Prácticos

> [!NOTE]
> Los ejercicios prácticos se realizarán en el servidor instalado por el grupo, por lo cual cada punto requerirá la **captura de pantalla** correspondiente.

1. **Iniciar sesión como usuario común:**
   ```bash
   login
   ```

2. **Ejecute el comando `ps`** y mencione la información que se muestra:
   ```bash
   ps
   ```

3. **Realizar un informe de TODOS los procesos activos en el sistema.** Analice su salida:
   ```bash
   ps -aux | more
   # ó
   ps aux | more
   ```

4. **Ejecute el comando `ping`:**
   - **a)** Detener el comando anterior y enviarlo a 2° plano:
     ```bash
     # Presionar Ctrl + Z (devuelve el número de trabajo, ej: [3] Stopped ping)
     bg 3
     ```
   - **b)** Volver a poner en primer plano el proceso de búsqueda anterior:
     ```bash
     fg 3
     ```
   - **c)** ¿Para qué se utiliza la combinación `Ctrl + Z` en la administración de procesos en Linux?

5. **Buscar los archivos** cuyo nombre comience con `sis` en todo el file system y redireccionar la salida al archivo `listasis`. Ejecutar en segundo plano:
   ```bash
   find / -name "sis*" > listasis &
   ```

6. **Verificar en qué estado se encuentra el proceso anterior.** ¿Está en ejecución? ¿Qué PID tiene asignado?
   ```bash
   jobs -l
   ```

7. **Ejecute el comando `pstree`** y describa lo que visualiza:
   ```bash
   pstree
   ```

8. **Ejecute los comandos `top` y `htop`**, describa la salida obtenida y la diferencia entre ambos:
   ```bash
   top
   htop
   ```

---

## Sección 3: Interbloqueos (Deadlocks)

1. ¿Cuál es la técnica que utiliza el SO GNU/Linux para tratar los interbloqueos?
2. En el caso de que el sistema deba finalizar procesos involucrados en situaciones de interbloqueo, detalle **dos aspectos** que podría tener en cuenta para ello.
3. Dados los siguientes dos programas que utilizan dos recursos compartidos, determine si en alguno de ellos (Programa 1 o Programa 2) existe una situación de bloqueos mutuos y justifique su respuesta:

   ![Esquema de Programas con Recursos Compartidos][image1]

4. **Supóngase que existen dos procesos, $P_1$ y $P_2$**, tal que ambos durante su ejecución necesitan utilizar una cinta ($C$) y una impresora ($I$), que son recursos de uso exclusivo:

   | Proceso $P_1$ | Proceso $P_2$ |
   | :--- | :--- |
   | `Solicita(C)` | `Solicita(I)` |
   | *Uso del recurso C* | *Uso del recurso I* |
   | `Solicita(I)` | `Solicita(C)` |
   | *Uso de ambos recursos* | *Uso de ambos recursos* |
   | `Libera(I)` | `Libera(C)` |
   | *Uso del recurso C* | *Uso del recurso I* |
   | `Libera(C)` | `Libera(I)` |

   - **1)** Muestre un posible orden de ejecución de los procesos que **produciría el interbloqueo**.
   - **2)** Muestre un posible orden de ejecución de los procesos que **no produciría el interbloqueo**.

5. **Considere un sistema de comunicación** que permita a múltiples procesos enviar o recibir mensajes con una semántica similar a una tubería o cola, tal que proporciona funciones para enviar y recibir mensajes (`Envía(cola, mensaje)` y `Recibe(cola, variable)`).  
   Suponga que se ejecutan en este sistema los siguientes tres procesos:

   | Proceso $P_1$ | Proceso $P_2$ | Proceso $P_3$ |
   | :--- | :--- | :--- |
   | `Envía(C1, A)` | `Recibe(C1, G)` | `Recibe(C1, J)` |
   | `Envía(C1, B)` | `Recibe(C1, H)` | `Recibe(C1, K)` |
   | `Recibe(C2, C)` | *Procesa mensajes* | *Procesa mensajes* |
   | `Envía(C1, D)` | `Envía(C2, I)` | `Envía(C2, L)` |
   | `Envía(C1, E)` | | |
   | `Recibe(C2, F)` | | |

   - **1)** Muestre un posible orden de ejecución de los procesos que produciría una **situación de bloqueo de los tres procesos**.
   - **2)** Muestre una posible secuencia de ejecución donde los procesos involucrados **no incurrirían en situaciones de bloqueos mutuos**.

---

## Consignas Generales

Para realizar los ejercicios prácticos se proponen las siguientes alternativas:

### Alternativa 1 (Recomendada)
Instalación de una instancia de servidor Linux en la nube **AWS (Amazon Web Services)**. Para ello debe contar con:
1. Una cuenta institucional (`@fi.unju.edu.ar`).
2. Una tarjeta de crédito (solicitada a los efectos del alta en AWS, sin costo durante las 750 horas de la capa gratuita / cuenta educativa).
3. Acceso por consola remota mediante SSH utilizando **PuTTY** (se recomienda instalar el paquete completo para utilizar **PuTTYgen** para generar la clave privada de acceso).

### Alternativa 2
Instalación de Linux (distribución **Debian**) en una computadora personal en arranque dual con Windows:
1. Descargar la imagen de instalación: [https://www.debian.org/CD/http-ftp/index.es.html](https://www.debian.org/CD/http-ftp/index.es.html)
2. Particionar el disco (crear una partición sin formato; es conveniente desfragmentar previamente).
3. Instalar el SO y configurar las particiones.

### Alternativa 3
Uso de una consola web gratuita de Linux: [https://www.webminal.org/](https://www.webminal.org/)

> [!IMPORTANT]
> - La cátedra recomienda utilizar la **Alternativa 1**, ya que proporciona aprendizaje sobre herramientas cloud profesionales.
> - Las consignas 7 a 10 de la Sección 1 y todos los ejercicios prácticos de la Sección 2 deben contener la **captura de pantalla** correspondiente a la ejecución de los comandos en el servidor.

---

[image1]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgUAAAFhCAIAAABvc06LAABvFElEQVR4Xuy9C3gURbr/P4/7nMf/8/uv5+z5+T97dn8H3XO8syJCKkPExACKwBIUhAAiFwU5cssAEQENgUhUomzguLDr7Rh31UXzi6jIri5eIAsIBNAguC4qAoFwCQkEMYkeUZn/W/V21/RUTfqSy6Qz836eL01NdXV1d7019e3uydQEagmCIAiitjayZrQD4U6CetwEQRDJBPlBBDjUmpqaHd5RT5ggCKITQn4QAQ71888/V4/eBS3biiAIom157bXX7hWoK9wR5Qf5+flYl0N1u3+v5phMnTo1KytLybSOubME1hz/oBw2QRCJx6ZNm5555hlI6CMVcECg5rYp3bp1U7PaDhy98QRtWLJkiVxacbo/EEP/22bb8WXzZlBVVYUJpaHlgAtOsHTp0pUrV1osoXxBt5Hduo0sGdkNXkBLhcNVsFxQUlIeDi8Q+VU80a2kvASWUNwsFrUERpovYWuZacORI0fmz59vNSfrMdeKlrW8gjaoffjt2oenZT0sm4IvH7aUIQjC70yYMKHWfP9+8MEH1lWffPKJktCxjuZitDGQL62rrCWtaWWtI1kW1HWxcPSDWm2URpzuD3b/fnft2+gHkMKcyAbRZGdngyXALYI0BkQOuHLwjfYDHOWrqmDsF34AuSVVYXgFfgAv0BLCVYYfGMWEMYws4eZhVsVf8iVst6BcZtoAfgCuIF9ajxlaAE4HGsR4bZ61bApYcosgCKJT8cc//lEulXFz165dSkJHH+Xl0jrKy7Q1Yd1Qz2xD0PNsMC9nVUtwvj+AC2J5f4DotSB4IwZrIWHNt4zABl9//bWZjPgBOgEu+TX+yBJ+67CgHBKw5LcII7msxTCFlJsv+bYu/ABuU/AWQeZYj7lWvT8wzhqaQt4f8HYhCKJTgW/k1157bd26dcqqFviBRL60rrKWtKatm8j8NgGv5uHs1BXucPKDtkAOuEuXLsXE4sWLZaZbxA1BuwKHevjwYfXoXdCyrQiC6BD+/ve/K1d7kkqBmps0xNUPfA4c6kcffeR1cIfysJWaSxAE0dkgP4igHjdBEEQyEVAHRYIgCCIpIT8gCIIgOOQHBEEQBIf8gCAIguCQHxAEQRCcKD9I6QgWLVpkPQaCIAiiQ0iW+4NDhw41EQSRNMC7/ksL6ohAxIL8gCCIBCRMfuAd8gOCIBKQsPCDu+66i/zAPeQHBEEkIGHz/gAtQR0RiFgkox98/vnn6mqTr776ytKjCILorITpeZF3ktEP4OX/N+dYTMGqHTt2WDoVQRCdkjD5QTMsX74cZ2TSZ+CI7Qc4HSnOV2rNtL6UeM33SlUJTqzdKsgPCCKpCLfOD3D4cjOI8Sk+48UsE3WFF+TsRrolxPYDwJjltJz/bgHOTgoJPuNpuBx/vUCkRUkzreeDn4Cr8DaFQb2EV1VVZSwXiJd83mwjYWwO+yoXP58Aex9ZwnPQD3jNI3k9snxz5OTk6NM5kR8QRFIRbq0fiGFngfEbMHwo6zYSh6YqPoPzyJELjJ8DwCmfcVAqKVmAZXAVf9GmnDp1aunSpbBUV3jB6gfKRKp2fjBSnBX/dRzz9EbigM5/GoGP1EZJkb8Axm4tXywXiCbjjSObiS9H8p9MCItfWzByhB9IwA9EDCJ+gLZUsgA3bBZPfvC3o2fJDwgi8Qi78wMYLvSJrMNi9C+pKi8X0/Mv4GOOGL4ic/iLq1LjF2IW4C3CgnJjtv9u3Al4DW3sBqYffP311+oKgf57BjHB4XHPnj2jRo3y4Afm79gswDPkKfxPXPLz5sCSzeeLpRi/Lb9+I5ciofqB+atqC6Qf8L1HauZhwPKeaM4PIH1pfg35AUEkGOFW+4EYZ8rF9Si/CBZ3DPyCnw9AI/HqFl9iuqocf81FmASm8Uq6zWnl86KwaQlw4sq82c36QYJh4wdA32V15AcEkUiE3flBpwM/P9i+fbu6wjv6cxTyg/Dh+u+buz9gBEF0TsKJ6Ad4Z9D6+4PmSHY/QA8gPyCIBCOciH7Q3pAfRClMfkAQCUGY/MA75AdRdwlh8gOCSAjC5AfeIT9QXYH8gCASgDD5gXeS1A9sID8giAQgTH6gUds8WID8QIX8gCASgDD5gYZqAhawAPmBCvkBQSQAYfIDDRz6s7Ky7hWQH7SpH/Rf0tRQr2aa2KxqJ3rd/fsW7LQFm/iHtw7WqllIv0X91CwiuQiTH2hIP5A2IF0BC5AfqLj3g52n6mEwHaVmG3gdZ5srD/nblg1TcwXKJvByeNCa4Yrm9tsJ6Du3sfrPmISzMFVj5jRjFSb6JkQiESY/0GitHxxvaABNfn2tuqKzEdMPcBJwRGa69wMYSia/tLvx0xfVFYJ4j7PBsS0wAxb/42w7vmyox5uApz48eurDJzCzsaEeI7K59lSkqEbMTYhEIkx+oNEGfjD4hZdg+deDVZbsCktaJVRWrWZFU2wMvrwYHFlZSJ1Doz1ozg8sRQxc+kGv2avFSJppHU9vm1eCl5yv5I+U+Y3mdei0Vz5p2l/KoodgmTYTQXndKvOn4Ypf5WL+qS82RG/CHnqlAlftW/805qzeX4cFQGeO7sRMSczj7Dvp15h57MOyqNKc0MFXQrnPljc1fAIv/rz7IJZ8bNLNsgTmNDWclC+tq8T/vJLDp+tXT82EF2fM05Q2pp+FPKSm0weNQhaaGvg5ikRkXwNXbDHye83ZXGTcV0EB2LUsgzkyHdnEBFtPP1RZIFYsIjU0NRwR/1vPN2iciKUS/Xxlw+55bbEshkDmC1s+x7W3mS3GMseb1R7FDBl3PHIEOt40M0CNdX+PWVI/PP0c5VnIHhIzQMdOG1XNuy1dZsafMPmBhvQDqyUgWMDZD35aVDy6dLXiBziSVhRnGd5QXQaLYpE0/KCi2DrQV4i1WVnFvJjFD2ANFIs5LrctzfnBQw89pMz46tIPauCtVf0GE2+k/OuNTEi/WjiemR4AiZc/Pd5Yw4fjzLGP8DeJkx/AhsvFIPvCh4fworXJ9ANIvDD7FkwMidq2j5EI3gKJwSIL3u1nRGbmmIXW3SH6cWIm7hoSZz7lx2khVLX+LRjrC+dOYr962Bz0+0HJ3L5BJurBY9u0v+bklmIW+xx5Jaf2b70tMzjjlb+d+eIvkBX81b24dvLzH+hnIQ8p1iX8wIbdxjBqZfUXtU0Nf8N0U8MXZkL1AyvWTYyc/XWVdafwUDccqTv1KX8qNSZ/lbWt+GlHxSKGH8jz1cMa63x5e5o11E/GHZg08UjVQN5Tb+6yFhuXycsdPF1/bP3DzDzyd1/7/W0iH+EXInAA0+BIg5B4J58fsrUk3GntWV0ImbOffNfqsqIKvonsb0oPkTmN5gGL8zoktuPnJbbrGMKu/WD//v1qlknMK99mr3gr+PjmZ3DoRzPIz89viR+A1FyzlarLQjH9ICtU5tIPoIZOen8g37EN8EatXQ+JXnPfkI+zGeMXbljMzBFvaSc/sKzqPW3qBMzhfpC+GPfCxI7q1vPrRyz81IfHti0baayaXtp4cDUT7/b9r8zCzIPRb8uYx9m/aD2O45zgdO2dHJLDxElzdGDc7U40neFuF31G/EFNrHOMVLLtdP28XsbaaVOnYBn9LGQlg8bcja0hgbOwXgIbiDFoXNB4pZ1FLKI3QaD1jr69CNPKiZSM7N1MLGL4Qaw7mEhY1fPNXNokrjCYaBPrgM60wxD/jzVGXkum9cglwg/2Gi/6LcLPS2zOkf+nnSP0EIwsx+wh1gDhAVur2v9Vfa4Z5fgTducHMAiMGjVKzUXEsMZHCTHQ4/gWFn6AlgADGmSGskKYrubXtqYliG35uJeVhYV5MVHCKCDWQvmYltNOWA1AAQs4+8HJpq+HrSqFuwR1nUE8T6flxPQDYNWqVcqPSLjzg96y3496diemYVx+eVKGLKG8YYDNJ5394HNxr708nw+RMn+aeEtvLuIX4FZwk6MN9Zbb8gx8dADvdryrYJofxDzODSdOzeZv56hMC6GmKj5Aq6umloohL9M6MCGxzjFSSd/ZsGH9O69ELvCbYp1Fk7h9sbaGZN6fP5cniDz2yvtQ+G5xv4JoZ6Gib4JA68nWsFZyUNxnNBOLWH5gnm/MsGrnGxTne1xxAsR6GOCmyzMjVmQtYD1yCRyw9U8S9JKRgV5c6bNY/Q16iDwdZlaiB8h6nHe/tGfnipHyZZwJu/MDe4zRzXLhD+O31Q8gIf2APzARaY7wAywW7QdGAawn+hK53VFNwAIWcPCDhKE5P3j66aetL8Pu/GDyS7vxnSDFxBtsueWCVb5hZA4UcPQDoGTNeqxzz8vzMR8GvuVbjuiXw7gJPheyZPKBycYPYh7nx2eiTsd6hIIQHjkzh4DoksPwcwUr1hrMdKQSYPDUh8wauJcoe5TDq9IaEmgQqx+IMictGUamkmMl5iaItfWUkz2zZWkzsYjlB5bz1cMqV4mXuHnvPfursRg+MbMUiOpIEMHMZRutD8GwgPXIJTC4Ww9YL2k9eOxO+jk210PkeclHfHIT5QjjTLgt/CDZSHY/kMhnR278oDH6z0xPN9Svnt4PbhSO/lmOWUF8Y1jfHlDMjR+YBGUN0/jt+9s1b+ebq8Yd3Bt5nAIXbo/2D5obTW/6ahez9YOYx/nCJzVP3Wpzbx/lB9GrMDMysB7c/5nI0c8xanyUyNPUz0LSd/qLyn4HrtjCH90IFr79+Zkv1lrXIjEPFWluE0TxA+sq1mws5JA6MKYfmATdnO/f6+ubvtxizbEexsmG+htY1CMdWaA5P7AccFAvqQdLP0foIU1nKmQxBR4gccDWql7+9MQL4zrsI+Uw+YF3yA9U3PiBMkaIR6ufibt+I3/1p8cxzT9onTYAM5s0PwgOf0ym5TCBL6054n3bS65644vaDYuND5b56yHFTQ3HcNUx4UzM1g9iHifsNaup4Thm5r6yW/l7G+vQtvqL2s9fmYNpuJY8tIanI4fdd25Tw35rjuUcI5XUNNQvH2LYD67dVntKP4tIJdm/sbaMYLJ0NW2VgfxiwbYtG99axj8/t6yKvQmijJV9LWlx0M3HgrFNR+p0P7DurrnzvT7/zabav2LODlh74m25CRNb/Xas8ZRP1iYTwx99p+kr/pF4c35gOWDjA/9mzjHdLKmdI+8hRo7sITKHB0gcMJzX318yPriyb+T2Jkx+4B3yAxUXfnC79XmrIIhdX/6lXdPpz8w3wzAjp6H+VfN50Vtf1JiZPIFVYOK5Dw/J8m8XjsZ8fN/uqTkpV1k3YZY/aZU5tn4Q8zgjf1XZZBkBTaIudWUx+bHB4Hn8b29QQZET6xwtlfSdEanktPEXkPpZWHOwNaxY/3woWjgcDzy5cYksoP+9aaxNDKJG1eBoWayyZAbmxYwF6sC6h3U/0MPKYp2vfNlkNqPEugp2gZlvfHJYqaE5P1i77HmbksHhi+Xax8YYrqOf40Pr/i5zsIdYT0EesMw5s/8tM68DCJMfeIf8QMWFH7SQ1aYfEG2CHKdikrtmr83zr06H/cnao3x+kCSEyQ+8Q36gQn7QWRj/7I7PX5qu5pq0ZgD1Ia05HfID8gOXkB+okB90IpJnPjvyA6+EyQ+8Q36g0n5+QBBE3AiTH3jHzg8qr3zos9G/R6nrOhs2ftDY2Lh8+fJVq1bhS/IDgkgAwuQHzYPDnRz0JA5+cPbEV6joNZHvJEe+n+2IOYMF/4Z3szOAtBc2fgBmYP2KMvkBQSQAYfKD5mmJHzSPMZ9d2PzGtkybAz0aBl9GrEP6AU6vF6+vaCPN+QEcxrsCmUN+QBAJQLgd/EDOPIFTD4XMq2Hjsjh6miPxf4UxQYWYvkJOamQsKyI1+AQ7P8D7A1iqK6LvD7CNqs3ZnSwFov0AWlP4QVaozD/3B6NGjWrR/EUEQfiacDv6AR/0zEcjfISz+oEkMm1ROMoPwnKSO6O8dYzsYFrmB52PmH6A9yirBDKT/IAgEoBwO/hBwmPnB4lETD+ICfkBQSQAYfID75AfGHiaz44gCJ8TJj/wDvmBitUP1HUEQXQeyA+8Qn6gQn5AEIkB+YFXyA9UyA8IIjEgP/AK+YEK+QFBJAbkB14hP1AhPyCIxID8wCvkByrkBwSRGJAfeMXBD44/svTE47/bm9ZHXdHZiI8fBGaWkzpcalSc0Gsg+VBq2FzQhn6gT6mgZQjMbyBL9C8f4zeWY29uYLeuXbHzg8btO7+rqztw+52wPHvkqHWVx9mH+HxHxRV8qyzRFj6Zv6ixsREOY9WqVTk5OTKT/KCzS42KE3oNJB9KDZsL2t4PxHAPYxkIMspCWahiPppVc/ECIsGJTNiTFeIbwiZgBii+uWXYhwES6uRzfWaFsH5epEzMdRFHnP0Abg4Oz7oP0pEV5jQd/JwsU3ZIJ+StU1Es2iiyBpwAZzdCY9D9tl2J6Qc1NTWY2LZtm8xsKz/49adnLWt+0Pt3Ium1kz46QUuzu8K6bXTUolYls579p8nROevfD0zRi7WrrHFxSTv5AU5eJJYhMSedGLVxJIQCckgUiagJ3DQ/kKOgHBFxlTEvnHa30d44+wEqyg+E+4XEJb9x8tFnHtMPeL74P64+YBLTD2Leo7ShH9xppo99H354vtq/4yw4mUu1zLZSQvnByUOY7vfC0fA3J/T64yY4tuMnv4bl6NnqqpZpyVVTpueomaD3A8pwr4r8IElomR90PmL6AZCTkwOusH//fpnTHn4QmP3R//ztb0b6vm19tb7enF57a7ee2QLh4ZEfxMS6rdUPsCojHfeoLdz9P1OFDfx48afh8Fm9QBvKzg9y3loyfDX5QZJg5weJRHN+oNMuflC47/imD0Wf5o8jRoo7BuAb+Pd9oyizGZJ1X//Ac7+vg5zvRIXH9+2buon/GBFeJ14lavtg3f6Hn/pg84nvKt49vKLkwz8d+Oaj17bJTU5/ey4cPqe8l8SuW+wHG997gddvFb92xuMXZy39AF92rMRBecC6reYH/Lw+eP3v4dhRgwJGaLAejK8SNbPk2U+2fzGv7ABUcOzTQxA1HOWbi9qBc/LANslKvChG1P7t9kf/TSxnZNy78PbVZf92z/33rO854ffgB0uy/jsgjGHDv8+D5Yu3vSFezoT0G72fAz/YGJj87mV81Sh+h2H4wZqfTOab/MPk93/yAO4CXr551XxYosdADZgPm/+bWcC6i5Sxv1FqaE7YyJ4gP/AK+YEBzPnsoos4Y+2+0g/6rfwbrPpns0+bndsYQMEBHp5ffsLM//GSL6Qf/NjcBLeFCj8o28JzzIcY4XNfGQmxiRxQlCORmS31g/L36r5XcuQu7tjwFRw/+kHM/cZfYY9Yt7X4wcbT34ePmi5u1hyJGiz/+bfVL/x6o9wpLvWoWQvoCfuoBYQJ1e82by69SI+a9IPfjXsbc96/6km+FGP3sEH3b+76OyPfGM2N2wLwg+nTN5irpkg/eD8wFTM3iZIXTnh8+Z3vRNeg+MF7ze0CavjPGVFHqyjsHfIDr5AfqLShH5jZ517+vx/IPi0Sm898aDxSmPfhN6e2f2TdVvqBtbbfvHUQyqAffPfp342S5pUsbsJ135bXt/MPya3bGmU0P4Bdm0foCsu2my0Xs5vh+MEPtDIdpqiDdoF1W+vnyZ99ehQzzQaPihoM9+vORK7osR6lNoyatUDMhE3UoBvUH6iKzuS3ku6xbiv9AC/VA9F+sCEweaSZv1HzA1mJyEQ/ePft/q9g5tj+910ws3z5JfdEF1P94Gd3LI3exbvvB4xNoIa3BrwqN9elnpgLyA+8Qn6g0oZ+EHleZOnTIhEZWWZt/7px98fWbRU/OBcOf3P6y0st9wfN+QFUsq3igGUv6q5bfH8QmLvr47U7LDlWP9gExw9+sOjBv45558ttL21Vt427zGi4xbqt8rwIpfsBRO2imeXrG5v1A2vUrAX0RLj5qEHOXXl/VTI9SI2agx/AFfpvsp5cYkrmB1z4wcgB8346s/x3/+c/o4upftA9+6HoXUT8AGp4r9//lZvrCnuH/MAr5AcqcfEDSHyHCXxe1GTm8w8Po/1AbvLR/9jfH2yM5GsjC2a22A/C4W+1nDAmrM+LrPkdqLBHrNva+kG5NWqw7LbqRMkS9XmR9WVARE3JiU40G7X5H36dOzfysgXSo2bvB0uvmLIma42Rr90f3DdlvblqpuV5UQ5m4vOia0Yt0Z4XzZAvxU5fa24X9LzID5AfqMTHD7RPJrdA8njD9/BSvz849+3/1H977s3djXhV3owf8MoPHjwJS35x2vC1db+4tsV+oKu5z5P/VPfD/NaNYq2XOCgPWLe19wMtauVh/qGx0U/wJeZbo4axkKuURNgSterte+ROz2GlBm3z51s2fvBs+mOYwA+N1/QvxZdYDPwA0hv/bQ4sU3iO+8+TJ7//0zlQAGqQnydbd0GfJ/sK8gOVtvKDFuuHw/v0TJJ7qVFxQq+hBWqrehJG0kvaSkrU3EB+4BXyA5UO8YPPfghj4vLfHvrNwlY8MiZ5Hzj0GtyqcN/6kvcxHT57Ul2b3EoMP8jKKrZOwYDgF4nLQtq3WbWSnOjvGMsvIVsz/YOdH9xzz+HCwuPjxlXl5R2Dpbq6UxHTD3AaJQlmdogfBCLdPcZXB0ieFImHO/Qa3Es+1dFXJbk6ix+MGjUq5jwFAjnlAh/FcWKF4orIPBM4yxD3DDEpAyhiEtWQFGljRiNjcyhfxqco4pMU4cRHINMeIsUQo4Y4YucHYAbz5x+FZVXVt4ofxGxBnKCi2J31mbNZ6NP/tQsx/QBZs2ZNuB2+f0DqKKlRcUKvgeRDqWFzgRs/sM5NoGEMzpZ55SoqxDW+da4hHM35jHXVZThvnbENjoTVUdPSifGuAlaJsV+UN0tai4n6K9Bp4omDH9TXfw9LSL/66unICvMOCCyuAoZ/vLiuLoMhHk4JMiAB+eaIb7SpmMauWLSXYYxQBs8ZfRVeCrNslyZozg+2bduGTkB+kDBSo+KEXgPJh1LD5gI3fuCAGJXC5vggl2LKOZ6WfsCHtTIYu6qNkUT6gUAOL1AGhk1uJMYEcNXFZcJImtlLnLHzA7gnsCqyQvhBdTWO9NUhbgAh0XIhfnrCDyzz2RnnxE0Dhv4KwwaxDPfLCp4pfIKXxAmx25zm/ACOaeLEiZjAnNb4QVNDPanDpUbFCb0Gkg+lhs0FbeAHcSDuk5jaYOcHSMxPDgxvDPFZWq1+AC+lH+D1vtUP+MW/uF/CewLDDwyqYVt+V9E+D5Ca8wO8W8QfQsAc8oPOLjUqTug1kHwoNWwu6Bx+4Cec/eCDDzwPiz4kph+IW5YImEl+0NmlRsUJvQaSD6WGzQXkB15x9oPEIKYfWCE/SBipUXFCr4HkQ6lhcwH5gVfID1TIDzq71Kg4oddA8qHUsLmA/MAr5Acq5AedXWpUnNBrIPlQathcQH7gFfIDFfKDzi41Kk7oNZB8KDVsLiA/8Ar5gQr5QWeXGhUn9BpIPpQaNheQH3iF/ECF/KCzS42KE3oNJB9KDZsL2tAP+BeRkwDyAxXyg84uNSpO6DWQfCg1bC5oez8Q3x3DaYuq8QtYOIVRiE9KgbMSKRt2Lhz8oLLmL2pW58TGD+RfmiLkB51dalSc0Gsg+VBq2FzQTn6Adwr8q7hl1ZjmK8UEFZ39LsLOD/I39wE/ONa476tv6yBtXQVjqM2J209pZ3HQ+Hlpc34AJ6JMcEh+0NmlRsUJvQaSD6WGzQXt5Acw8PNXYnZrTCeFH5z+hs9kB6h+gBNuVPOJWzGjQk5XJ2asM/2AD/d8xibxwpztDjfh0xiJlWgJRsn2I6Yf5OTkYIL8IJGkRsUJvQaSD6WGzQVt6AdJgp0fvPpZEcqNH4gZH8TMdHxuopCYubsC7FKO8uZsd3wTc2bXiB9gSTHjabsQ0w9wmoqamhpLQfKDTi81Kk7oNZB8KDVsLvjQgrqOiIWDH2BC9QPzeRH6Aaa5G4jp6tAPsvhMd3zqV/l0iM9uJ2aswxmtxTym0g/E5nzbePvB008/jc+LpCu0kx9UPjkRE4VlWxe+/bleoE1U+8lbemaLVbv71cHTfqPn+1xqVJzQa4iobismhi9+uX/+n9W1baTGmo/OaJmt0CEWHKJldnqpYXMB+YFXHPwABWbw8LbB6moTl4O4+aTIwOVWbUVMP3jooYfC5u/hSFrpB2Myg2/sPsTfk4zBy+m/6h1kQUjAS3jP79ux6f0tG+Hl3YN6T1/2alPDJ/lj+o3JX3Wm6v3gr6bLrn+wLPRc/tjSDw/tWbNs4uJVkJM7vA9Uu3pKJqShnqmr3sP6YQn5yua6XtqyLnPMQiwPyzeWzWKZ2bB3SC/PZLC7TMYaG+php7n8qOoHBVktbnt6Ix+qTn+h1+lbqVFxoily4icZ6w3tMHPBPbm/6n2qoX5wkG3eX7Nty9svbOJRKy2ajO28uSRv4csVTac/jx55jWiCjw66a3GTaGeodirjUVu+5Qib8ntsf2jtPTUnmxpqYHe4bUw/4FHOHAtHhdGBahnvS3WwimUuxd3tqjl5cOOzmcNn8UyjWr4t7E6vsFNLDZsLyA+8YucHiURMP7ACdwmYaJ0f1AYH8fuAdDZw25aNs9fsbWo40rT/ZezQmcv4mCLe+TU850wFjsigXnPfsHZ9GKAxMe/5t7f9ealRvqFe+kH/ovUipzZ/xYv65roe3VgFyw2Ls+Co3qiqqzHyI36AxYJiNHxhXDqkh7KBsGR9jVWdSGpUnGgyT7wwnUH7BGetXr2/7kxDHSyb+Ng9DIK47TSv+ai5i5NiyXrNh6XZmPUymulzn9u25bXD5qqIH/RfggUG3fUALMezm2H5zjE+gsf0A4yyPKr8t9GVI36AxR4enr6v5uTe5ydD+qlbe8Fyel++TDCpYXMB+YFXyA9UWucH/B2bzkbO6JVh9mPhB1Wrm6L8oP7LhvoTGx+Tb2nWa1pTwwHZ9eUAPf7ZHZg40VD/t78f3rliJNYwtQw3NHanbA7a+fYG60sc2vaX8avIJj42HRSJo7AcySJ+0Cg8Y9eT45v4Ic3ZumysUUOi3x/gia+e3g9rMP2A23Avix+88Ldj1nYeyfrAxXtjZNdGNIPjnsEEtPOZAx+tHBgUabg/MK4MQGzgfz2VzW8ODomX2Cve3fCRLNBkRlkeVTB7eWRzix+8+0Vt04m3v/zwd5Aewm5qPB4V+oSRGjYXkB94hfxARRZzLKmjd+KO0obFbfoE+cTbao6PpUbFCb2GjlJh+i16Zit0SsvpxFLD5gLyA68kox+4R63FCb0Tk+IvNSpO6DWQfCg1bC4gP/AK+YEdai1O6J2YFH+pUXFCr4HkQ6lhc0Ebfv9A+aZZyPYrt50X8gM71Fqc0DsxKf5So+KEXgPJh1LD5oI29wPxxalka+S72P6f38Zff48U5AfJIjUqTug1kHwoNWwuID/wivkH63ZeyA+SR2pUnNBrIPlQathcQH7gFfIDO9RanNA7MSn+UqPihF4DyYdSw+YC8gOvkB/YodbihN6JSfGXGhUn9BpIPpQaNheQH3iF/MAOtRYn9E5Mir/UqDih10DyodSwuYD8wCvkB3aotTihd2JS/KVGxQm9BpIPpYbNBeQHXjmbHzQ2/nfkjF7Z2dk5OTk5OTnJycnWfPIDe9RanNA7MSn+UqPihF4DyYdSw+YC8gOvOPjBL82fD8s/M4Y/fN+Pff+Tff/T9z/J/e+r2v7gYd9bHqXW4oTeiUnxlxoVJ/QaSD6UGjYXkB94xc4PDu3fD8v/2f2/v/vf3/3v7/537g/DsnzHjh3WfPIDe9RanNA7MSn+UqPihF4DyYdSw+YC8gOvOPjBT980w/Ifd//v7/73d//7u/+d+98x/7+w/OPu/33e9zzXyA/sUGtxQu/EpPhLjYoTeg0kH0oNmwvID7zi4AfHh/4GlsN+/7u/u9/d7+5397t73D0G48O/h+XxoT+w5pMf2KPW4oTeiUnxlxoVJ/QaSD6UGjYXkB94xcEP9u/fb36mefyWv9/97+5397v73f3u/u9b/h6WB/bvt+aTH9ij1uKE3olJ8ZcaFSf0Gkg+lBo2F5AfeMXBDzZt2gTLg/sPWf7f3e/ud/e7+9397v7vWf4ellu2bLHmkx/Yo9bihN6JSfGXGhUn9BpIPpQaNheQH3jFwQ+2fv/7sPzj7v/93f/+7n9/979z/zumf3hGfv/3v7fmkw+41+iE3olJ8ZcaFSf0Gkg+lBo2F5AfeMXOD/Zt2w7L5z7679z/7n53v7vf3e/u7zH9L6Y/99F/t+aTH9ij1uKE3olJ8ZcaFSf0Gkg+lBo2F5AfeMXODw7t3gPLZ7//3f/ufne/u9/d7+5/3/L3sDyy+4A1n/zAHrUWJ/ROTIq/1Kg4oddA8qHUsLmA/MArdn5w/OAhWB46eMTy/+5+d7+7393v7nf3f9fyV7A8dPCwNZ/8wB61Fif0TkyKv9SoOKHXQPKh1LC5gPzAKw5+gJ8fkB94hPzAHrUWJ/ROTIq/1Kg4oddA8qHUsLmA/MAr5Ad2qLU4oXdiUvylRsUJvQaSD6WGzQXkB14hP7BDrcUJvROT4i81Kk7oNZB8KDVsLiA/8Ar5gR1qLU7onZgUf6lRcUKvgeRDqWFzAfmBV8gP7FBrcULvxKT4S42KE3oNJB9KDZsLyA+8Qn5gh1qLE3onJsVfalSc0Gsg+VBq2FxAfuAV8gM71Fqc0DsxKf5So+KEXgPJh1LD5gLyA6+QH9ih1uKE3olJ8ZcaFSf0Gkg+lBo2F5AfeIX8wA61Fif0TkyKv9SoOKHXQPKh1LC5gPzAK+QHdqi1OKF3YlL8pUXF0fvf16NGxQm9BhKP9FfFUsPmAms/OHv2bK/4QWNjI57a1dW1dOnStLS0uLi4mJiYyMjI2NjY0tJSfJ2UlBQXF3fhwgX2+c/279+fkJCg5oP8wB61Fif0TkyKv9SoOHr/+3rUqDih10Dikf6qWGrYXGDtB2+//Xa/fv16xQ8KCgrwzJUrVyYmJvbt2zciIiIyMjIqKiorK6ujo+Pw4cORkZFRUVEXL168e/cu+/xnBw4cSElJUfNBfmCPWosTeidGNTU0Kqj1qDFyQq+B1CP9lbHUsLnA2g/27Nmj+EFP/GD//v3l5eUpKSn9+/evW7dOTEzMlStX8P/NmzevWrWqX79+Z86cuXPnjvz8Z/v37z9y5IiaD/IDe9RanNA7Mcraj4P1qDFyQq+B1CP9lbHUsLnA2g+WL1+u+EFv+EF5efmBAwcaNmwQHx9/7tw5/D9z5kx8fPz+/fvlc/mZ8fDgwYOqOci9e/fg105JqV/h/uA/bO0H4u15R2rU+B96r1b7/rfeq9W67n3q/7Uf31u8b9C/1zvh36tGjZETOo17r1b7/rfeq9W67n3q/7Uf31u8b9C/1zvh36tGjZETvveD47/Z/dMf3v/BHz79r/99859f/f7XvvL1r976p6995etf/dfXv/a/vvqdr/2Pv/mrfv36/dM//VNpaenx48fb2toOHDiwZ88eNR/kB/aotTihd2JUk/z41l8V/hWNGiMn9BpIPdJfGUsNmws8+EH1pStXrrz19ltvv/P2z3/+3j/96b0///nPf/azn//85+/94v0PP/zw1ltvvfXWW+/833eOHz+OZ8gP7FFrcul/AY/gQf7R7yVzAAAAAElFTkSuQmCC>