# Prompt Zero-Shot: Generación del Laboratorio Interactivo

A continuación, te presentamos un ejemplo de cómo podrías pedirle a un Agente de IA (como Gemini, Claude o Antigravity) que construya toda esta plantilla evaluativa compleja **desde cero** y en **un solo prompt** (técnica conocida como Zero-Shot Prompting).

Esto demuestra el poder de tener claras tus reglas y la estructura de tu materia (Spec-Driven Development) a la hora de delegar tareas complejas a la IA.

---

**Copia y pega este prompt en un agente de código:**

> Actúa como un Desarrollador Frontend Senior y Arquitecto de Software Educativo. Tu objetivo es crear un repositorio para un taller de capacitación docente que incluya un laboratorio interactivo web autoevaluable y un sistema de corrección continua basado en GitHub Actions.
> 
> **Requisitos del proyecto:**
> 
> 1. **Estructura del Proyecto:**
>    Crea la estructura de archivos que incluya un `index.html`, `styles.css`, `app.js`, `autograder.py`, `rubrica.json` y el flujo de trabajo en `.github/workflows/autograding.yml`.
> 
> 2. **Interfaz de Usuario (Web Lab):**
>    - Usa un diseño moderno con "Glassmorphism", fondo oscuro degradado y colores dinámicos. No uses frameworks como React o dependencias de NPM, debe funcionar con un simple doble clic (Vanilla JS/HTML/CSS).
>    - Crea un encabezado con el título "Laboratorio Interactivo".
>    - Añade una "Tarjeta de Datos del Participante" con campos de texto para Nombre y Materia.
>    - Añade una "Barra de Progreso" dinámica visual que se actualice (en porcentaje y ancho de barra) a medida que se responden las consignas.
>    - El cuestionario debe tener 4 preguntas didácticas sobre IA y Agentes, pero usando diferentes tipos de inputs educativos para demostrar variedad:
>      - Q1: Radio buttons estilizados personalizados (ocultando el input original).
>      - Q2: Un menú desplegable `<select>` moderno.
>      - Q3: Una zona interactiva de "Arrastrar y Soltar" (Drag & Drop) usando la API nativa de Vanilla JS.
>      - Q4: Una tabla comparativa (Chatbot, Agente, Protocolo MCP) con 6 celdas interactivas en donde cada celda tenga su propio menú desplegable.
>    - Al completar todas las preguntas y los datos del estudiante, un botón "Exportar Respuestas (JSON)" debe habilitarse y descargar un archivo de resultados directamente al dispositivo local.
> 
> 3. **Mecanismo de Evaluación (Zero-Knowledge Proof):**
>    - El archivo `rubrica.json` no debe contener las respuestas correctas en texto plano (para evitar trampas). En su lugar, usa un "salt" secreto y almacena los hashes SHA-256 de las respuestas correctas.
>    - Incluye un diccionario de "feedback elocuente" en la rúbrica para cada pregunta, detallando qué concepto pedagógico repasar si el alumno se equivoca.
> 
> 4. **Autograder en Python:**
>    - Escribe un script en Python que cargue el `.json` exportado por el alumno y lo compare calculando los hashes contra los esperados en `rubrica.json`.
>    - Si la respuesta es incorrecta, el script debe imprimir en consola el feedback elocuente específico de esa pregunta ("Aplica el feedback formativo").
>    - El autograder también debe verificar la existencia en el sistema de archivos estructurales como `AGENTS.md`, `MEMORY.md`, y la rúbrica de un Trabajo Práctico, otorgando puntos de experiencia por su existencia.
> 
> ¡Por favor, genera el código completo para cada archivo cumpliendo estrictamente estas instrucciones!
