const questions = [
    {
        id: "q1",
        type: "radio",
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
        type: "select",
        text: "¿Para qué sirve el archivo AGENTS.md en la arquitectura propuesta?",
        options: {
            "": "-- Selecciona una opción --",
            "A": "Para almacenar el código fuente del evaluador automático.",
            "B": "Para definir la identidad, reglas y el contexto permanente de la IA.",
            "C": "Para configurar la conexión a internet del Entorno de Desarrollo."
        },
        ref: "La Inyección de Contexto como Solución Pedagógica",
        url: "https://sites.google.com/fi.unju.edu.ar/integracion-de-agentes-de-ia/#h.k2gmjsuosiu5"
    },
    {
        id: "q3",
        type: "dragdrop",
        text: "Arrastra la definición correcta que garantiza el patrón 'Human-in-the-Loop' (HITL):",
        options: {
            "A": "La Inteligencia Artificial nunca comete errores de sintaxis",
            "B": "El docente siempre debe aprobar la acción antes de que la IA modifique archivos",
            "C": "El examen es aprobado automáticamente si el código compila"
        },
        ref: "Paso 3: Human-in-the-Loop en Acción",
        url: "https://sites.google.com/fi.unju.edu.ar/integracion-de-agentes-de-ia/#h.scj2qo5zxtep"
    },
    {
        id: "q4",
        type: "table",
        text: "Completa la tabla comparativa sobre los tres conceptos clave:",
        headers: ["Característica", "Chatbot", "Agente", "Protocolo MCP"],
        rows: [
            {
                label: "Rol",
                cols: [
                    "Interfaz pasiva.",
                    "Sistema autónomo.",
                    "Estándar de conexión abierto."
                ]
            },
            {
                label: "Funcionamiento",
                cols: [
                    "Responde únicamente a inputs y archivos cargados manualmente.",
                    "Planifica, encadena acciones y usa herramientas iterativamente para tareas complejas.",
                    {
                        type: "select",
                        options: {
                            "": "-- Seleccionar Funcionamiento --",
                            "A": "Lenguaje de programación compilado que define cómo razona la IA.",
                            "B": "No define cómo razona la IA; estandariza cómo se conecta con herramientas y carpetas locales.",
                            "C": "Sistema de cifrado asimétrico que protege los prompts del usuario."
                        }
                    }
                ]
            }
        ],
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

        if (q.type === 'radio') {
            const optionsGrid = document.createElement('div');
            optionsGrid.className = 'options-grid';
            Object.entries(q.options).forEach(([key, value]) => {
                const label = document.createElement('label');
                label.className = 'radio-label';
                
                const input = document.createElement('input');
                input.type = 'radio';
                input.name = q.id;
                input.value = key;
                input.onchange = () => {
                    state[q.id] = key;
                    checkCompletion();
                };
                
                const customRadio = document.createElement('span');
                customRadio.className = 'custom-radio';
                
                const text = document.createElement('span');
                text.innerText = value;
                
                label.appendChild(input);
                label.appendChild(customRadio);
                label.appendChild(text);
                optionsGrid.appendChild(label);
            });
            card.appendChild(optionsGrid);
        } else if (q.type === 'select') {
            const selectContainer = document.createElement('div');
            selectContainer.className = 'select-container';
            const select = document.createElement('select');
            select.className = 'modern-select';
            Object.entries(q.options).forEach(([key, value]) => {
                const opt = document.createElement('option');
                opt.value = key;
                opt.innerText = value;
                select.appendChild(opt);
            });
            select.onchange = (e) => {
                if(e.target.value) {
                    state[q.id] = e.target.value;
                } else {
                    delete state[q.id];
                }
                checkCompletion();
            };
            selectContainer.appendChild(select);
            card.appendChild(selectContainer);
        } else if (q.type === 'dragdrop') {
            const dragContainer = document.createElement('div');
            dragContainer.className = 'drag-container';
            
            const dropzone = document.createElement('div');
            dropzone.className = 'dropzone';
            dropzone.innerText = "Arrastra la respuesta correcta aquí";
            
            dropzone.ondragover = (e) => { e.preventDefault(); dropzone.classList.add('drag-over'); };
            dropzone.ondragleave = () => dropzone.classList.remove('drag-over');
            dropzone.ondrop = (e) => {
                e.preventDefault();
                dropzone.classList.remove('drag-over');
                const dragId = e.dataTransfer.getData('text/plain');
                if(!dragId) return;
                const draggedElement = document.getElementById(dragId);
                if (dropzone.children.length > 0) {
                    dragContainer.appendChild(dropzone.children[0]);
                }
                dropzone.innerText = "";
                dropzone.appendChild(draggedElement);
                state[q.id] = draggedElement.dataset.key;
                checkCompletion();
            };
            
            Object.entries(q.options).forEach(([key, value]) => {
                const draggable = document.createElement('div');
                draggable.className = 'draggable-item';
                draggable.id = `drag-${q.id}-${key}`;
                draggable.draggable = true;
                draggable.innerText = value;
                draggable.dataset.key = key;
                draggable.ondragstart = (e) => {
                    e.dataTransfer.setData('text/plain', draggable.id);
                };
                dragContainer.appendChild(draggable);
            });
            
            card.appendChild(dropzone);
            card.appendChild(dragContainer);
        } else if (q.type === 'table') {
            const tableContainer = document.createElement('div');
            tableContainer.className = 'table-container';
            const table = document.createElement('table');
            table.className = 'modern-table';
            
            const thead = document.createElement('thead');
            const headerRow = document.createElement('tr');
            q.headers.forEach(h => {
                const th = document.createElement('th');
                th.innerText = h;
                headerRow.appendChild(th);
            });
            thead.appendChild(headerRow);
            table.appendChild(thead);
            
            const tbody = document.createElement('tbody');
            q.rows.forEach(r => {
                const row = document.createElement('tr');
                const tdLabel = document.createElement('td');
                tdLabel.innerText = r.label;
                tdLabel.style.fontWeight = "bold";
                row.appendChild(tdLabel);
                
                r.cols.forEach(colData => {
                    const td = document.createElement('td');
                    if (typeof colData === 'string') {
                        td.innerText = colData;
                    } else if (colData.type === 'select') {
                        const select = document.createElement('select');
                        select.className = 'modern-select table-select';
                        Object.entries(colData.options).forEach(([key, value]) => {
                            const opt = document.createElement('option');
                            opt.value = key;
                            opt.innerText = value;
                            select.appendChild(opt);
                        });
                        select.onchange = (e) => {
                            if(e.target.value) {
                                state[q.id] = e.target.value;
                            } else {
                                delete state[q.id];
                            }
                            checkCompletion();
                        };
                        td.appendChild(select);
                    }
                    row.appendChild(td);
                });
                tbody.appendChild(row);
            });
            table.appendChild(tbody);
            tableContainer.appendChild(table);
            card.appendChild(tableContainer);
        }
        
        const refLink = document.createElement('div');
        refLink.className = 'ref-link';
        refLink.innerHTML = `📖 Referencia: <a href="${q.url}" target="_blank">${q.ref}</a>`;
        card.appendChild(refLink);

        container.appendChild(card);
    });

    document.getElementById('btn-export').onclick = exportJSON;
}

function checkCompletion() {
    const isComplete = questions.every(q => state[q.id] !== undefined && state[q.id] !== "");
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
