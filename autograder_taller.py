import os
import sys
import json
import hashlib

def check_file_exists(filepath, points, name):
    if os.path.exists(filepath):
        print(f"✅ [+{points} pts] {name} encontrado.")
        return points
    else:
        print(f"❌ [0 pts] Falta {name} ({filepath}).")
        return 0

def check_directory_has_files(dirpath, points, name):
    if os.path.exists(dirpath) and os.path.isdir(dirpath) and len(os.listdir(dirpath)) > 0:
        print(f"✅ [+{points} pts] {name} encontrado y contiene archivos.")
        return points
    else:
        print(f"❌ [0 pts] Falta {name} o está vacío.")
        return 0

def evaluate_theory(resp_path, rubric_path, total_points):
    if not os.path.exists(resp_path):
        print(f"❌ [0 pts] Falta el archivo {resp_path}. ¡Recuerda completar el cuestionario en index.html!")
        return 0
    if not os.path.exists(rubric_path):
        return 0
    
    try:
        with open(resp_path, 'r', encoding='utf-8') as f:
            respuestas = json.load(f)
        with open(rubric_path, 'r', encoding='utf-8') as f:
            rubrica = json.load(f)
            
        salt = rubrica['metadata']['salt']
        hashes = rubrica['hashes']
        
        correct = 0
        total_q = len(hashes)
        for qid, expected_hash in hashes.items():
            ans = respuestas.get(qid, "")
            text = f"{qid}:{ans}:{salt}"
            computed = hashlib.sha256(text.encode()).hexdigest()
            if computed == expected_hash:
                correct += 1
            else:
                fb = rubrica.get("feedback", {}).get(qid, "")
                if fb:
                    print(f"❌ [Error en {qid}] 💡 Feedback: {fb}")
                else:
                    print(f"❌ [Error en {qid}] Respuesta incorrecta.")
                
        pts = int((correct / total_q) * total_points)
        print(f"✅ [+{pts} pts] Evaluación Teórica Web: {correct}/{total_q} respuestas correctas.")
        return pts
    except Exception as e:
        print(f"❌ [0 pts] Error evaluando teoría: {e}")
        return 0

def main():
    print("==================================================")
    print("🔍 INICIANDO AUTOEVALUACIÓN DEL DOCENTE")
    print("==================================================\n")
    
    score = 0
    
    print("--- DÍA 1: Fundamentos (Laboratorio Interactivo Web) ---")
    score += evaluate_theory("respuestas_taller.json", "rubric_taller.json", 20)

    print("\n--- DÍA 1: Estructura Base ---")
    score += check_file_exists("AGENTS.md", 10, "AGENTS.md (Reglas del Agente)")
    score += check_file_exists("MEMORY.md", 10, "MEMORY.md (Memoria del Proyecto)")
    score += check_file_exists("planificacion.md", 10, "planificacion.md (Programa Analítico)")
    score += check_directory_has_files("bibliografia", 10, "Carpeta /bibliografia con contenido")
    
    print("\n--- DÍA 2: Laboratorio Integrador ---")
    score += check_file_exists("Trabajo_Practico_1/rubrica.md", 20, "Rúbrica del Trabajo Práctico 1")
    score += check_file_exists("Trabajo_Practico_1/skill_evaluador.md", 20, "Skill Evaluador del Trabajo Práctico 1")
    
    print("\n==================================================")
    print(f"🏆 PUNTAJE TOTAL: {score} / 100")
    print("==================================================")
    
    summary_path = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary_path:
        with open(summary_path, "a", encoding="utf-8") as f:
            f.write(f"## 🏆 Puntaje Total: {score} / 100\n")
            if score == 100:
                f.write("🎉 **¡Felicidades!** Has completado con éxito todas las tareas del taller.\n")
            elif score >= 50:
                f.write("✅ **¡Muy bien!** Continúa avanzando con las tareas restantes.\n")
            else:
                f.write("⚠️ **Faltan tareas.** Revisa las instrucciones en el README.md o completa el formulario web.\n")
                
    if score < 40:
        sys.exit(1)
    else:
        sys.exit(0)

if __name__ == "__main__":
    main()
