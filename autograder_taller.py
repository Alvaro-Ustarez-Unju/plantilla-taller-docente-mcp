import os
import sys

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

def main():
    print("==================================================")
    print("🔍 INICIANDO AUTOEVALUACIÓN DEL DOCENTE")
    print("==================================================\n")
    
    score = 0
    
    print("--- DÍA 1: Estructura Base ---")
    score += check_file_exists("AGENTS.md", 15, "AGENTS.md (Reglas del Agente)")
    score += check_file_exists("MEMORY.md", 15, "MEMORY.md (Memoria del Proyecto)")
    score += check_file_exists("planificacion.md", 10, "planificacion.md (Programa Analítico)")
    score += check_directory_has_files("bibliografia", 10, "Carpeta /bibliografia con contenido")
    
    print("\n--- DÍA 2: Laboratorio Integrador ---")
    score += check_file_exists("Trabajo_Practico_1/rubrica.md", 25, "Rúbrica del Trabajo Práctico 1")
    score += check_file_exists("Trabajo_Practico_1/skill_evaluador.md", 25, "Skill Evaluador del Trabajo Práctico 1")
    
    print("\n==================================================")
    print(f"🏆 PUNTAJE TOTAL: {score} / 100")
    print("==================================================")
    
    # Escribir el resumen en GitHub Step Summary
    summary_path = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary_path:
        with open(summary_path, "a", encoding="utf-8") as f:
            f.write(f"## 🏆 Puntaje Total: {score} / 100\n")
            if score == 100:
                f.write("🎉 **¡Felicidades!** Has completado con éxito todas las tareas del taller.\n")
            elif score >= 50:
                f.write("✅ **¡Muy bien!** Has completado las tareas del Día 1. Continúa con el Día 2.\n")
            else:
                f.write("⚠️ **Faltan tareas.** Revisa las instrucciones en el README.md.\n")
                
    if score < 50:
        sys.exit(1) # Falla el Action si no hizo ni lo básico del Día 1
    else:
        sys.exit(0)

if __name__ == "__main__":
    main()
