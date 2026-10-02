**TRABAJO PRÁCTICO Nº 4**  
**TEMA: Sistemas Distribuidos**  
**INTRODUCCIÓN**  
	*Con el desarrollo de los poderosos microprocesadores y la inversión de las redes de área local de alta velocidad (LAN) hoy en día es fácil reunir sistemas de cómputos compuestos por un gran número de CPU conectados mediante una red de alta complejidad. Estos reciben el nombre se SISTEMAS DISTRIBUIDOS en contraste con los sistemas centralizados anteriores que constan de un CPU, su memoria, sus periféricos y algunas terminales.*  
**Objetivos**: 

* Incorporar los conceptos fundamentales de los Sistemas Operativos Distribuidos y las principales diferencias con los sistemas centralizados y Sistemas Operativos de Red   
* Comprender las características propias, estructura y diseño de los SOD  
* Repasar conceptos de redes de computadoras y aplicarlos a los SOD   
* Investigar sobre las diferentes arquitecturas que utilizan los sistemas distribuidos

**Presentación:**  En fecha a consignar, se desarrollará en el aula virtual de la catedra una actividad con algunas de las preguntas del presente trabajo; las cuales deberán ser desarrolladas en forma correcta para aceptar el Trabajo Practico como Entregado

**CONSIGNAS**:

1) ¿Qué es un sistema Distribuido? 

Un conjunto de computadoras independientes (nodos) que se comunican y trabajan juntas a través de una red para cumplir un objetivo común, dando al usuario la impresión de ser un único sistema. [\[atlassian.com\]](https://www.atlassian.com/es/microservices/microservices-architecture/distributed-architecture)

**🧠 Explicado más simple**  
👉 En vez de una sola computadora:

* hay muchas computadoras  
* colaboran entre sí  
* comparten datos y recursos

👉 Pero para el usuario: 💻 **parece un solo sistema**  
**⚙️ Características clave**

* 🖥️ Múltiples nodos  
* 🌐 Conectados por red  
* 🔄 Comunicación mediante mensajes  
* 🤝 Trabajo conjunto  
* 🧩 Funcionan como un sistema único [\[informatec...igital.com\]](https://informatecdigital.com/sistemas-distribuidos-que-son-como-funcionan-y-para-que-se-usan/)

**🧩 Ejemplo (clave para tus alumnos)**  
👉 Cuando usás:

* Google  
* Netflix  
* WhatsApp

2) Mencione dos ventajas y dos desventajas de los sistemas distribuidos con respecto a los sistemas centralizados. 

**1\. Mayor disponibilidad y tolerancia a fallos**

* **Si un nodo falla, el sistema puede seguir funcionando con los demás**  
  **👉 Los sistemas distribuidos reducen el impacto de fallos al no depender de un único punto [\[ladiferencia.net\]](https://www.ladiferencia.net/diferencias-entre-sistema-centralizado-y-sistema-distribuido/)**

**2\. Mejor escalabilidad y rendimiento**

* **Se puede aumentar la capacidad agregando más nodos**  
* **Las tareas se distribuyen entre varias máquinas**

**👉 Permiten escalar horizontalmente y manejar más usuarios y carga [\[ecos.am\]](https://ecos.am/es/blog/sistemas-centralizados-descentralizados-y-distribuidos-diferencias-clave-y-aplicaciones)**

**✅ Desventajas de los sistemas distribuidos**  
**1\. Mayor complejidad de diseño y mantenimiento**

* **Requieren coordinar múltiples nodos**  
* **Es más difícil implementar y administrar**

**👉 La comunicación y coordinación entre nodos aumenta la complejidad [\[ladiferencia.net\]](https://www.ladiferencia.net/diferencias-entre-sistema-centralizado-y-sistema-distribuido/)**

**2\. Problemas de consistencia de datos**

* **Es difícil mantener todas las copias sincronizadas**  
* **Pueden existir datos inconsistentes temporalmente**

**👉 La consistencia es uno de los principales desafíos en sistemas distribuido**

3) En un sistema distribuido basado en cliente-servidor, un cliente realiza una solicitud a un servidor para consultar el saldo de una cuenta bancaria. Responda:  
   1) ¿Cómo se realiza la comunicación entre el cliente y el servidor?  
   2) Indique las etapas del intercambio de mensajes entre cliente y servidor.  
   3) Determine si la comunicación es síncrona o asíncrona en el siguiente caso: El cliente envía la solicitud y espera la respuesta antes de continuar.

**✅ a) ¿Cómo se realiza la comunicación?**  
La comunicación se realiza mediante **paso de mensajes**.

* El cliente envía un mensaje al servidor con la solicitud (consulta de saldo)

* El servidor procesa el mensaje

* Luego envía un mensaje de respuesta al cliente

👉 En sistemas distribuidos, los procesos no comparten memoria, sino que intercambian información a través de mensajes en la red [\[geeksforgeeks.org\]](https://www.geeksforgeeks.org/distributed-systems/message-passing-in-distributed-system/)

**✅ b) Etapas del intercambio de mensajes**  
El proceso sigue el modelo **request–response**:

1. 📤 **Envío (Request)**

   * Cliente → servidor

   * Ej: “Consultar saldo cuenta 123”

2. ⚙️ **Procesamiento**

   * El servidor recibe y procesa el mensaje

   * Accede a los datos

3. 📥 **Respuesta (Response)**

   * Servidor → cliente

   * Ej: “Saldo \= \$1000”

👉 Este patrón es típico de comunicación cliente-servidor en sistemas distribuidos [\[bing.com\]](https://bing.com/search?q=ejemplo+ejercicio+comunicacion+sistemas+distribuidos+cliente+servidor+mensaje)

**✅ c) Tipo de comunicación**  
✅ **Comunicación síncrona**  
✔️ Justificación:

* El cliente **espera la respuesta antes de continuar**

* Esto implica bloqueo hasta recibir el mensaje

👉 En comunicación síncrona, el emisor espera que el receptor procese el mensaje o envíe confirmación [\[monografias.com\]](https://www.monografias.com/trabajos106/comunicacion-procesos-sistemas-distribuidos/comunicacion-procesos-sistemas-distribuidos)

**✅ d) Posibles problemas**  
Se pueden presentar varios problemas:  
**🔸 1\. Latencia de red**

* Demoras en envío o recepción de mensajes

**🔸 2\. Pérdida de mensajes**

* El mensaje puede no llegar

**🔸 3\. Fallo del servidor**

* El cliente queda esperando indefinidamente

**🔸 4\. Inconsistencia**

* Datos desactualizados o respuestas incorrectas

👉 La comunicación en sistemas distribuidos enfrenta desafíos como latencia, pérdida de mensajes y fallos de nodos

4) Enumere y explique al menos 5 problemas que pueden ocurrir durante una migración de datos en un sistema distribuido y explique brevemente cada uno.

**✅ 1\. Pérdida de datos**  
👉 Durante la transferencia, puede ocurrir:

* fallos de red  
* errores en la transmisión  
* interrupciones del sistema

➡️ Esto puede provocar que parte de la información **no llegue al destino**.

**✅ 2\. Inconsistencia de datos**  
👉 Puede suceder que:

* el nodo origen y el destino tengan **versiones diferentes**  
* haya datos actualizados en un lugar y no en otro

➡️ Esto afecta la coherencia del sistema, ya que las copias pueden no coincidir.  
📌 En sistemas distribuidos, mantener la consistencia es un desafío clave.

**✅ 3\. Problemas de concurrencia**  
👉 Mientras se migran los datos:

* otros usuarios pueden estar accediendo o modificando archivos

➡️ Puede generar:

* conflictos de escritura  
* datos parcialmente actualizados

**✅ 4\. Interrupción del servicio (downtime)**  
👉 Durante la migración:

* algunos datos pueden no estar disponibles temporalmente

➡️ Esto impacta en:

* usuarios  
* aplicaciones

📌 Especialmente crítico en sistemas que requieren alta disponibilidad.

**✅ 5\. Problemas de rendimiento**  
👉 La migración puede generar:

* 📡 alto tráfico de red  
* 🖥️ sobrecarga de servidores

➡️ Esto provoca:

* lentitud en el sistema  
* aumento de la latencia

**✅ 6\. Incompatibilidad o errores en los datos**  
👉 Si cambian los formatos o sistemas:

* los datos pueden no ser compatibles  
* pueden producirse errores de transformación

➡️ Esto afecta la integridad de la información transferida.

5) Un sistema distribuido está compuesto por varios nodos (N1, N2, N3). El nodo N1 está sobrecargado y se decide optimizar el sistema. Se plantean dos alternativas:  
   * Migrar cálculos hacia otros nodos  
   * Migrar procesos completos hacia otros nodos

   Responda:

1) Explique la diferencia entre migración de cálculos y migración de procesos.  
2) Indique una ventaja y una desventaja de cada tipo de migración.  
3) Proponga cuál alternativa es más conveniente en este caso y Justifique:  
1. N1 ejecuta tareas pesadas de procesamiento de datos  
2. Los datos se encuentran distribuidos entre N2 y N3

**✅ a) Diferencia entre migración de cálculos y migración de procesos**  
**🔸 Migración de cálculos**  
Consiste en **enviar la tarea o cálculo a otro nodo**, sin mover el proceso completo.

* Solo se envía la operación a ejecutar

* El nodo destino realiza el cálculo con sus propios recursos

👉 Ejemplo: enviar una consulta o un algoritmo para ejecutarlo en otro nodo

**🔸 Migración de procesos**  
Consiste en **trasladar todo el proceso en ejecución** (estado, memoria, variables) a otro nodo.

* Se mueve el proceso con su contexto completo

* Continúa ejecutándose en el nuevo nodo

**✅ Diferencia clave:**

| Migración de cálculos | Migración de procesos |
| :---- | :---- |
| Mueve la tarea | Mueve todo el proceso |
| Menos compleja | Más compleja |
| Menor consumo de red | Mayor consumo de red |

**✅ b) Ventajas y desventajas**

**🔹 Migración de cálculos**  
✅ Ventaja:

* Menor costo de transferencia (solo datos necesarios)

❌ Desventaja:

* Puede requerir enviar grandes volúmenes de datos si los datos están en otro nodo

**🔹 Migración de procesos**  
✅ Ventaja:

* Mantiene el estado del proceso (continuidad de ejecución)

❌ Desventaja:

* Alto costo (memoria, CPU, red)

* Mayor complejidad de implementación

**✅ c) Elección de la mejor alternativa**  
👉 **Situación:**

* N1 tiene alta carga

* Los datos están en N2 y N3

**✅ Mejor opción: Migración de cálculos**

**✔️ Justificación:**

* Es más eficiente **llevar el cálculo a donde están los datos**

* Evita transferir grandes volúmenes de información

* Reduce tráfico de red

* Mejora el rendimiento general

6) Un sistema distribuido está compuesto por tres nodos:  
* N1: tiene una impresora local  
* N2: tiene una base de datos  
* N3: tiene un servidor de archivos  
  Todos los nodos están conectados en red. Responda  
1) Indique cuáles de los siguientes accesos son locales y cuáles son globales:  
   1. Usuario en N1 imprime en la impresora de N1  
   2. Usuario en N1 accede a la base de datos de N2  
   3. Usuario en N3 abre un archivo almacenado en N3  
   4. Usuario en N2 accede a un archivo ubicado en N3  
2) Explique el concepto de acceso local y acceso global.  
3) ¿Qué implica la transparencia de acceso en un sistema distribuido?

**✅ a) Clasificación**

| Caso | Tipo de acceso |
| :---- | :---- |
| 1\. Impresión en N1 desde N1 | ✅ Local |
| 2\. Acceso de N1 a BD en N2 | ✅ Global |
| 3\. Archivo en N3 desde N3 | ✅ Local |
| 4\. N2 accede a archivo en N3 | ✅ Global |

✔️ Regla clave:

* **Local** → recurso en el mismo nodo

* **Global** → recurso en otro nodo a través de la red

**✅ b) Definición**  
**🔹 Acceso local**

* El recurso está en el mismo sistema

* No requiere comunicación de red

* Ej: abrir archivo en mi propia máquina

👉 Un recurso local es accesible solo dentro del sistema donde reside [\[ibm.com\]](https://www.ibm.com/docs/en/zvm/7.2.0?topic=wivr-what-are-local-global-resources)

**🔹 Acceso global**

* El recurso está en otro nodo

* Requiere comunicación por red

* Ej: acceder a base de datos en otro servidor

👉 Los sistemas distribuidos permiten compartir recursos entre nodos conectados en red [\[strapi.io\]](https://strapi.io/blog/what-is-a-distributed-system-types-uses)

**✅ c) Transparencia de acceso**  
👉 La transparencia de acceso significa que:

* El usuario accede a recursos **locales y remotos de la misma forma**

* No necesita saber dónde está el recurso

📌 Ejemplo:

* Abrir un archivo remoto igual que uno local

👉 El sistema oculta si el recurso está local o distribuido

7) Se plantean dos infraestructuras de cómputo:

🔹 **Sistema A**  
Conjunto de computadoras iguales  
Ubicadas en el mismo lugar físico  
Conectadas por una red de alta velocidad  
Ejecutan tareas de forma coordinada como si fueran una sola máquina  
**🔹 Sistema B**  
Computadoras ubicadas en diferentes ciudades  
Con diferentes sistemas operativos y hardware  
Conectadas mediante Internet  
Cada una aporta recursos de manera independiente

1) Identifique cuál sistema corresponde a un Cluster y cuál a un Grid.  
2) Mencione 3 diferencias claves entre ambos sistemas.  
3) Indique cuál sistema es más adecuado para un proyecto científico mundial donde participan varias universidades y justifique

**✅ a) Identificación**

* 🔹 **Sistema A → Cluster**

* 🔹 **Sistema B → Grid**

✔️ Justificación:

* Un cluster es un conjunto de máquinas cercanas que funcionan como una sola unidad

* Un grid conecta recursos distribuidos geográficamente

👉 Los clusters están localizados y funcionan como un único sistema, mientras que los grids integran recursos distribuidos en distintos lugares [\[ladiferencia.net\]](https://www.ladiferencia.net/diferencias-entre-cluster-y-grid-computing/)

**✅ b) Diferencias clave**

| Aspecto | Cluster | Grid |
| :---- | :---- | :---- |
| Ubicación | Misma ubicación | Distribuido geográficamente |
| Hardware | Homogéneo | Heterogéneo |
| Red | Alta velocidad local | Internet o red amplia |
| Trabajo | Misma tarea coordinada | Tareas distribuidas |
| Gestión | Centralizada | Más descentralizada |

✔️ Justificación:

* Cluster → máquinas iguales, cercanas, red rápida

* Grid → máquinas diferentes, distribuidas, más flexible [\[geeksforgeeks.org\]](https://www.geeksforgeeks.org/computer-networks/difference-between-grid-computing-and-cluster-computing/)

**✅ c) Mejor opción**  
👉 ✅ **Grid**  
✔️ Justificación:

* Permite integrar recursos de distintas organizaciones

* Funciona con equipos heterogéneos

* Escala a nivel global

👉 El grid está pensado para colaboración distribuida a gran escala [\[thisvsthat.io\]](https://thisvsthat.io/cluster-computing-vs-grid-computing)

8) Indique cuáles de las siguientes afirmaciones son correctas respecto al middleware y su función en los sistemas operativos distribuidos  
* El middleware actúa como intermediario entre aplicaciones distribuidas y la red.  
* El middleware elimina la necesidad de protocolos de comunicación.  
* El middleware proporciona transparencia en el acceso a recursos.  
* El middleware permite la comunicación entre componentes heterogéneos.  
* El middleware reemplaza completamente al sistema operativo.  
* El middleware facilita servicios como RPC, mensajería o acceso remoto.  
* El middleware solo funciona en un único nodo local.  
* El middleware ayuda a ocultar la complejidad de la distribución.  
9) Una empresa tiene un sistema de ventas distribuido con los siguientes componentes:  
   🖥️ Cliente web (usuarios compran online)  
   🧩 Servidor de aplicaciones  
   🗄️ Base de datos en otro servidor  
   Cuando el usuario realiza una compra se lleva a cabo el siguiente proceso:  
1. El cliente envía la solicitud  
2. El servidor procesa la compra  
3. Se consulta la base de datos  
4. Se devuelve la respuesta  
   Responda:  
1) Identifique dónde actúa el middleware en este sistema.

**✅ 🧾 Resolución**

**✅ a) ¿Dónde actúa el middleware?**  
👉 El middleware se ubica:

* Entre el **cliente web y el servidor**

* Entre el **servidor y la base de datos**

✔️ Es la capa intermedia que gestiona la comunicación  
👉 El middleware actúa como intermediario entre componentes distribuidos [\[studocu.com\]](https://www.studocu.com/es-mx/document/universidad-virtual-del-estado-de-guanajuato/computo-distribuido/comunicacion-en-sistemas-distribuidos/144708896)

**✅ b) Funciones del middleware**  
En este sistema cumple funciones clave:  
**🔹 1\. Comunicación**  
Permite que cliente, servidor y base de datos intercambien mensajes  
**🔹 2\. Transparencia**  
Oculta al usuario dónde están los recursos  
👉 El cliente no sabe si la BD está en otra máquina  
**🔹 3\. Gestión de solicitudes**

* Recibe peticiones

* Las dirige al servicio correcto

**🔹 4\. Interoperabilidad**  
Permite que sistemas diferentes (web, backend, BD) trabajen juntos  
👉 El middleware facilita comunicación y oculta la complejidad del sistema distribuido [\[studocu.com\]](https://www.studocu.com/es-mx/document/universidad-virtual-del-estado-de-guanajuato/computo-distribuido/comunicacion-en-sistemas-distribuidos/144708896)

2) Mencione al menos tres (3) funciones cumple el middleware en este caso.