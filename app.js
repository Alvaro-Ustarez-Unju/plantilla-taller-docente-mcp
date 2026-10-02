const questions = [
    {
        id: "q1",
        text: "¿Cuál es la principal diferencia funcional entre un simple LLM (Chatbot) y un Agente de IA?",
        options: {
            "A": "El Agente puede ejecutar herramientas y modificar el entorno de forma autónoma.",
            "B": "El Agente tiene una base de datos más grande de conocimientos teóricos.",
            "C": "El Agente responde más rápido a las preguntas formuladas por el usuario.",
            "D": "El LLM puede usar el protocolo MCP pero el Agente de IA carece de esa capacidad."
        },
        ref: "Transformando la Evaluación Docente con MCP (Los Tres Pilares)",
        url: "https://sites.google.com/fi.unju.edu.ar/integracion-de-agentes-de-ia/#h.t30h3ffa9hyf"
    },
    {
        id: "q2",
        text: "¿Para qué sirve el archivo AGENTS.md en la arquitectura propuesta?",
        options: {
            "A": "Para almacenar el código fuente del evaluador automático de los trabajos.",
            "B": "Para guardar temporalmente las calificaciones de los alumnos en formato CSV.",
            "C": "Para definir la identidad, reglas y el contexto permanente de la IA.",
            "D": "Para configurar la conexión a internet del Entorno de Desarrollo (IDE)."
        },
        ref: "La Inyección de Contexto como Solución Pedagógica",
        url: "https://sites.google.com/fi.unju.edu.ar/integracion-de-agentes-de-ia/#h.k2gmjsuosiu5"
    },
    {
        id: "q3",
        text: "¿Qué garantiza el patrón 'Human-in-the-Loop' (HITL) en la evaluación?",
        options: {
            "A": "Que la Inteligencia Artificial nunca cometa errores al corregir sintaxis.",
            "B": "Que el docente siempre deba aprobar la acción antes de que la IA modifique archivos o publique notas.",
            "C": "Que el alumno reciba feedback automatizado en menos de 5 segundos de espera.",
            "D": "Que el examen sea aprobado automáticamente si el código compila sin arrojar errores."
        },
        ref: "Paso 3: Human-in-the-Loop en Acción",
        url: "https://sites.google.com/fi.unju.edu.ar/integracion-de-agentes-de-ia/#h.scj2qo5zxtep"
    },
    {
        id: "q4",
        text: "¿Qué es exactamente el protocolo MCP (Model Context Protocol)?",
        options: {
            "A": "Un lenguaje de programación compilado, diseñado exclusivamente para Inteligencia Artificial.",
            "B": "Un protocolo estandarizado que permite a la IA conectarse con herramientas locales como FileSystem o Bash.",
            "C": "Un robusto sistema de cifrado asimétrico para proteger las respuestas de los exámenes en archivos JSON.",
            "D": "Una extensión oficial y exclusiva de Google Chrome que permite leer archivos PDF localmente."
        },
        ref: "Transformando la Evaluación Docente con MCP",
        url: "https://sites.google.com/fi.unju.edu.ar/integracion-de-agentes-de-ia/#h.lp9kenpoij0x"
    }
];

const state = {};

function init() {
    const container = document.getElementById('quiz-container');
    questions.forEach((q, index) => {
        const card = document.createElement('div');
        card.className = 'question-card';
        
        const title = document.createElement('h3');
        title.innerText = `${index + 1}. ${q.text}`;
        card.appendChild(title);

        const optionsGrid = document.createElement('div');
        optionsGrid.className = 'options-grid';
        
        Object.entries(q.options).forEach(([key, value]) => {
            const btn = document.createElement('button');
            btn.className = 'option-btn';
            btn.innerText = value;
            btn.onclick = () => selectOption(q.id, key, optionsGrid);
            optionsGrid.appendChild(btn);
        });
        
        card.appendChild(optionsGrid);
        
        const refLink = document.createElement('div');
        refLink.className = 'ref-link';
        refLink.innerHTML = `📖 Referencia: <a href="${q.url}" target="_blank">${q.ref}</a>`;
        card.appendChild(refLink);

        container.appendChild(card);
    });

    document.getElementById('btn-export').onclick = exportJSON;
}

function selectOption(qId, optionKey, grid) {
    state[qId] = optionKey;
    Array.from(grid.children).forEach(btn => btn.classList.remove('selected'));
    event.target.classList.add('selected');
    checkCompletion();
}

function checkCompletion() {
    const isComplete = questions.every(q => state[q.id] !== undefined);
    document.getElementById('btn-export').disabled = !isComplete;
}

function exportJSON() {
    const dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(state, null, 2));
    const dlAnchorElem = document.createElement('a');
    dlAnchorElem.setAttribute("href", dataStr);
    dlAnchorElem.setAttribute("download", "respuestas_taller.json");
    dlAnchorElem.click();
}

init();
