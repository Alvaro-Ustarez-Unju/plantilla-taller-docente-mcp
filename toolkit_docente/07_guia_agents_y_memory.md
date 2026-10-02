# 7. Guía y Plantillas: `AGENTS.md` y `MEMORY.md`

Cuando trabajas con Agentes de IA en entornos de desarrollo modernos (como Cursor, Windsurf o Antigravity), depender exclusivamente de prompts manuales o de cargar Skills en cada chat puede volverse repetitivo para configurar el comportamiento global de un proyecto.

Para solucionar esto, utilizamos **archivos de configuración persistente**. Los dos más importantes son `AGENTS.md` y `MEMORY.md`.

---

## 1. ¿Qué son y para qué sirven?

### A. `AGENTS.md` (La Constitución del Proyecto)
*También conocido en algunos IDEs como `.cursorrules` o `GEMINI.md`.*
- **Propósito:** Definir las reglas globales de comportamiento, el tono, las herramientas permitidas y el contexto general del proyecto.
- **¿Cuándo actúa?** La IA lo lee de forma invisible y automática cada vez que inicias un nuevo chat dentro de esa carpeta.
- **Uso Docente:** Se usa para decirle al Agente: *"Estás en el repositorio de la materia Sistemas Operativos. Siempre responde como docente, nunca des código resuelto y avísame si el alumno usa librerías prohibidas"*.

### B. `MEMORY.md` (El Diario de a Bordo)
- **Propósito:** Mantener el estado actual del proyecto, el historial de decisiones, las convenciones adoptadas y las tareas pendientes (TODOs).
- **¿Cuándo actúa?** La IA lo lee para entender en qué punto se quedó el trabajo anterior, y tú (o la propia IA) lo actualizan al finalizar una sesión.
- **Uso Docente:** Sirve para que la IA recuerde: *"Ya corregimos los TP1 y TP2. Estamos armando el TP3. El estándar de base de datos que usamos este cuatrimestre es PostgreSQL, no MySQL"*.

---

## 2. Plantilla de Ejemplo: `AGENTS.md` (Enfoque Operativo Docente)

Inspirados en las mejores prácticas de ingeniería de agentes (como las reglas de Codex), adaptamos esa rigurosidad estricta al contexto de un Agente Docente Universitario. Guarda este contenido en `AGENTS.md` en la raíz del repositorio de tu materia:

```markdown
# AGENTS.md - Asistente de Cátedra
Cada línea de este archivo modifica cómo debes interactuar con las entregas y el diseño de material.

## 1. Planifica antes de evaluar o diseñar
- Tarea larga (ej. auditar 30 exámenes): Primero dime en 2-3 frases qué rúbrica y contexto teórico vas a aplicar.
- Empieza la corrección solo después de que yo te dé autorización explícita.
- Escribe tus pasos de corrección en un `PLAN.md`, indicando cómo demostrarás que verificaste la evidencia.

## 2. Haz la intervención mínima (Socrática)
- Mantente dentro del rol formativo. No rompas el proceso de aprendizaje entregando el código resuelto.
- ¿Hay un error? No lo refactorices. Proporciona pistas progresivas o señala la línea exacta del fallo.
- No evalúes con dependencias, librerías o paradigmas avanzados que el alumno aún no haya cursado.

## 3. Divide el trabajo de auditoría
- Trabaja de manera secuencial: primero explora el código (lectura estática), luego ejecuta las pruebas (MCP Bash), y finalmente redacta el borrador.
- Comprueba la afirmación clave de un error simulándolo en el entorno antes de construir un juicio de valor sobre el alumno.

## 4. Hazte cargo del código del alumno
- Reprodúcelo primero usando tus herramientas (ej. iniciar servidor local, revisar logs de consola). ¿No puedes reproducirlo porque faltan archivos? Detente e informa "Entrega corrupta".
- Nunca silencies un error de compilación o ejecución del alumno solo para generar un reporte rápido.

## 5. Verifica antes de proponer un puntaje
- Ejecuta las pruebas unitarias y lee tú mismo el resultado por terminal.
- UI: intenta romper la entrega del alumno (entradas vacías, doble envío, tipos de datos incorrectos).
- ¿No has podido ejecutar una comprobación dinámica? Dilo. Una lectura estática no cuenta como evaluación superada.
- Informa el feedback final en 2-3 líneas para mi revisión (HITL) antes de exportar el PDF final.

## 6. Anota cada decisión pedagógica
- Cuando te corrija un enfoque (ej. "ese tema no lo vimos aún" o "fuiste muy duro"), añade una regla en Lessons: "Cuando X, haz Y".
- Si cometes el mismo error de evaluación dos veces, la lección no está clara. Reescríbela.
- Pregúntame antes de borrar reglas históricas de cátedra.

## Lessons
<!-- Lo más reciente arriba. Elimina los criterios pedagógicos que ya no apliquen al cuatrimestre actual. -->
```

---

## 3. Plantilla de Ejemplo: `MEMORY.md`

Guarda este contenido en un archivo llamado `MEMORY.md` y actualízalo periódicamente:

```markdown
# Memoria del Proyecto y Estado de la Cátedra

## 📌 Contexto Actual
- **Fase del Cuatrimestre:** Preparación de exámenes de mitad de cursada (Unidades 1 a 4).
- **Última Acción:** Se finalizó el generador de TPs interactivos.

## 📐 Convenciones Acordadas (No modificar sin permiso docente)
- **Framework de Testing:** Usamos `pytest` para Python y `Jest` para JS.
- **Estructura de Repositorios:**
  - `TP<N>-demo/` -> Código docente (intocable).
  - `TP<N>/` -> Plantilla para alumnos.
- **Regla Psicométrica:** Todos los cuestionarios teóricos usan el estándar estricto anti-sesgo (Anti-Length, Anti-Letter).

## 📝 Tareas Pendientes (TODO)
- [x] Migrar TP1 y TP2 al nuevo formato autoevaluable.
- [x] Crear el `skill-evaluador-maquetacion.md`.
- [ ] (PRIORIDAD) Generar el repositorio base del Parcial 1 (Tema: E-commerce).
- [ ] Revisar si los tiempos de los tests en GitHub Actions superan los 30 segundos y optimizar.

## 🛑 Problemas Conocidos (Troubleshooting)
- Los alumnos de Windows tienen problemas con el salto de línea (`CRLF` vs `LF`). **Recordatorio a la IA:** Siempre agregar `.gitattributes` con `* text=auto eol=lf` al generar repositorios.
```

---
> **💡 Tip para el Taller:** Explica a los docentes que `AGENTS.md` es el "cómo nos comportamos siempre" y `MEMORY.md` es el "en qué andamos hoy y qué decidimos ayer". Al combinar ambos, logran que la IA se convierta en un miembro permanente del equipo de cátedra, con memoria a largo plazo.
