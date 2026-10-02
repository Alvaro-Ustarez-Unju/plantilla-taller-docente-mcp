# Toolkit Docente: Guía de Contexto y Anti-Alucinaciones

## ¿Por qué ocurren las alucinaciones?
El Agente "inventa" porque le falta información y su motor estadístico lo obliga a completar el vacío. Antes de enviar un prompt crítico (como evaluar un examen o diseñar un ejercicio), revisa este checklist.

## 🛑 Checklist de Contexto (Revisión Pre-Ejecución)

- [ ] **Contexto Institucional:** ¿Le indiqué el año y nivel de la carrera? *(Ej: 2do año, no postgrado)*.
- [ ] **Contexto Teórico:** ¿Le pasé el Programa Analítico o los temas específicos vistos en clase?
- [ ] **Cronograma de la Asignatura:** ¿Le aclaré en qué semana o etapa del año estamos? *(Crítico para que la IA respete el orden cronológico de aprendizaje y no exija o resuelva con conceptos futuros)*.
- [ ] **Restricciones Técnicas:** ¿Le aclaré qué herramientas/librerías están prohibidas? *(Ej: "No usar std::vector, usar solo arreglos estáticos")*.
- [ ] **Parámetros de Evaluación:** ¿Adjunté la Rúbrica oficial de la cátedra con puntajes?
- [ ] **Accesibilidad para la IA (Machine-Readable):** ¿El material adjunto está en formatos planos fáciles de procesar? *(Preferir `.md`, `.csv`, `.txt` antes que PDFs con imágenes o tablas complejas)*.
- [ ] **Material Base:** ¿Le adjunté el código o la entrega real del alumno mediante un MCP de FileSystem?

## 💾 Persistencia del Contexto (System Prompts Locales)
Una vez que hayas validado todas estas reglas de cátedra, evita repetirlas en cada conversación. Crea en la raíz de tu carpeta de trabajo docente los archivos:
- `AGENTS.md` (o `GEMINI.md` / `RULES.md` según el IDE): Para dictar las directrices de comportamiento globales (ej. no dar el código resuelto, restricciones técnicas).
- `MEMORY.md`: Para registrar el avance en el cronograma, lecciones aprendidas o excepciones pedagógicas actuales.

> **Regla de Oro:** Si el prompt cabe en un tweet, va a alucinar. Un prompt profesional debe referenciar documentos, reglas persistidas e historial de cátedra.
