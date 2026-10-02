# Especificación Dirigida por Diseño (SDD) - Laboratorio Taller MCP

Este documento define la arquitectura, flujos y componentes necesarios para construir y mantener el **"Laboratorio Interactivo: Fundamentos MCP"**. En metodologías modernas de IA, archivos como este sirven como "fuente de la verdad" (Spec-Driven Development) para que un Agente de IA entienda exactamente qué está construyendo antes de escribir la primera línea de código.

## 1. Visión General
El proyecto es una plantilla para un repositorio de GitHub que permite a los docentes experimentar una evaluación "Zero-Knowledge" mediante un laboratorio web local. Este laboratorio exporta un archivo JSON de respuestas, el cual luego es evaluado automáticamente y en tiempo real mediante GitHub Actions cuando el docente hace el *commit* de sus cambios.

## 2. Pila Tecnológica
- **Frontend / Cliente:** HTML5, CSS3 (Vanilla), JavaScript (Vanilla). Sin empaquetadores ni dependencias (NPM/Node).
- **Backend / Evaluador Automático:** Python 3 (librerías estándar: `json`, `hashlib`, `os`, `sys`).
- **CI/CD:** GitHub Actions (Runner de Ubuntu).

## 3. Arquitectura de Archivos
- `index.html`: Interfaz de usuario principal.
- `styles.css`: Sistema de diseño basado en CSS Flexbox/Grid con temática visual *Glassmorphism*.
- `app.js`: Motor de renderizado dinámico de las preguntas (State Management), tracking del progreso y serialización JSON.
- `autograder_taller.py`: Script de corrección criptográfica y validación de estructura de directorios mediante el filesystem.
- `rubric_taller.json`: Base de datos de hashes SHA-256 que representan las respuestas correctas. También almacena el "Feedback Elocuente" para retroalimentación formativa.
- `.github/workflows/autograding.yml`: Pipeline para ejecución del autograder de Python en cada evento de tipo `push`.

## 4. Componentes de la Interfaz Web (UI)
1. **Header:** Título del taller y contexto.
2. **Progress Bar:** Contenedor superior interactivo. El porcentaje se calcula en función de los campos y preguntas respondidas frente a un arreglo de requerimientos (`requiredKeys`).
3. **Student Card:** Entradas de texto libre para la identificación obligatoria (Nombre y Materia).
4. **Question Renderer (Tipos Soportados):**
   - `type: "radio"`: Renderiza opciones de múltiple elección como botones estilizados ocultando el `<input>` original.
   - `type: "select"`: Desplegables de un solo valor para respuestas unívocas simples.
   - `type: "dragdrop"`: Implementación pura mediante eventos (`ondragstart`, `ondragover`, `ondrop`) donde los ítems (`dataset.key`) se asignan al *dropzone*.
   - `type: "table"`: Renderizador matricial para comparar N conceptos con soporte de menús interactivos por cada celda.
5. **Export Button:** Genera un Object URL con un Blob de tipo `application/json` local en memoria para proteger la privacidad.

## 5. Criptografía y Zero-Knowledge Proof
- **Salt Compartido:** `"TALLER_UNJU_2025"`
- **Algoritmo Hashing:** SHA-256
- **Protocolo de Verificación:** Las respuestas no viajan a servidores ni están en texto plano. Se calcula el hash localmente en la máquina del alumno (o en el CI/CD) usando `hashlib.sha256(f"{qid}:{ans}:{salt}".encode()).hexdigest()` y se compara con la rúbrica maestra.

## 6. Lógica de Feedback Elocuente Formativo
La evaluación busca ser formativa. Por ende, la rúbrica cuenta con un diccionario interno `"feedback"`. Si el evaluador detecta un mismatch criptográfico, recupera el ID de la pregunta fallada y expone en el log:
`❌ [Error en {qid}] 💡 Feedback: {mensaje}`.
Esto dirige al estudiante a releer secciones específicas de la teoría.

## 7. Criterios de Aceptación y Pruebas
- [ ] La UI se renderiza con precisión en Chrome/Firefox/Edge sin necesidad de montar un `localhost`.
- [ ] La validación impide estrictamente descargar el JSON si falta el nombre, la materia o alguna pregunta.
- [ ] La Barra de Progreso alcanza exactamente el 100% solo cuando todo está respondido, no superando ni siendo menor a ese número.
- [ ] El script de Python no lanza excepciones ante la ausencia de archivos del estudiante, sino que descuenta los puntos correctamente.
