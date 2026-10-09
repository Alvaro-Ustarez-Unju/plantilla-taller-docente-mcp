#include <iostream>
#include <string>
using namespace std;

int stock = 0, stockInicial = 0, operarios = 0;

void ingresarDatos() {
    do {
        cout << "Ingrese stock inicial de barriles (100-4000): "; cin >> stockInicial;
        if (stockInicial < 100 || stockInicial > 4000) cout << "[Error] El valor debe estar entre 100 y 4000.\n";
    } while (stockInicial < 100 || stockInicial > 4000);
    stock = stockInicial;
    do {
        cout << "Ingrese cantidad de operarios de etiquetado (2-12): "; cin >> operarios;
        if (operarios < 2 || operarios > 12) cout << "[Error] El valor debe estar entre 2 y 12.\n";
    } while (operarios < 2 || operarios > 12);
}

void procesarDespacho() {
    if (stockInicial == 0) { cout << "[Error] Primero debe ingresar los datos de la planta.\n"; return; }
    int despacho;
    while (stock >= 50) {
        cout << "Ingrese barriles a despachar: "; cin >> despacho;
        if (despacho <= 0) cout << "[Error] La cantidad debe ser mayor a cero.\n";
        else if (despacho > stock) cout << "[Error] No hay suficiente stock. Stock actual: " << stock << "\n";
        else { stock -= despacho; cout << "Stock restante: " << stock << " barriles\n"; }
    }
    double porcentaje = (stockInicial - stock) * 100.0 / stockInicial;
    cout << "[Alerta] El stock bajo del umbral de 50 barriles.\n";
    cout << "Porcentaje consumido sobre stock inicial: " << porcentaje << "%\n";
    if (porcentaje > 75) cout << "REPOSICION URGENTE: ALERTA DE STOCK\n";
    else cout << "Stock dentro de parametros\n";
}

void buscarMejorOperario() {
    if (operarios == 0) { cout << "[Error] Primero debe ingresar los datos de la planta.\n"; return; }
    string nombre, mejor;
    int tiempo, menor = 999999;
    for (int i = 1; i <= operarios; i++) {
        cout << "Nombre del operario " << i << ": "; cin >> nombre;
        do { cout << "Tiempo de etiquetado de " << nombre << " (seg): "; cin >> tiempo; } while (tiempo <= 0);
        if (tiempo < menor) { menor = tiempo; mejor = nombre; }
    }
    cout << "El mejor tiempo fue de " << mejor << " con " << menor << " segundos.\n";
    cout << "Bonificacion otorgada: $" << stock * 45000.0 * 0.03 << "\n";
}

int main() {
    int opc;
    do {
        cout << "\n=== CERVECERIA QUILMES - PLANTA DE ENVASADO ===\n1. Ingresar Datos de Planta\n2. Procesar Despacho de Barriles\n3. Buscar Mejor Operario y Bonificacion\n4. Ver Estado Actual\n0. Salir\nIngrese una opcion: ";
        cin >> opc;
        switch (opc) {
            case 1: ingresarDatos(); break;
            case 2: procesarDespacho(); break;
            case 3: buscarMejorOperario(); break;
            case 4: cout << "Stock registrado: " << stock << " barriles | Operarios: " << operarios << "\n"; break;
            case 0: cout << "Fin del programa.\n"; break;
            default: cout << "[Error] Opcion invalida.\n";
        }
    } while (opc != 0);
    return 0;
}
