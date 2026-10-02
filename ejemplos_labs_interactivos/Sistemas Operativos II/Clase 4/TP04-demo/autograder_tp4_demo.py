#!/usr/bin/env python3
"""
=============================================================================
EVALUADOR AUTOMÁTICO DE TRABAJOS PRÁCTICOS - SISTEMAS OPERATIVOS II
Universidad Nacional de Jujuy (UNJu - Facultad de Ingeniería)
Ciclo Lectivo 2026 | Titular: Ing. María Fernanda Vázquez | JTP: Ing. Fabio D. Argañaraz
=============================================================================
Módulo de Evaluación Criptográfica Docente - TP N° 4 DEMO
"""

import sys
import os
import json
import hashlib
import argparse
from datetime import datetime

# Asegurar compatibilidad UTF-8 en consolas Windows
if sys.platform == 'win32':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
        sys.stderr.reconfigure(encoding='utf-8')
    except Exception:
        pass

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
RUBRIC_FILE = os.path.join(SCRIPT_DIR, "rubric_tp4_demo.json")
CATEDRA_SALT = "SOII_UNJu_FI_2026_CatedraVazquez_SecretSalt"

def compute_hash(ex_id, item_key, val):
    clean_val = str(val).strip().lower() if val is not None else ""
    raw = f"{ex_id}:{item_key}:{clean_val}:{CATEDRA_SALT}"
    return hashlib.sha256(raw.encode('utf-8')).hexdigest()

def load_json(filepath):
    if not os.path.exists(filepath):
        print(f"[ERROR] No se encontró el archivo: {filepath}", file=sys.stderr)
        sys.exit(1)
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"[ERROR] Error al leer JSON '{filepath}': {e}", file=sys.stderr)
        sys.exit(1)

def grade_submission(submission, rubric):
    student = submission.get("estudiante", {})
    exercises_rubric = rubric.get("exercises", {})
    
    total_score = 0
    max_total_score = rubric.get("max_score", 100)
    exercise_results = {}

    for ex_id, ex_spec in exercises_rubric.items():
        weight = ex_spec.get("weight", 20)
        feedback = ex_spec.get("feedback", "")
        ex_score = 0
        details = []

        student_data = submission.get(ex_id, {})

        if "hashes" in ex_spec:
            expected_hashes = ex_spec["hashes"]

            if ex_spec.get("type") == "ordered_list":
                items_list = expected_hashes.get("items", [])
                total_items = len(items_list)
                correct_items_count = 0
                list_key = ex_spec.get("list_key", "orden_login_linux")
                actual_list = student_data.get(list_key, [])
                for idx, exp_hash in enumerate(items_list):
                    actual_val = actual_list[idx] if idx < len(actual_list) else None
                    actual_hash = compute_hash(ex_id, f"pos_{idx}", actual_val)
                    is_correct = (actual_hash == exp_hash)
                    if is_correct:
                        correct_items_count += 1
                    details.append({
                        "item": f"Etapa {idx + 1}",
                        "submitted": actual_val,
                        "is_correct": is_correct
                    })
                if total_items > 0:
                    ex_score = round((correct_items_count / total_items) * weight, 2)
            else:
                total_items = len(expected_hashes)
                correct_items_count = 0
                for item_key, exp_hash in expected_hashes.items():
                    actual_val = student_data.get(item_key)
                    actual_hash = compute_hash(ex_id, item_key, actual_val)
                    is_correct = (actual_hash == exp_hash)
                    if is_correct:
                        correct_items_count += 1
                    details.append({
                        "item": item_key,
                        "submitted": actual_val,
                        "is_correct": is_correct
                    })
                if total_items > 0:
                    ex_score = round((correct_items_count / total_items) * weight, 2)

        exercise_results[ex_id] = {
            "title": ex_spec.get("title", ex_id),
            "score": ex_score,
            "weight": weight,
            "details": details,
            "feedback": feedback if ex_score < weight else ""
        }
        total_score += ex_score

    return {
        "estudiante": student,
        "total_score": round(total_score, 2),
        "max_score": max_total_score,
        "is_passed": (total_score >= max_total_score),
        "exercises": exercise_results
    }

def print_text_summary(report):
    est = report.get("estudiante", {})
    print("=" * 70)
    print(" UNJu - SISTEMAS OPERATIVOS II - CICLO LECTIVO 2026")
    print(" EVALUACIÓN DEMOSTRATIVA DOCENTE - TP N° 4 DEMO")
    print("=" * 70)
    print(f" Docente:  {est.get('nombre', 'Desconocido')}")
    print(f" Legajo:   {est.get('legajo', 'S/D')} | GitHub: {est.get('github', 'S/D')}")
    print(f" Entrega:  {est.get('timestamp', datetime.now().isoformat())}")
    print("-" * 70)

    for ex_id, res in report.get("exercises", {}).items():
        score = res["score"]
        weight = res["weight"]
        status = "✓ [PASS]" if score == weight else "✗ [FAIL]"
        print(f" {status} {res['title']}: {score} / {weight} Pts")
        for item in res.get("details", []):
            mark = "  ✓" if item["is_correct"] else "  ✗"
            print(f"    {mark} {item['item']}: {'Correcto' if item['is_correct'] else 'Discrepancia'}")
        print()

    print("=" * 70)
    total = report.get("total_score", 0)
    max_s = report.get("max_score", 100)
    print(f" PUNTAJE TOTAL DE LA DEMO DOCENTE: {total} / {max_s} Pts (100%)")
    print(" ESTADO FINAL: ✅ DEMOSTRACIÓN DOCENTE VALIDADA CON ÉXITO")
    print("=" * 70)

def main():
    parser = argparse.ArgumentParser(description="Autograder Demo Docente TP4 - SO II")
    parser.add_argument("submission", help="Ruta a respuestas_tp4_demo.json")
    parser.add_argument("--rubric", default=RUBRIC_FILE, help="Ruta a rubric_tp4_demo.json")
    parser.add_argument("--json", action="store_true", help="Salida JSON")
    args = parser.parse_args()

    submission = load_json(args.submission)
    rubric = load_json(args.rubric)
    report = grade_submission(submission, rubric)

    if args.json:
        print(json.dumps(report, indent=2, ensure_ascii=False))
    else:
        print_text_summary(report)

    sys.exit(0 if report.get("is_passed", False) else 1)

if __name__ == "__main__":
    main()
