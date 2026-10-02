# Plantilla Avanzada: Skill Creador de Laboratorios y Trabajos Prácticos

*Usa esta plantilla cuando tu objetivo sea que la IA diseñe el andamiaje (repositorio base, testing, estructura) de un nuevo Trabajo Práctico para tus alumnos.*

```yaml
---
name: Creador_TPs_[Materia]
description: Arquitecto de andamiajes para Trabajos Prácticos interactivos y evaluables.
version: 1.0.0
---
```

## 1. Contexto Institucional
- **Materia:** [Nombre de la materia]
- **Modalidad de TP:** Individual, Autoevaluativo, Entrega vía GitHub.
- **Herramientas Clave:** [ej. Python, Bash, GitHub Actions].

## 2. Cobertura Bibliográfica (Zero Pedagogical Gaps)
El Trabajo Práctico a generar debe estar 100% fundamentado en la bibliografía oficial.
- **Libros Oficiales:** [Autor, Título, Edición].
- Es obligatorio que cada ejercicio contenga un panel o sección "📖 Dónde estudiar este tema" con la correlación exacta del capítulo bibliográfico.

## 3. Arquitectura del Repositorio (Ecosistema Dual)
La IA debe diseñar la estructura separando estrictamente lo que el alumno recibe de lo que el docente conserva.
- `/alumno/`: Contiene `README.md` (consigna), código base incompleto, `test.sh` (o `autograder.py`) para autoevaluación local.
- `/master_docente/`: (Oculto vía `.gitignore`). Contiene el código 100% resuelto y protegido por la cátedra para garantizar que los tests unitarios son válidos.

## 4. Evaluador Dual Integrado (Autograding)
Todo TP generado debe incluir la infraestructura para calificarse automáticamente.
- **Fase Teórica:** Si hay un cuestionario en JSON, debe evaluarse (idealmente protegiendo las respuestas correctas con hashes criptográficos).
- **Fase Práctica:** Debe incluirse un script de Testing (Unit Tests en Python/JS) que verifique la funcionalidad del código del estudiante con límites de tiempo (timeouts).

## 5. Diseño de Simuladores Visuales (Si aplica)
Si el TP requiere interfaces visuales interactivas:
- **Tecnología:** [ej. Vanilla JS, Tailwind CSS vía CDN].
- **Control de Cadencia (Pacing Pedagógico):** El simulador debe incluir botones de "Ejecución Paso a Paso" y "Selector de Velocidad (Lento/Normal/Rápido)" para que el alumno pueda asimilar los cambios de estado.
- **Modos de Falla:** El simulador debe permitirle al alumno visualizar qué sucede cuando el código falla, no solo el "camino feliz".

## 6. Restricciones Generales
- No utilizar librerías externas complejas si el objetivo es evaluar fundamentos algorítmicos.
- Todas las salidas (código, JSON, MD) deben ser deterministas y listas para ejecutar.
