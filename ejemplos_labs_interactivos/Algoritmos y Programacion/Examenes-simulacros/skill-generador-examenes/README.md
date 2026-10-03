# 🛠️ Skill: Generador de Exámenes SDD de 3 Temas (AyP - Módulo 2)

Este módulo contiene la especificación, plantillas y directivas pedagógicas para generar exámenes estandarizados de **3 temas (Tema 1, Tema 2 y Tema 3)** para la cátedra de **Algoritmos y Programación (Módulo 2)** siguiendo la metodología **Spec-Driven Development (SDD)**.

---

## 📂 Ubicación del Skill en el Workspace

El skill se encuentra instalado y activo en dos ubicaciones complementarias:
1. **Registro Central de Agentes:** [`.agents/skills/ayp-examenes-sdd/SKILL.md`](file:///c:/Universidad/.agents/skills/ayp-examenes-sdd/SKILL.md)  
   Permite al asistente Antigravity invocarlo nativamente desde cualquier parte del proyecto.
2. **Carpeta de Exámenes:** [`skill-generador-examenes/SKILL.md`](file:///c:/Universidad/Algoritmos%20y%20Programaci%C3%B3n/modulo-2/Examenes/skill-generador-examenes/SKILL.md)  
   Para consulta local directa, referencia y acceso a plantillas.

---

## 📑 Archivos Incluidos

- [SKILL.md](file:///c:/Universidad/Algoritmos%20y%20Programaci%C3%B3n/modulo-2/Examenes/skill-generador-examenes/SKILL.md): Instrucciones completas del skill, criterios pedagógicos, reglas psicométricas anti-sesgo y arquitectura de entregables.
- [SDD_TEMPLATE.md](file:///c:/Universidad/Algoritmos%20y%20Programaci%C3%B3n/modulo-2/Examenes/skill-generador-examenes/SDD_TEMPLATE.md): Plantilla estandarizada de especificación técnica para los 3 temas antes de programar o maquetar.
- [TEMA_HTML_TEMPLATE.html](file:///c:/Universidad/Algoritmos%20y%20Programaci%C3%B3n/modulo-2/Examenes/skill-generador-examenes/TEMA_HTML_TEMPLATE.html): Plantilla web en Tailwind CSS con selector interactivo de casos de prueba y conmutador PSeInt / C++.

---

## 🔄 Flujo de Trabajo en 2 Fases (Spec-Driven Development)

### 📌 FASE 1: Generación del Documento `SDD.md`
Antes de generar código o HTML, se formula el documento de especificación en la carpeta de la nueva instancia (ej. `Examenes/3er-examen/SDD.md`):
1. Definir el **universo narrativo** común (ej. Empresas Nacionales, F1, Misión Satelital).
2. Especificar detalladamente los **3 temas (Tema 1, Tema 2 y Tema 3)**:
   - Entrada y validación de rangos numéricos.
   - Proceso 1: Centinela/umbral, acumulador, fórmula matemática y estados.
   - Proceso 2: Ciclo `Para`, métrica unitaria y búsqueda de extremo (Máximo o Mínimo) con identificador.
   - Parte 2: Algoritmo de prueba de escritorio, tabla de traza y salida esperada.
3. Verificar la **Matriz de Paridad Psicométrica** (idéntica complejidad ciclomática, misma cantidad de iteraciones y variables).
4. Diseñar los **3 Casos de Prueba** con entrada simulada y salida exacta por pantalla para cada tema (9 casos en total).

### 📌 FASE 2: Generación del Paquete de Examen
Una vez revisado y validado el `SDD.md`, se emite el paquete final:
1. `index.html`: Portal selector interactivo con tarjetas temáticas de los 3 temas.
2. `tema1.html`, `tema2.html`, `tema3.html`: Portales de examen interactivos con tooltips de rúbrica, tabs de casos y switch PSeInt / C++.
3. `resolucion-tema1.psc`, `resolucion-tema1.cpp`, `resolucion-tema2.psc`, `resolucion-tema2.cpp`, `resolucion-tema3.psc`, `resolucion-tema3.cpp`: Códigos modelo completos y testeados.
4. `rubrica.md`: Criterios estandarizados con niveles Excelente (100%), Aceptable (50%) e Insuficiente (0%).
5. `prueba_escritorio_imprimir.html`: Hojas de examen listas para imprimir (CSS print).
6. `prueba_escritorio_resuelto.html`: Clave de corrección docente con tablas de traza paso a paso.

---

## 💡 Cómo Solicitar un Nuevo Examen al Asistente

Puedes pedirle al asistente cosas como:

> *"Activa el skill ayp-examenes-sdd y crea el SDD.md para un nuevo examen con 3 temas ambientado en Misiones Espaciales / Satélites ARSAT en la carpeta 3er-examen"*

El asistente generará primero la especificación completa en `SDD.md` para tu revisión, y una vez que des tu conformidad, construirá los 10 archivos finales del paquete de examen.
