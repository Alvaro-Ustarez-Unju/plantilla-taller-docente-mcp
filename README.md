# 🎓 Plantilla Oficial: Taller de Capacitación Docente MCP

Bienvenido/a al repositorio base del Taller *"Agentes de IA y Protocolo MCP para evaluación continua y autoevaluación"*. 

📚 **Material Teórico:** [Sitio Web Oficial del Taller](https://sites.google.com/fi.unju.edu.ar/integracion-de-agentes-de-ia/)

Este repositorio es tu **espacio de trabajo personal**. Aquí aplicarás los conceptos aprendidos durante el Día 1 y el Día 2 del taller, construyendo paso a paso la estructura de tu propia cátedra interactiva.

---

## 🛠️ Toolkit Docente Incluido
Dentro de este repositorio encontrarás la carpeta `/toolkit_docente`. Esta carpeta contiene todas las guías, reglas anti-alucinaciones y plantillas avanzadas que vimos durante el taller. Utiliza este toolkit como referencia rápida en tu entorno de desarrollo para copiar estructuras y *prompts* sin tener que buscarlos externamente.

---

## 🧪 Catálogo de Ejemplos y Laboratorios por Materia
En la carpeta `/ejemplos_labs_interactivos` encontrarás un rico ecosistema de recursos didácticos reales, interactivos y listos para usar en tus clases, organizados por cátedras universitarias:

### 1. 💻 Algoritmos y Programación (`/Algoritmos y Programacion`)
- **35 Laboratorios Web Interactivos:** Archivos `.html` autocontenidos y de carga directa en el navegador, cubriendo:
  - Expresiones algebraicas y linealización para computadora.
  - Operadores relacionales (`>`, `<`, `==`) y lógica con situaciones de contexto real.
  - Operadores lógicos (`AND`, `OR`, `NOT`) y tablas de verdad dinámicas.
  - Operador módulo (`%` / `MOD`) para descomposición temporal y numérica.
  - Subprocesos y funciones (paso de parámetros por valor/referencia, ámbito local de variables y retorno).
- **Banco de Parciales y Simulacros (`/examenes_y_simulacros`):** Paquetes integrales de evaluación que contienen enunciados web temáticos interactivos, resoluciones de referencia en C++, rúbricas analíticas y especificaciones formales SDD (*Spec-Driven Development*).

### 2. 🌳 Estructuras de Datos (`/Estructuras de Datos`)
- **Simuladores y Widgets Visuales:** Herramientas interactivas para experimentar con grafos y estructuras dinámicas:
  - `estructuras_dinamicas.html`: Explorador y manipulador interactivo de memoria y nodos.
  - `dijkstra.html`: Simulación visual paso a paso del algoritmo de caminos mínimos de Dijkstra sobre grafos ponderados.
  - `puntos_articulacion.html`: Análisis topológico de grafos y detección de nodos críticos/puentes de corte.
  - `guia_conversion.html`: Asistente visual y conceptual para transformaciones entre representaciones.

### 3. 🎲 Modelos y Simulación (`/Modelos y Simulacion`)
- **Simuladores Estocásticos y Estadísticos:**
  - `TP2-Simulador-MonteCarlo`: Aplicación web interactiva completa (HTML/CSS/JS) para experimentación con el método de Monte Carlo y análisis de convergencia.
  - `TP3-Generacion de Nros PseudoAleatorios`: Generadores congruenciales lineales y algoritmos de generación de variables uniformes.
  - `TP4-Pruebas-Estadisticas`: Baterías de pruebas estadísticas de bondad de ajuste (Chi-Cuadrado, Kolmogorov-Smirnov, etc.).

### 4. 🐧 Sistemas Operativos I (`/Sistemas Operativos I`)
- **Guías Prácticas y Autoevaluaciones (Clases 1 a 5):**
  - Laboratorios prácticos de permisos de archivos en Linux (SUID, GUID, Sticky Bit, umask) y scripts de verificación automatizada.
  - Prácticas de criptografía simétrica/asimétrica (RSA), integridad y firma con SHA-256.
  - Cuestionarios conceptuales psicométricos calibrados para Quizizz (`quizizz.md`) y material teórico de cátedra.

### 5. ⚙️ Sistemas Operativos II (`/Sistemas Operativos II`)
- **Concurrencia, Procesos y Evaluación Continua (Clases 1 a 4):**
  - Guías y ejercicios sobre ciclo de vida de procesos, planificación, interbloqueo (*deadlocks*) y sincronización.
  - Proyectos estructurados con autograders en Python (`autograder.py`) y rúbricas en JSON para integración con GitHub Classroom y GitHub Actions.

> **💡 Cómo utilizarlos:** Los archivos `.html` pueden abrirse directamente en cualquier navegador moderno haciendo doble clic sobre ellos, o integrarse en Google Sites, Moodle o plataformas institucionales como widgets de práctica activa.

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
