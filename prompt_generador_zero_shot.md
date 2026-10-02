# Ejemplo de Instrucción Inicial (Prompt) para la IA

A continuación, te mostramos un ejemplo de cómo le pedirías a un asistente de IA (como ChatGPT, Claude o Gemini) que te fabrique **toda esta página web interactiva y su sistema de corrección desde cero**, escribiéndole un único pero detallado mensaje.

Tener en claro qué quieres pedirle a la IA (y cómo se estructura tu materia) es el secreto para obtener herramientas educativas de altísimo nivel sin saber programar.

---

**Copia y pega este prompt en tu IA favorita para ver cómo funciona:**

> Actúa como un experto en creación de tecnología educativa. Necesito que me ayudes a crear los archivos necesarios para un taller docente. Quiero una pequeña página web interactiva donde los docentes puedan autoevaluarse y un sistema que luego corrija automáticamente sus respuestas.
> 
> **Estos son los requisitos que debes cumplir:**
> 
> 1. **Archivos a crear:**
>    Necesito que generes el código de la página web (`index.html`), sus estilos visuales (`styles.css`), su lógica interactiva (`app.js`), un archivo con las soluciones correctas (`rubrica.json`), un archivo que haga de "profesor automático" (`corrector.py`) y el archivo de configuración para que GitHub evalúe esto automáticamente en la nube.
> 
> 2. **Diseño de la Página Web:**
>    - Haz que la página sea visualmente hermosa y moderna. Usa un fondo oscuro con cajas semitransparentes (estilo cristal). 
>    - Lo más importante: esta web debe funcionar simplemente haciéndole doble clic al archivo en cualquier computadora, sin obligar al alumno a instalar programas complejos de programación.
>    - Coloca un título general y una tarjeta donde el participante deba escribir obligatoriamente su Nombre y su Materia.
>    - Agrega una "Barra de Progreso" visual que se vaya llenando (de 0% a 100%) a medida que responden las preguntas.
>    - Incluye 4 preguntas didácticas, pero quiero que tengan formatos diferentes para que el cuestionario no sea aburrido:
>      - Pregunta 1: Opciones de marcar con botones bonitos.
>      - Pregunta 2: Un menú desplegable moderno.
>      - Pregunta 3: Un ejercicio interactivo de "Arrastrar y Soltar" conceptos.
>      - Pregunta 4: Una tabla comparativa donde el estudiante deba llenar 6 celdas eligiendo opciones de un menú en cada una.
>    - Cuando todo esté completo, debe encenderse un botón para "Exportar Respuestas", que al pulsarlo le descargue un archivo a la computadora del estudiante.
> 
> 3. **Seguridad y Mecanismo Antifraude:**
>    - El archivo `rubrica.json` que contiene las soluciones **no debe** tener las respuestas a simple vista, ya que un estudiante curioso podría abrirlo y copiarse. Por favor encripta las respuestas correctas usando un código secreto.
>    - Además, en esta misma rúbrica, escribe mensajes de "Retroalimentación (Feedback) Formativa" para cada pregunta. Es decir, un texto que le explique al estudiante qué concepto repasar si llega a equivocarse en esa pregunta específica.
> 
> 4. **Corrección Automática (Evaluador):**
>    - Escribe un script en Python (el archivo corrector) que tome el archivo que descargó el alumno y lo compare con la rúbrica encriptada.
>    - Si el estudiante respondió mal, el script no solo debe decir "Respuesta Incorrecta", sino que debe mostrarle el "Feedback Formativo" exacto de esa pregunta para que sepa en qué falló.
>    - Finalmente, quiero que este script también revise si el estudiante creó ciertos archivos obligatorios en su carpeta (como `planificacion.md` o `AGENTS.md`) y le sume puntos por haberlos creado.
> 
> ¡Por favor, genera el código completo y listo para funcionar siguiendo estas reglas paso a paso!
