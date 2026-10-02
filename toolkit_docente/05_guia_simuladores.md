# Toolkit Docente: Guía para Simuladores y Laboratorios Web

Cuando utilices a la IA para programar Widgets (HTML/JS) o laboratorios interactivos (Nivel 1 y 2), es vital evitar errores conceptuales que dañen la comprensión del alumno.

## 🛑 Errores Comunes al Generar Simuladores con IA

| Error Común | Impacto Pedagógico | Cómo Evitarlo (Restricción) |
|---|---|---|
| **Abstracción Prematura** | Usar librerías de alto nivel (ej. `std::vector.erase`) cuando la materia trata sobre algoritmos base (arreglos). | Especificar en el SDD: *"No usar librerías externas. Implementar lógica algorítmica cruda."* |
| **No declarar los límites del modelo** | El alumno asume que el sistema real funciona *exactamente* igual que la animación simplificada. | Obligar a la IA a incluir un *Disclaimer* visible: *"Este modelo omite [X] y simplifica [Y]"*. |
| **Generación en Caja Negra** | Entregar el ejecutable sin el código comentado, impidiendo que el alumno vea la lógica. | Pedir a la IA que el simulador muestre la sección de código que se está ejecutando (Traceability). |
| **Falta de Cadencia (Pacing Pedagógico)** | La simulación ocurre demasiado rápido ("de golpe"), impidiendo que el estudiante asimile los cambios de estado. | Obligar a la IA a incluir controles de ejecución **Paso a Paso** y un selector de **Velocidad (Lento/Normal/Rápido)**. |
| **Falta de Ciclo de Kolb** | El simulador es un juguete donde el alumno hace clics al azar sin reflexionar. | Exigir en el prompt: *"Incluir un campo de predicción donde el alumno deba escribir qué pasará ANTES de presionar Ejecutar"*. |

## 🔒 Auditoría de Seguridad (Laboratorios Nivel 3)
Si el laboratorio involucra la ejecución de comandos (WSL/Linux):
1. Verificar que el agente corra en un *Sandbox*.
2. Usuario sin privilegios (`sudo` prohibido).
3. Utilizar datos ficticios de prueba.
