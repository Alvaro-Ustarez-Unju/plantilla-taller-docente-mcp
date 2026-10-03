# 🎓 Plantilla Oficial: Taller de Capacitación Docente MCP

Bienvenido/a al repositorio base del Taller *"Agentes de IA y Protocolo MCP para evaluación continua y autoevaluación"*. 

📚 **Material Teórico:** [Sitio Web Oficial del Taller](https://sites.google.com/fi.unju.edu.ar/integracion-de-agentes-de-ia/)

Este repositorio es tu **espacio de trabajo personal**. Aquí aplicarás los conceptos aprendidos durante el Día 1 y el Día 2 del taller, construyendo paso a paso la estructura de tu propia cátedra interactiva.

---

## 🛠️ Toolkit Docente Incluido
Dentro de este repositorio encontrarás la carpeta `/toolkit_docente`. Esta carpeta contiene todas las guías, reglas anti-alucinaciones y plantillas avanzadas que vimos durante el taller. Utiliza este toolkit como referencia rápida en tu entorno de desarrollo para copiar estructuras y *prompts* sin tener que buscarlos externamente.

---

## 🧪 Ejemplos de Laboratorios Interactivos
En la carpeta `/ejemplos_labs_interactivos` encontrarás un catálogo de 35 ejemplos prácticos de laboratorios web listos para usar, especialmente diseñados para la cátedra *Algoritmos y Programación*. Estos ejemplos demuestran cómo crear interfaces visuales e interactivas (widgets) en HTML/JS para evaluar de forma didáctica:
- Expresiones algebraicas y linealización.
- Operadores Relacionales (>, <, ==).
- Operadores Lógicos (AND, OR, NOT) y Tablas de Verdad.
- Uso matemático y de extracción del operador Módulo (%).
- Subprocesos y Funciones (parámetros por valor/referencia, variables locales, retornos).

Además, dentro de esta misma sección, encontrarás la subcarpeta `/examenes_y_simulacros`, la cual incluye paquetes completos de simulacros y exámenes reales programados en C++ (con sus respectivas resoluciones completas). ¡Puedes usarlos como base o inspiración para construir tu propio banco de evaluaciones!

¡Explóralos haciendo doble clic en cualquiera de los archivos `.html` para verlos en acción en tu navegador!

---

## 🚀 Tareas del Día 1: Fundamentos y Persistencia (Onboarding)
Tu objetivo es inicializar este repositorio como el núcleo de tu materia. Para aprobar esta etapa, debes realizar lo siguiente:

- [ ] **0. Completar el Laboratorio Web:** Haz doble clic en `index.html` (dentro de este repositorio) en tu computadora. Responde las 4 preguntas sobre los fundamentos del taller, haz clic en Exportar y guarda el archivo `respuestas_taller.json` en la raíz de esta carpeta.
- [ ] **1. Crear `AGENTS.md`**: Define las reglas de comportamiento de tu agente (Ej: "Eres el asistente de la materia X, usa método socrático").
- [ ] **2. Crear `MEMORY.md`**: Define el estado inicial de tu proyecto y las convenciones de tu cátedra.
- [ ] **3. Crear `planificacion.md`**: Un archivo con el programa analítico o la planificación de tu materia.
- [ ] **4. Directorio `/bibliografia`**: Crea esta carpeta y añade al menos un archivo dentro (ej. `referencias.md` o un apunte en texto plano).

> **💡 Tip:** No lo hagas a mano. Escribe en el chat de tu IDE: *"Actúa como mi asistente docente. Basándote en mi materia [Nombre], créame el archivo AGENTS.md, MEMORY.md, planificacion.md y la carpeta /bibliografia con un archivo de referencia."*

---

## 🎯 Tareas del Día 2: Laboratorio Integrador
En el segundo día, utilizaremos las plantillas avanzadas del Toolkit para crear un evaluador automatizado.

- [ ] **1. Crear carpeta `Trabajo_Practico_1/`**: Dentro del repositorio.
- [ ] **2. Crear `rubrica.md`**: Define qué se evalúa en el TP1.
- [ ] **3. Crear `skill_evaluador.md`**: Extrae la rúbrica y crea un Agente Evaluador usando el formato estándar.

---

## ⚙️ Autoevaluación Continua (GitHub Actions)
Este repositorio cuenta con un sistema de corrección automática idéntico al que usarás con tus alumnos. Cada vez que hagas un `git push`, GitHub Actions revisará si cumpliste con las tareas y te asignará un puntaje. ¡Revisa la pestaña **Actions** en GitHub para ver tu progreso!
