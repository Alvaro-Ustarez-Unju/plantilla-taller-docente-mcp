#include <iostream>
#include <iomanip>

using namespace std;

const int CAPACIDAD = 15;

// Prototipos de funciones
void MostrarMenu(int &opc);
void RegistrarDonacion(float arr[], int &tam, int capacidad);
void ListarDonaciones(const float arr[], int tam, float umbralDestacado);
int BuscarDonacion(const float arr[], int tam, float valorBuscado);
void ModificarDonacion(float arr[], int tam);
void InsertarDonacionIntermedia(float arr[], int &tam, int capacidad);
void CalcularEstadisticas(const float arr[], int tam);

int main() {
    float donaciones[CAPACIDAD];
    int tam = 0;
    int opc = -1;

    cout << fixed << setprecision(2);

    do {
        MostrarMenu(opc);
        
        switch (opc) {
            case 1:
                RegistrarDonacion(donaciones, tam, CAPACIDAD);
                break;
            case 2:
                ListarDonaciones(donaciones, tam, 25.0f);
                break;
            case 3:
                ModificarDonacion(donaciones, tam);
                break;
            case 4:
                InsertarDonacionIntermedia(donaciones, tam, CAPACIDAD);
                break;
            case 5:
                CalcularEstadisticas(donaciones, tam);
                break;
            case 0:
                cout << "\nFinalizando sistema de donaciones de Olga." << endl;
                break;
            default:
                cout << "\n[Error] Opcion invalida. Intente nuevamente." << endl;
        }

        if (opc != 0) {
            cout << "\nPresione una tecla para continuar...";
            cin.ignore();
            cin.get();
        }

    } while (opc != 0);

    return 0;
}

void MostrarMenu(int &opc) {
    cout << "\n=== SISTEMA DE DONACIONES - OLGA EN VIVO ===" << endl;
    cout << "1. Registrar Donaciones de la Comunidad" << endl;
    cout << "2. Listar Donaciones y Filtrar Destacadas" << endl;
    cout << "3. Buscar y Modificar Donacion" << endl;
    cout << "4. Insertar Donacion Intermedia" << endl;
    cout << "5. Ver Estadisticas de Recaudacion" << endl;
    cout << "0. Salir" << endl;
    cout << "Ingrese una opcion: ";
    cin >> opc;
}

void RegistrarDonacion(float arr[], int &tam, int capacidad) {
    if (tam >= capacidad) {
        cout << "[Error] Memoria llena. No es posible registrar mas donaciones." << endl;
        return;
    }

    char continuar;
    do {
        if (tam >= capacidad) {
            cout << "[Aviso] Se alcanzo la capacidad maxima del arreglo (" << capacidad << " elementos)." << endl;
            break;
        }

        float monto;
        do {
            cout << "Ingrese monto de donacion en miles de ARS (1.0 - 80.0): ";
            cin >> monto;
            if (monto < 1.0f || monto > 80.0f) {
                cout << "[Error] El monto debe estar entre 1.0 y 80.0 miles de ARS." << endl;
            }
        } while (monto < 1.0f || monto > 80.0f);

        arr[tam] = monto;
        cout << "[Exito] Donacion registrada correctamente en la posicion " << tam << "." << endl;
        tam++;

        if (tam < capacidad) {
            cout << "Desea continuar ? (s/n): ";
            cin >> continuar;
        } else {
            cout << "[Aviso] Se alcanzo la capacidad maxima del arreglo (" << capacidad << " elementos)." << endl;
            break;
        }
    } while (continuar == 's' || continuar == 'S');
}

void ListarDonaciones(const float arr[], int tam, float umbralDestacado) {
    if (tam == 0) {
        cout << "[Aviso] No hay donaciones registradas en el sistema." << endl;
        return;
    }

    cout << "\n--- REGISTRO DE DONACIONES OLGA ---" << endl;
    int contDestacadas = 0;
    for (int i = 0; i < tam; i++) {
        cout << "[" << i << "] $ " << arr[i] << " miles de ARS" << endl;
        if (arr[i] > umbralDestacado) {
            contDestacadas++;
        }
    }

    cout << "Aportes destacados (> " << umbralDestacado << " miles): " 
         << contDestacadas << " de " << tam << " donaciones." << endl;
}

int BuscarDonacion(const float arr[], int tam, float valorBuscado) {
    for (int i = 0; i < tam; i++) {
        if (arr[i] == valorBuscado) {
            return i;
        }
    }
    return -1;
}

void ModificarDonacion(float arr[], int tam) {
    if (tam == 0) {
        cout << "[Aviso] No hay donaciones para modificar." << endl;
        return;
    }

    float buscado;
    cout << "Ingrese el monto de donacion que desea buscar: ";
    cin >> buscado;

    int pos = BuscarDonacion(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] No se encontro ninguna donacion con ese monto." << endl;
        return;
    }

    cout << "Donacion encontrada en la posicion " << pos << "." << endl;
    float nuevoMonto;
    do {
        cout << "Ingrese el nuevo monto corregido (1.0 - 80.0): ";
        cin >> nuevoMonto;
        if (nuevoMonto < 1.0f || nuevoMonto > 80.0f) {
            cout << "[Error] El monto debe estar entre 1.0 y 80.0 miles de ARS." << endl;
        }
    } while (nuevoMonto < 1.0f || nuevoMonto > 80.0f);

    arr[pos] = nuevoMonto;
    cout << "[Exito] Donacion actualizada correctamente." << endl;
}

void InsertarDonacionIntermedia(float arr[], int &tam, int capacidad) {
    if (tam >= capacidad) {
        cout << "[Error] Memoria llena. No es posible realizar inserciones intermedias." << endl;
        return;
    }

    if (tam == 0) {
        cout << "[Aviso] No hay donaciones registradas para realizar una insercion intermedia." << endl;
        return;
    }

    int pos;
    do {
        cout << "Ingrese la posicion donde desea insertar (0 a " << tam << "): ";
        cin >> pos;
        if (pos < 0 || pos > tam) {
            cout << "[Error] Posicion invalida. Debe ser un indice entre 0 y " << tam << "." << endl;
        }
    } while (pos < 0 || pos > tam);

    float nuevoMonto;
    do {
        cout << "Ingrese monto de donacion en miles de ARS (1.0 - 80.0): ";
        cin >> nuevoMonto;
        if (nuevoMonto < 1.0f || nuevoMonto > 80.0f) {
            cout << "[Error] El monto debe estar entre 1.0 y 80.0 miles de ARS." << endl;
        }
    } while (nuevoMonto < 1.0f || nuevoMonto > 80.0f);

    // Algoritmo de desplazamiento hacia la derecha (Shift-Right) de atras hacia adelante
    for (int i = tam; i > pos; i--) {
        arr[i] = arr[i - 1];
    }
    arr[pos] = nuevoMonto;
    tam++;

    cout << "[Exito] Donacion insertada correctamente en la posicion " << pos << "." << endl;
}

void CalcularEstadisticas(const float arr[], int tam) {
    if (tam == 0) {
        cout << "[Aviso] No hay donaciones registradas para calcular estadisticas." << endl;
        return;
    }

    float suma = 0.0f;
    float minimo = arr[0];
    int posMin = 0;

    for (int i = 0; i < tam; i++) {
        suma += arr[i];
        if (arr[i] < minimo) {
            minimo = arr[i];
            posMin = i;
        }
    }

    float promedio = suma / tam;

    cout << "\n--- ESTADISTICAS DE RECAUDACION ---" << endl;
    cout << "Cantidad de donaciones procesadas: " << tam << endl;
    cout << "Promedio general de donacion: $ " << promedio << " miles de ARS" << endl;
    cout << "Aporte Minimo recibido: $ " << minimo << " miles registrado en la posicion " << posMin << "." << endl;
}
