# Toolkit Docente: Guía de MCPs Esenciales

## ¿Qué es un MCP (Model Context Protocol)?
Es el "cable USB" que conecta a tu Agente de IA con herramientas reales de la cátedra. Sin MCPs, el Agente es un simple oráculo aislado. Con MCPs, el Agente puede leer, escribir y operar sobre el entorno.

## Catálogo de MCPs Recomendados para Docencia

| MCP | Caso de Uso Pedagógico | Advertencia de Seguridad |
|---|---|---|
| **Local File System** | Leer entregas locales de alumnos, inyectar el programa analítico o la rúbrica directamente desde tu PC. | Limita el acceso *únicamente* a la carpeta de la materia. Nunca le des acceso a toda la unidad `C:\`. |
| **GitHub / Git** | Clonar repositorios de los alumnos, leer commits para evaluar el "Ritmo", y abrir Issues con el feedback. | Usa tokens con permisos granulados (solo repositorios de clase). |
| **BraveSearch / Web** | Buscar documentación técnica actualizada, validar si un alumno copió de un tutorial específico. | Puede traer contenido sesgado de blogs; cruza siempre con tu bibliografía. |
| **Playwright / Browser** | Abrir y navegar por proyectos web de los alumnos (HTML/JS) para evaluar interactividad visualmente sin inspeccionar solo el código estático. | El código frontend del alumno se ejecutará en tu navegador local (riesgo bajo, pero precaución con scripts pesados). |
| **PostgreSQL / SQLite** | Conectar el Agente a la base de datos de inasistencias o calificaciones previas. | Usa permisos de *solo-lectura* (Read-Only) para evitar que la IA modifique notas. |
| **Bash / WSL** | Ejecutar y compilar el código del alumno en un entorno seguro para verificar si funciona. | Crítico: Debe ejecutarse en un entorno aislado (Sandbox) sin permisos de Administrador. |

## 🚀 Ejemplos de Invocación Natural
Una de las mayores ventajas de los MCPs es que no requieren que el docente sepa programar integraciones; el Agente decide cuándo usarlos basándose en tu solicitud en lenguaje natural.

**Ejemplo 1: Invocando el MCP de FileSystem**
> *"Por favor, lee todos los archivos `.cpp` dentro de la carpeta `C:\\Universidad\\Entregas\\TP1_Perez` y evalúalos utilizando los criterios del archivo `rubrica.md` que está en este mismo directorio."*

**Ejemplo 2: Invocando el MCP de Bash (Terminal)**
> *"Ejecuta un comando en la terminal para compilar el código del alumno usando `g++ main.cpp -o app`. Si compila correctamente, ejecuta `./app` y dime si la salida coincide con el caso de prueba esperado. Si no compila, muéstrame el error."*

**Ejemplo 3: Invocando el MCP de GitHub**
> *"Revisa los últimos 5 commits del repositorio `alumno-perez-tp2` en la organización de la cátedra. Identifica si el alumno programó iterativamente o si subió todo el código en un solo commit la noche anterior al cierre. Luego, abre un Issue en su repositorio brindándole feedback sobre su ritmo de trabajo (ClassMoji)."*

**Ejemplo 4: Invocando el MCP de Playwright (Navegador Automático)**
> *"Abre el archivo `index.html` de la entrega del alumno en el navegador. Simula un clic en el botón 'Agregar al Carrito' y verifica si el contador sube a 1 visualmente. Tómale una captura de pantalla al resultado y evalúa si la interfaz gráfica cumple con el diseño de referencia."*

**Ejemplo 5: Invocando el MCP de Base de Datos (SQL)**
> *"Conéctate a la base de datos SQLite `notas_2025.db`. Busca el historial de calificaciones del alumno 'Juan Pérez' en los últimos 3 trabajos prácticos. Dime si su rendimiento viene en ascenso o en declive para poder adaptar el tono de mi feedback formativo en la corrección actual."*
