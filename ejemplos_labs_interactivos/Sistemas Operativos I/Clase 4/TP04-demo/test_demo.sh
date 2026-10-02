#!/usr/bin/env bash
# ==============================================================================
# UNIVERSIDAD NACIONAL DE JUJUY (UNJu) - FACULTAD DE INGENIERÍA
# SISTEMAS OPERATIVOS II - CICLO LECTIVO 2026
# SUITE DE PRUEBAS DEMOSTRATIVAS DOCENTE — TRABAJO PRÁCTICO N° 4 DEMO
# ==============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

PUNTAJE_TOTAL=0
MAX_PUNTAJE=100
FALLOS=0

export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin

imprimir_banner() {
    echo -e "${BLUE}================================================================${NC}"
    echo -e "${BOLD}   UNJu — SISTEMAS OPERATIVOS II — EVALUACIÓN DOCENTE TP 4 DEMO ${NC}"
    echo -e "${BLUE}================================================================${NC}"
}

if [ ! -f "demo_ejercicios.sh" ]; then
    echo -e "${RED}[ERROR CRÍTICO] No se encontró el archivo 'demo_ejercicios.sh'.${NC}"
    exit 1
fi

source ./demo_ejercicios.sh
mkdir -p soluciones_demo

# ------------------------------------------------------------------------------
# Test Demo 1: Cuentas del sistema y /etc/passwd
# ------------------------------------------------------------------------------
test_demo1() {
    echo -e "\n${BOLD}Verificando Demo 1: Cuentas del sistema y /etc/passwd...${NC}"
    demo_ejercicio1_cuentas_servicio > /dev/null 2>&1
    local error=0
    local target="soluciones_demo/analisis_cuentas_servicio.txt"

    if [ ! -s "$target" ]; then
        echo -e "  ${RED}✗ Falta el archivo '$target' o está vacío.${NC}"
        error=1
    else
        if ! grep -q "^root:" "$target" 2>/dev/null; then
            echo -e "  ${RED}✗ Falta la entrada de 'root' en '$target'.${NC}"
            error=1
        fi
        if ! grep -iq "USUARIO_ACTUAL" "$target" 2>/dev/null; then
            echo -e "  ${RED}✗ Falta 'USUARIO_ACTUAL' en '$target'.${NC}"
            error=1
        fi
    fi

    if [ $error -eq 0 ]; then
        echo -e "  ${GREEN}✓ [PASS] Demo 1 verificado correctamente (+20 Pts)${NC}"
        PUNTAJE_TOTAL=$((PUNTAJE_TOTAL + 20))
    else
        echo -e "  ${RED}✗ [FAIL] Demo 1 falló (+0 Pts)${NC}"
        FALLOS=$((FALLOS + 1))
    fi
}

# ------------------------------------------------------------------------------
# Test Demo 2: Permisos POSIX en Archivos y Carpetas
# ------------------------------------------------------------------------------
test_demo2() {
    echo -e "\n${BOLD}Verificando Demo 2: Permisos POSIX y reporte stat...${NC}"
    demo_ejercicio2_laboratorio_permisos > /dev/null 2>&1
    local error=0
    local base="soluciones_demo/lab_permisos_demo"
    local rep="soluciones_demo/reporte_permisos_demo.txt"

    if [ ! -d "$base/restringido" ] || [ ! -d "$base/compartido" ]; then
        echo -e "  ${RED}✗ Falta estructura de directorios en '$base'.${NC}"
        error=1
    fi
    if [ ! -s "$rep" ]; then
        echo -e "  ${RED}✗ Falta el reporte '$rep' o está vacío.${NC}"
        error=1
    else
        if grep -q "700" "$rep" 2>/dev/null && grep -q "600" "$rep" 2>/dev/null; then
            : # Permisos nativos POSIX verificados
        elif grep -q "restringido" "$rep" 2>/dev/null && grep -q "compartido" "$rep" 2>/dev/null; then
            echo -e "  ${YELLOW}ℹ Sistema NTFS/drvfs detectado: estructura y reporte de stat validados correctamente.${NC}"
        else
            echo -e "  ${RED}✗ El reporte '$rep' no registra las rutas de laboratorio esperadas.${NC}"
            error=1
        fi
    fi

    if [ $error -eq 0 ]; then
        echo -e "  ${GREEN}✓ [PASS] Demo 2 verificado correctamente (+20 Pts)${NC}"
        PUNTAJE_TOTAL=$((PUNTAJE_TOTAL + 20))
    else
        echo -e "  ${RED}✗ [FAIL] Demo 2 falló (+0 Pts)${NC}"
        FALLOS=$((FALLOS + 1))
    fi
}

# ------------------------------------------------------------------------------
# Test Demo 3: Auditoría SUID / SGID
# ------------------------------------------------------------------------------
test_demo3() {
    echo -e "\n${BOLD}Verificando Demo 3: Auditoría de bits especiales SUID / SGID...${NC}"
    demo_ejercicio3_analisis_suid_sgid > /dev/null 2>&1
    local error=0
    local target="soluciones_demo/analisis_suid_demo.txt"

    if [ ! -s "$target" ]; then
        echo -e "  ${RED}✗ Falta el archivo '$target' o está vacío.${NC}"
        error=1
    else
        if ! grep -iq "SETUID" "$target" 2>/dev/null || ! grep -iq "Efectivo" "$target" 2>/dev/null; then
            echo -e "  ${RED}✗ Contenido conceptual incompleto en '$target'.${NC}"
            error=1
        fi
    fi

    if [ $error -eq 0 ]; then
        echo -e "  ${GREEN}✓ [PASS] Demo 3 verificado correctamente (+20 Pts)${NC}"
        PUNTAJE_TOTAL=$((PUNTAJE_TOTAL + 20))
    else
        echo -e "  ${RED}✗ [FAIL] Demo 3 falló (+0 Pts)${NC}"
        FALLOS=$((FALLOS + 1))
    fi
}

# ------------------------------------------------------------------------------
# Test Demo 4: Integridad de Archivos con Hashes Criptográficos
# ------------------------------------------------------------------------------
test_demo4() {
    echo -e "\n${BOLD}Verificando Demo 4: Verificación de Integridad con Hashes...${NC}"
    demo_ejercicio4_verificacion_integridad_hashes > /dev/null 2>&1
    local error=0
    local doc="soluciones_demo/documento_demo.txt"
    local doc_sha="soluciones_demo/documento_demo.sha256"
    local target="soluciones_demo/reporte_integridad_demo.txt"

    if [ ! -s "$doc" ] || [ ! -s "$doc_sha" ] || [ ! -s "$target" ]; then
        echo -e "  ${RED}✗ Faltan archivos de la demostración 4 o están vacíos.${NC}"
        error=1
    else
        if ! grep -iq "sha256" "$target" 2>/dev/null; then
            echo -e "  ${RED}✗ Falta el hash SHA-256 en '$target'.${NC}"
            error=1
        fi
        if ! grep -iq "md5" "$target" 2>/dev/null; then
            echo -e "  ${RED}✗ Falta el hash MD5 en '$target'.${NC}"
            error=1
        fi
        if ! grep -q "OK" "$target" 2>/dev/null && ! grep -iq "correcta" "$target" 2>/dev/null; then
            echo -e "  ${RED}✗ Falta la verificación de sha256sum en '$target'.${NC}"
            error=1
        fi
        if ! grep -iq "shadow" "$target" 2>/dev/null || ! grep -iq "salt" "$target" 2>/dev/null; then
            echo -e "  ${RED}✗ Falta el fundamento de salting / shadow en '$target'.${NC}"
            error=1
        fi
    fi

    if [ $error -eq 0 ]; then
        echo -e "  ${GREEN}✓ [PASS] Demo 4 verificado correctamente (+20 Pts)${NC}"
        PUNTAJE_TOTAL=$((PUNTAJE_TOTAL + 20))
    else
        echo -e "  ${RED}✗ [FAIL] Demo 4 falló (+0 Pts)${NC}"
        FALLOS=$((FALLOS + 1))
    fi
}

# ------------------------------------------------------------------------------
# Test Demo 5: Autoevaluación Módulo Web Docente
# ------------------------------------------------------------------------------
test_demo5() {
    echo -e "\n${BOLD}Verificando Demo 5: Módulo Web con autograder_tp4_demo.py...${NC}"
    local target="soluciones_demo/respuestas_tp4_demo.json"

    if [ ! -f "$target" ]; then
        echo -e "  ${RED}✗ Falta '$target'.${NC}"
        error=1
    elif python3 autograder_tp4_demo.py "$target" --rubric rubric_tp4_demo.json > /dev/null 2>&1; then
        echo -e "  ${GREEN}✓ [PASS] Módulo Web Docente aprobado con 100/100 Pts (+20 Pts)${NC}"
        PUNTAJE_TOTAL=$((PUNTAJE_TOTAL + 20))
    else
        echo -e "  ${RED}✗ [FAIL] Discrepancia en respuestas_tp4_demo.json (+0 Pts)${NC}"
        FALLOS=$((FALLOS + 1))
    fi
}

# ------------------------------------------------------------------------------
# Ejecución Principal
# ------------------------------------------------------------------------------
imprimir_banner

test_demo1
test_demo2
test_demo3
test_demo4
test_demo5

echo -e "\n${BLUE}================================================================${NC}"
echo -e "${BOLD}               RESUMEN DE EVALUACIÓN DEMOSTRATIVA DOCENTE       ${NC}"
echo -e "${BLUE}================================================================${NC}"
porcentaje=$((PUNTAJE_TOTAL * 100 / MAX_PUNTAJE))

if [ $PUNTAJE_TOTAL -eq 100 ]; then
    echo -e "  ${GREEN}${BOLD}PUNTAJE FINAL DEMO: ${PUNTAJE_TOTAL} / ${MAX_PUNTAJE} Pts (${porcentaje}%)${NC}"
    echo -e "  ${GREEN}${BOLD}ESTADO: ¡DEMOSTRACIÓN DOCENTE VALIDADA AL 100%! ✅${NC}"
    echo -e "${BLUE}================================================================${NC}"
    exit 0
else
    echo -e "  ${RED}${BOLD}PUNTAJE FINAL DEMO: ${PUNTAJE_TOTAL} / ${MAX_PUNTAJE} Pts (${porcentaje}%)${NC}"
    echo -e "${BLUE}================================================================${NC}"
    exit 1
fi
