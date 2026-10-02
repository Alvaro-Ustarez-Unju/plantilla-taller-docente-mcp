/* ==========================================================================
   SISTEMAS OPERATIVOS II - UNJu - 2026
   MOTOR DE INTERACCIÓN, SIMULACIÓN Y EVALUACIÓN - TP N° 4 DEMO DOCENTE
   ========================================================================== */

(function () {
    'use strict';

    const TOTAL_ACADEMIC_ITEMS = 25;
    const STORAGE_KEY = 'soii_2026_tp4_demo_state';
    const THEME_KEY = 'soii_theme';

    // Estado inicial demostrativo docente
    const state = {
        estudiante: {
            nombre: 'Ing. Fabio Damián Argañaraz Azua',
            legajo: 'DOC-2026-SOII',
            github: 'Catedra-SOII-UNJu',
            timestamp: ''
        },
        seccion1_conceptos: {
            q1_proteccion_vs_seguridad: 'C',
            q2_metas_amenazas: 'A',
            q3_modelo_virus_das: 'B',
            q4_factores_autenticacion: 'C',
            q5_politicas_firewall: 'D'
        },
        seccion2_switches: {
            sw1_control_acceso_posix: 'MECANISMO_PROTECCION',
            sw2_ataque_escucha: 'ATAQUE_PASIVO',
            sw3_algoritmo_aes: 'CIFRADO_SIMETRICO',
            sw4_algoritmo_rsa: 'CIFRADO_ASIMETRICO',
            sw5_tarjeta_chip: 'ALGO_QUE_TIENE',
            sw6_firewall_default_deny: 'POLITICA_RESTRICTIVA'
        },
        seccion3_laboratorio_rsa: {
            sim_modulo_n: '91',
            sim_euler_phi: '72',
            sim_clave_privada_d: '29',
            sim_criptograma_m69: '62'
        },
        seccion4_login_linux: {
            orden_login_linux: [
                'LOGIN_PROMPT',
                'HASH_FUNCTION',
                'SHADOW_VERIFY',
                'UID_GID_LOOKUP',
                'SHELL_EXEC',
                'CHILD_INHERIT'
            ]
        },
        seccion5_permisos_suid: {
            permisos_etc_passwd: '644',
            permisos_etc_shadow: '640',
            permisos_bin_passwd: '4755',
            proposito_setuid: 'ADOPTAR_UID_PROPIETARIO_TEMPORALMENTE'
        }
    };

    let confettiTriggered = false;

    // Elementos del DOM
    const dom = {
        themeToggle: document.getElementById('btn-theme-toggle'),
        progressFill: document.getElementById('progress-fill'),
        progressLabel: document.getElementById('progress-label'),
        btnDownloadTop: document.getElementById('btn-download-json'),
        btnDownloadFooter: document.getElementById('btn-download-json-footer'),
        btnImport: document.getElementById('btn-import-json'),
        fileInput: document.getElementById('file-import-input'),
        toast: document.getElementById('toast-notify'),
        toastMsg: document.getElementById('toast-msg'),
        toastIcon: document.getElementById('toast-icon'),
        
        // Estudiante / Docente
        inputNombre: document.getElementById('alumno-nombre'),
        inputLegajo: document.getElementById('alumno-legajo'),
        inputGithub: document.getElementById('alumno-github'),

        // Drag and Drop
        actionBank: document.getElementById('dnd-action-bank'),
        btnResetDnd: document.getElementById('btn-reset-dnd'),
        slotsGrid: document.getElementById('dnd-slots-grid'),

        // POSIX Matrix
        chkSuid: document.getElementById('chk-suid'),
        chkSgid: document.getElementById('chk-sgid'),
        chkSticky: document.getElementById('chk-sticky'),
        chkUR: document.getElementById('chk-u-r'),
        chkUW: document.getElementById('chk-u-w'),
        chkUX: document.getElementById('chk-u-x'),
        chkGR: document.getElementById('chk-g-r'),
        chkGW: document.getElementById('chk-g-w'),
        chkGX: document.getElementById('chk-g-x'),
        chkOR: document.getElementById('chk-o-r'),
        chkOW: document.getElementById('chk-o-w'),
        chkOX: document.getElementById('chk-o-x'),
        dispSym: document.getElementById('disp-sym'),
        dispOct: document.getElementById('disp-oct'),
        dispSyscall: document.getElementById('disp-syscall')
    };

    // Inicialización
    document.addEventListener('DOMContentLoaded', () => {
        initTheme();
        initPosixCalculator();
        initDnd();
        bindEvents();
        loadSavedStateOrPreload();
        updateProgress();
    });

    function initTheme() {
        const savedTheme = localStorage.getItem(THEME_KEY) || 'dark';
        document.documentElement.setAttribute('data-theme', savedTheme);
        dom.themeToggle.addEventListener('click', () => {
            const current = document.documentElement.getAttribute('data-theme');
            const next = current === 'dark' ? 'light' : 'dark';
            document.documentElement.setAttribute('data-theme', next);
            localStorage.setItem(THEME_KEY, next);
        });
    }

    function showToast(msg, icon = 'ℹ️', duration = 3000) {
        if (!dom.toast) return;
        dom.toastMsg.textContent = msg;
        dom.toastIcon.textContent = icon;
        dom.toast.classList.add('show');
        setTimeout(() => {
            dom.toast.classList.remove('show');
        }, duration);
    }

    function bindEvents() {
        // Docente
        [dom.inputNombre, dom.inputLegajo, dom.inputGithub].forEach(input => {
            if (input) {
                input.addEventListener('input', () => {
                    state.estudiante.nombre = dom.inputNombre.value.trim();
                    state.estudiante.legajo = dom.inputLegajo.value.trim();
                    state.estudiante.github = dom.inputGithub.value.trim();
                    saveState();
                    updateProgress();
                });
            }
        });

        // Sección 1: Radio Cards
        document.querySelectorAll('.question-block').forEach(block => {
            const qid = block.dataset.qid;
            const radios = block.querySelectorAll('input[type="radio"]');
            radios.forEach(radio => {
                radio.addEventListener('change', () => {
                    radios.forEach(r => r.closest('.radio-card').classList.remove('selected'));
                    if (radio.checked) {
                        radio.closest('.radio-card').classList.add('selected');
                        state.seccion1_conceptos[qid] = radio.value;
                        saveState();
                        updateProgress();
                    }
                });
            });
        });

        // Sección 2: Switches
        document.querySelectorAll('.switch-item').forEach(item => {
            const swid = item.dataset.swid;
            const btns = item.querySelectorAll('.segment-btn');
            btns.forEach(btn => {
                btn.addEventListener('click', () => {
                    btns.forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');
                    state.seccion2_switches[swid] = btn.dataset.val;
                    saveState();
                    updateProgress();
                });
            });
        });

        // Sección 3: RSA
        ['sim_modulo_n', 'sim_euler_phi', 'sim_clave_privada_d', 'sim_criptograma_m69'].forEach(id => {
            const el = document.getElementById(id);
            if (el) {
                el.addEventListener('change', () => {
                    state.seccion3_laboratorio_rsa[id] = el.value;
                    saveState();
                    updateProgress();
                });
            }
        });

        // Sección 5: Permisos
        ['permisos_etc_passwd', 'permisos_etc_shadow', 'permisos_bin_passwd', 'proposito_setuid'].forEach(id => {
            const el = document.getElementById(id);
            if (el) {
                el.addEventListener('change', () => {
                    state.seccion5_permisos_suid[id] = el.value;
                    saveState();
                    updateProgress();
                });
            }
        });

        // Exportación JSON
        [dom.btnDownloadTop, dom.btnDownloadFooter].forEach(btn => {
            if (btn) btn.addEventListener('click', exportJSON);
        });

        // Importación JSON
        if (dom.btnImport) dom.btnImport.addEventListener('click', () => dom.fileInput.click());
        if (dom.fileInput) dom.fileInput.addEventListener('change', handleImportJSON);

        // Reset DnD
        if (dom.btnResetDnd) dom.btnResetDnd.addEventListener('click', resetDnd);
    }

    function initPosixCalculator() {
        const checkboxes = [
            dom.chkSuid, dom.chkSgid, dom.chkSticky,
            dom.chkUR, dom.chkUW, dom.chkUX,
            dom.chkGR, dom.chkGW, dom.chkGX,
            dom.chkOR, dom.chkOW, dom.chkOX
        ];

        checkboxes.forEach(chk => {
            if (chk) chk.addEventListener('change', updatePosixDisplay);
        });

        updatePosixDisplay();
    }

    function updatePosixDisplay() {
        let sOctal = 0;
        if (dom.chkSuid && dom.chkSuid.checked) sOctal += 4;
        if (dom.chkSgid && dom.chkSgid.checked) sOctal += 2;
        if (dom.chkSticky && dom.chkSticky.checked) sOctal += 1;

        let uOctal = 0;
        if (dom.chkUR && dom.chkUR.checked) uOctal += 4;
        if (dom.chkUW && dom.chkUW.checked) uOctal += 2;
        if (dom.chkUX && dom.chkUX.checked) uOctal += 1;

        let gOctal = 0;
        if (dom.chkGR && dom.chkGR.checked) gOctal += 4;
        if (dom.chkGW && dom.chkGW.checked) gOctal += 2;
        if (dom.chkGX && dom.chkGX.checked) gOctal += 1;

        let oOctal = 0;
        if (dom.chkOR && dom.chkOR.checked) oOctal += 4;
        if (dom.chkOW && dom.chkOW.checked) oOctal += 2;
        if (dom.chkOX && dom.chkOX.checked) oOctal += 1;

        const octalString = `${sOctal}${uOctal}${gOctal}${oOctal}`;

        let sym = '-';
        sym += (dom.chkUR && dom.chkUR.checked) ? 'r' : '-';
        sym += (dom.chkUW && dom.chkUW.checked) ? 'w' : '-';
        if (dom.chkSuid && dom.chkSuid.checked) {
            sym += (dom.chkUX && dom.chkUX.checked) ? 's' : 'S';
        } else {
            sym += (dom.chkUX && dom.chkUX.checked) ? 'x' : '-';
        }

        sym += (dom.chkGR && dom.chkGR.checked) ? 'r' : '-';
        sym += (dom.chkGW && dom.chkGW.checked) ? 'w' : '-';
        if (dom.chkSgid && dom.chkSgid.checked) {
            sym += (dom.chkGX && dom.chkGX.checked) ? 's' : 'S';
        } else {
            sym += (dom.chkGX && dom.chkGX.checked) ? 'x' : '-';
        }

        sym += (dom.chkOR && dom.chkOR.checked) ? 'r' : '-';
        sym += (dom.chkOW && dom.chkOW.checked) ? 'w' : '-';
        if (dom.chkSticky && dom.chkSticky.checked) {
            sym += (dom.chkOX && dom.chkOX.checked) ? 't' : 'T';
        } else {
            sym += (dom.chkOX && dom.chkOX.checked) ? 'x' : '-';
        }

        if (dom.dispSym) dom.dispSym.textContent = sym;
        if (dom.dispOct) dom.dispOct.textContent = octalString;
        if (dom.dispSyscall) dom.dispSyscall.textContent = `chmod(path, 0${octalString})`;
    }

    function initDnd() {
        if (typeof Sortable !== 'undefined' && dom.actionBank) {
            new Sortable(dom.actionBank, {
                group: 'shared-login',
                animation: 150,
                ghostClass: 'sortable-ghost',
                onEnd: syncDndState
            });

            document.querySelectorAll('.slot-dropzone').forEach(zone => {
                new Sortable(zone, {
                    group: 'shared-login',
                    max: 1,
                    animation: 150,
                    ghostClass: 'sortable-ghost',
                    onAdd: (evt) => {
                        if (zone.children.length > 1) {
                            const extra = evt.item === zone.children[0] ? zone.children[1] : zone.children[0];
                            dom.actionBank.appendChild(extra);
                        }
                        syncDndState();
                    },
                    onRemove: syncDndState
                });
            });
        }

        if (dom.actionBank) {
            dom.actionBank.addEventListener('click', (e) => {
                const chip = e.target.closest('.dnd-chip');
                if (!chip) return;
                const freeZone = Array.from(document.querySelectorAll('.slot-dropzone')).find(z => z.children.length === 0);
                if (freeZone) {
                    freeZone.appendChild(chip);
                    syncDndState();
                }
            });
        }

        document.querySelectorAll('.slot-dropzone').forEach(zone => {
            zone.addEventListener('click', (e) => {
                const chip = e.target.closest('.dnd-chip');
                if (chip) {
                    dom.actionBank.appendChild(chip);
                    syncDndState();
                }
            });
        });
    }

    function syncDndState() {
        const order = [];
        document.querySelectorAll('.slot-dropzone').forEach((zone, idx) => {
            const chip = zone.querySelector('.dnd-chip');
            if (chip && chip.dataset.token) {
                order[idx] = chip.dataset.token;
            }
        });
        state.seccion4_login_linux.orden_login_linux = order;
        saveState();
        updateProgress();
    }

    function resetDnd() {
        document.querySelectorAll('.slot-dropzone .dnd-chip').forEach(chip => {
            dom.actionBank.appendChild(chip);
        });
        syncDndState();
        showToast('Tablero reiniciado', '🔄');
    }

    function updateProgress() {
        let completed = 0;

        Object.values(state.seccion1_conceptos).forEach(val => {
            if (val && val.trim() !== '') completed++;
        });

        Object.values(state.seccion2_switches).forEach(val => {
            if (val && val.trim() !== '') completed++;
        });

        Object.values(state.seccion3_laboratorio_rsa).forEach(val => {
            if (val && val.trim() !== '') completed++;
        });

        const dndList = state.seccion4_login_linux.orden_login_linux || [];
        for (let i = 0; i < 6; i++) {
            if (dndList[i]) completed++;
        }

        Object.values(state.seccion5_permisos_suid).forEach(val => {
            if (val && val.trim() !== '') completed++;
        });

        const pct = Math.min(100, Math.round((completed / TOTAL_ACADEMIC_ITEMS) * 100));

        if (dom.progressFill) dom.progressFill.style.width = `${pct}%`;
        if (dom.progressLabel) dom.progressLabel.textContent = `${pct}% (${completed}/${TOTAL_ACADEMIC_ITEMS})`;

        const hasNombre = Boolean(state.estudiante.nombre && state.estudiante.nombre.trim().length > 3);
        const hasLegajo = Boolean(state.estudiante.legajo && state.estudiante.legajo.trim().length > 2);
        const isAcademicComplete = (completed === TOTAL_ACADEMIC_ITEMS);
        const canDownload = isAcademicComplete && hasNombre && hasLegajo;

        [dom.btnDownloadTop, dom.btnDownloadFooter].forEach(btn => {
            if (btn) btn.disabled = !canDownload;
        });

        if (isAcademicComplete && !confettiTriggered) {
            confettiTriggered = true;
            triggerConfetti();
        }
    }

    function triggerConfetti() {
        if (typeof confetti === 'function') {
            confetti({
                particleCount: 100,
                spread: 70,
                origin: { y: 0.6 }
            });
        }
    }

    function saveState() {
        try {
            state.estudiante.timestamp = new Date().toISOString();
            localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
        } catch (e) {
            console.error('Error al guardar estado:', e);
        }
    }

    function loadSavedStateOrPreload() {
        try {
            const raw = localStorage.getItem(STORAGE_KEY);
            if (raw) {
                const saved = JSON.parse(raw);
                restoreState(saved);
            } else {
                // Precarga demostrativa en TP04-demo
                restoreState(state);
            }
        } catch (e) {
            restoreState(state);
        }
    }

    function restoreState(data) {
        if (!data) return;

        if (data.estudiante) {
            state.estudiante = { ...state.estudiante, ...data.estudiante };
            if (dom.inputNombre) dom.inputNombre.value = state.estudiante.nombre || '';
            if (dom.inputLegajo) dom.inputLegajo.value = state.estudiante.legajo || '';
            if (dom.inputGithub) dom.inputGithub.value = state.estudiante.github || '';
        }

        if (data.seccion1_conceptos) {
            state.seccion1_conceptos = { ...state.seccion1_conceptos, ...data.seccion1_conceptos };
            Object.entries(state.seccion1_conceptos).forEach(([qid, val]) => {
                if (val) {
                    const radio = document.querySelector(`input[name="${qid}"][value="${val}"]`);
                    if (radio) {
                        radio.checked = true;
                        radio.closest('.radio-card')?.classList.add('selected');
                    }
                }
            });
        }

        if (data.seccion2_switches) {
            state.seccion2_switches = { ...state.seccion2_switches, ...data.seccion2_switches };
            Object.entries(state.seccion2_switches).forEach(([swid, val]) => {
                if (val) {
                    const item = document.querySelector(`.switch-item[data-swid="${swid}"]`);
                    if (item) {
                        const btn = item.querySelector(`.segment-btn[data-val="${val}"]`);
                        if (btn) {
                            item.querySelectorAll('.segment-btn').forEach(b => b.classList.remove('active'));
                            btn.classList.add('active');
                        }
                    }
                }
            });
        }

        if (data.seccion3_laboratorio_rsa) {
            state.seccion3_laboratorio_rsa = { ...state.seccion3_laboratorio_rsa, ...data.seccion3_laboratorio_rsa };
            Object.entries(state.seccion3_laboratorio_rsa).forEach(([id, val]) => {
                const el = document.getElementById(id);
                if (el && val) el.value = val;
            });
        }

        if (data.seccion4_login_linux && Array.isArray(data.seccion4_login_linux.orden_login_linux)) {
            const list = data.seccion4_login_linux.orden_login_linux;
            state.seccion4_login_linux.orden_login_linux = list;
            list.forEach((token, idx) => {
                if (token) {
                    const chip = document.querySelector(`.dnd-chip[data-token="${token}"]`);
                    const zone = document.querySelector(`.slot-dropzone[data-pos="${idx}"]`);
                    if (chip && zone) {
                        zone.appendChild(chip);
                    }
                }
            });
        }

        if (data.seccion5_permisos_suid) {
            state.seccion5_permisos_suid = { ...state.seccion5_permisos_suid, ...data.seccion5_permisos_suid };
            Object.entries(state.seccion5_permisos_suid).forEach(([id, val]) => {
                const el = document.getElementById(id);
                if (el && val) el.value = val;
            });
        }

        updateProgress();
    }

    function exportJSON() {
        state.estudiante.timestamp = new Date().toISOString();
        const jsonStr = JSON.stringify(state, null, 2);
        const blob = new Blob([jsonStr], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'respuestas_tp4_demo.json';
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        showToast('Archivo respuestas_tp4_demo.json generado con éxito', '📥');
    }

    function handleImportJSON(event) {
        const file = event.target.files[0];
        if (!file) return;

        const reader = new FileReader();
        reader.onload = (e) => {
            try {
                const parsed = JSON.parse(e.target.result);
                restoreState(parsed);
                saveState();
                showToast('Respuestas cargadas exitosamente', '✅');
            } catch (err) {
                showToast('Error: archivo JSON inválido', '❌');
            }
        };
        reader.readAsText(file);
        event.target.value = '';
    }

})();
