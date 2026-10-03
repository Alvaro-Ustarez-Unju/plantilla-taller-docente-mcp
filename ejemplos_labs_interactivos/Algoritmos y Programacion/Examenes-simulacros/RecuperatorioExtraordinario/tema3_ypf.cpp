#include <iostream>
using namespace std;

int tanques = 0, capacidad = 0;

void ingresarDatos() {
    do {
        cout << "Ingrese cantidad de tanques operativos (1-15): "; cin >> tanques;
        if (tanques < 1 || tanques > 15) cout << "[Error] El valor debe estar entre 1 y 15.\n";
    } while (tanques < 1 || tanques > 15);
    do {
        cout << "Ingrese capacidad por tanque en m3 (200-5000): "; cin >> capacidad;
        if (capacidad < 200 || capacidad > 5000) cout << "[Error] El valor debe estar entre 200 y 5000.\n";
    } while (capacidad < 200 || capacidad > 5000);
}

void controlarMermas() {
    if (tanques == 0) { cout << "[Error] Primero debe ingresar los datos de la refineria.\n"; return; }
    double merma; double total = 0;
    do {
        cout << "Ingrese mermas detectadas en m3 (-1 para finalizar): "; cin >> merma;
        if (merma >= 0) total += merma;
        else if (merma != -1) cout << "[Error] Ingrese un valor positivo o -1 para finalizar.\n";
    } while (merma != -1);
    double esperado = tanques * capacidad;
    double porcentaje = total * 100 / esperado;
    cout << "Total mermas: " << total << " m3\n";
    cout << "Porcentaje de merma sobre volumen esperado (" << esperado << " m3): " << porcentaje << "%\n";
    if (porcentaje < 1.5) cout << "Estado de bombeo: OPTIMO\n";
    else if (porcentaje < 4) cout << "Estado de bombeo: ACEPTABLE\n";
    else cout << "Estado de bombeo: CRITICO\n";
}

void buscarMejorCaudal() {
    if (tanques == 0) { cout << "[Error] Primero debe ingresar los datos de la refineria.\n"; return; }
    double mayor = -1, caudal, liquidacion;
    int tanqueMejor = 0, volumen, volumenMejor = 0, horas;
    for (int i = 1; i <= tanques; i++) {
        cout << "--- Tanque " << i << " ---\n";
        cout << "Volumen despachado en tanque " << i << " (m3): "; cin >> volumen;
        do { cout << "Horas de bombeo del tanque " << i << ": "; cin >> horas; } while (horas <= 0);
        caudal = (double) volumen / horas;
        cout << "Caudal tanque " << i << ": " << caudal << " m3/h\n";
        if (caudal > mayor) { mayor = caudal; tanqueMejor = i; volumenMejor = volumen; }
    }
    liquidacion = volumenMejor * 850000.0 * 0.10;
    cout << "El mayor caudal fue " << mayor << " m3/h en el tanque " << tanqueMejor << ".\n";
    cout << "Liquidacion fiscal: $" << liquidacion << "\n";
}

int main() {
    int opc;
    do {
        cout << "\n=== REFINERIA YPF - CONTROL DE BOMBEO ===\n1. Ingresar Datos de Refineria\n2. Controlar Mermas en Bombeo\n3. Buscar Tanque con Mejor Caudal\n4. Ver Estado Actual\n0. Salir\nIngrese una opcion: ";
        cin >> opc;
        switch (opc) {
            case 1: ingresarDatos(); break;
            case 2: controlarMermas(); break;
            case 3: buscarMejorCaudal(); break;
            case 4: cout << "Tanques registrados: " << tanques << " | Capacidad por tanque: " << capacidad << " m3\n"; break;
            case 0: cout << "Fin del programa.\n"; break;
            default: cout << "[Error] Opcion invalida.\n";
        }
    } while (opc != 0);
    return 0;
}
