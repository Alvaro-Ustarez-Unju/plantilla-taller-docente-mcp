#include <iostream>
using namespace std;

int silos = 0, capacidad = 0;

void ingresarDatos() {
    do {
        cout << "Ingrese cantidad de silos de acopio (1-10): "; cin >> silos;
        if (silos < 1 || silos > 10) cout << "[Error] El valor debe estar entre 1 y 10.\n";
    } while (silos < 1 || silos > 10);
    do {
        cout << "Ingrese capacidad por silo en litros (1000-30000): "; cin >> capacidad;
        if (capacidad < 1000 || capacidad > 30000) cout << "[Error] El valor debe estar entre 1000 y 30000.\n";
    } while (capacidad < 1000 || capacidad > 30000);
}

void controlarPasteurizacion() {
    if (silos == 0) { cout << "[Error] Primero debe ingresar los datos de acopio.\n"; return; }
    double descarte, total = 0;
    do {
        cout << "Ingrese litros descartados por control de acidez (-1 para finalizar): "; cin >> descarte;
        if (descarte >= 0) total += descarte;
        else if (descarte != -1) cout << "[Error] Ingrese un valor positivo o -1 para finalizar.\n";
    } while (descarte != -1);
    double esperado = silos * capacidad, porcentaje = total * 100 / esperado;
    cout << "Total descartado: " << total << " litros\n";
    cout << "Porcentaje de descarte sobre produccion esperada (" << esperado << " litros): " << porcentaje << "%\n";
    if (porcentaje < 1) cout << "Calidad: PREMIUM - APTO EXPORTACION\n";
    else if (porcentaje < 3) cout << "Calidad: ESTANDAR\n";
    else cout << "Calidad: FUERA DE NORMA - AUDITORIA URGENTE\n";
}

void buscarMejorSilo() {
    if (silos == 0) { cout << "[Error] Primero debe ingresar los datos de acopio.\n"; return; }
    int siloMejor = 0; double mayor = -1, tenor, litros, litrosMejor = 0;
    for (int i = 1; i <= silos; i++) {
        cout << "--- Silo " << i << " ---\n";
        cout << "Litros procesados en silo " << i << ": "; cin >> litros;
        cout << "Tenor graso del silo " << i << " (g/L): "; cin >> tenor;
        if (tenor > mayor) { mayor = tenor; siloMejor = i; litrosMejor = litros; }
    }
    cout << "El mayor tenor graso fue " << mayor << " g/L en el silo " << siloMejor << ".\n";
    cout << "Premio al tambo del silo " << siloMejor << ": $" << litrosMejor * 720 * 0.08 << "\n";
}

int main() {
    int opc;
    do {
        cout << "\n=== USINA LACTEA LA SERENISIMA ===\n1. Ingresar Datos de Acopio\n2. Controlar Perdidas en Pasteurizacion\n3. Buscar Silo con Mejor Tenor Graso\n4. Ver Estado Actual\n0. Salir\nIngrese una opcion: ";
        cin >> opc;
        switch (opc) {
            case 1: ingresarDatos(); break;
            case 2: controlarPasteurizacion(); break;
            case 3: buscarMejorSilo(); break;
            case 4: cout << "Silos registrados: " << silos << " | Capacidad por silo: " << capacidad << " litros\n"; break;
            case 0: cout << "Fin del programa.\n"; break;
            default: cout << "[Error] Opcion invalida.\n";
        }
    } while (opc != 0);
    return 0;
}
