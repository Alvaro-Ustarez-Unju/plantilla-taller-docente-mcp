# Toolkit Docente: Auditoría Ética, Sesgos y Puntos de Ritmo

## 1. Matriz de Auditoría de Sesgos (Para Quizzes / Evaluaciones generadas)
Antes de aplicar un cuestionario generado por IA (ej. Quizizz), pásalo por esta auditoría rápida:

- [ ] **Sesgo Cultural:** ¿Los ejemplos asumen conocimientos de nicho o locales que no todos comparten? (Ej: Metáforas de deportes específicos).
- [ ] **Sesgo Lingüístico:** ¿El nivel de vocabulario es innecesariamente complejo para evaluar una competencia técnica?
- [ ] **Falsos Negativos Sistémicos:** ¿El formato excluye respuestas lógicamente válidas pero no contempladas por la IA?
- [ ] **Accesibilidad:** ¿Los elementos visuales requeridos tienen contraste suficiente y descripción para lectores de pantalla?

### ⚠️ Alerta de Sesgos Estructurales Nativos de LLMs
Los LLMs tienden a delatar la respuesta correcta si no se los restringe. Revisa lo siguiente:
- [ ] **Sesgo de Longitud (Anti-Length Bias):** ¿La IA generó la respuesta correcta visiblemente más larga y detallada que los distractores? *(Pídele simetría del $\pm 15\%$ en todas las opciones)*.
- [ ] **Sesgo de Formato (Anti-Bold):** ¿La IA resaltó con negritas o comillas una palabra clave **solo** en la opción correcta?
- [ ] **Sesgo de Posición:** ¿La IA está ubicando estadísticamente la mayoría de las respuestas correctas en la opción 'B' o 'C'? *(Exige distribución equitativa).*

## 2. Configuración de Puntos de Ritmo (Evaluación de Proceso)
Si usas *ClassMoji* o evaluación continua, define el peso del proceso vs el resultado:

| Métrica | Condición | Puntos Asignados |
|---|---|---|
| **Early Draft (🚀)** | Entrega del primer prototipo a >72hs del cierre. | +20% |
| **Corrección Iterativa (🛠️)** | El commit posterior resuelve fallas marcadas por el linter o la IA. | +30% |
| **Código Frankenstein (⚠️)** | Inserción masiva de código (copy-paste) a 3:00 AM sin commits previos. | -50% (Riesgo Académico) |

> **Nota Ética:** La evaluación debe adaptarse a los casos de equidad. Si un estudiante sufre la brecha digital (falta de internet en el hogar y debe subir todo junto desde un cíber/facultad), el sistema de "Ritmo" no debe penalizarlo. Siempre interviene el **Criterio Humano (HITL)**.
