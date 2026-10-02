#include <iostream>
#include <iomanip>

using namespace std;

const int CAPACIDAD = 15;

// Prototipos de funciones
void MostrarMenu(int &opc);
void RegistrarAudiencia(float arr[], int &tam, int capacidad);
void ListarAudiencias(const float arr[], int tam, float umbralPrimeTime);
int BuscarAudiencia(const float arr[], int tam, float valorBuscado);
void ModificarAudiencia(float arr[], int tam);
void EliminarMedicion(float arr[], int &tam);
void CalcularEstadisticas(const float arr[], int tam);

int main() {
    float audiencias[CAPACIDAD];
    int tam = 0;
    int opc = -1;

    cout << fixed << setprecision(2);

    do {
        MostrarMenu(opc);
        
        switch (opc) {
            case 1:
                RegistrarAudiencia(audiencias, tam, CAPACIDAD);
                break;
            case 2:
                ListarAudiencias(audiencias, tam, 60.0f);
                break;
            case 3:
                ModificarAudiencia(audiencias, tam);
                break;
            case 4:
                EliminarMedicion(audiencias, tam);
                break;
            case 5:
                CalcularEstadisticas(audiencias, tam);
                break;
            case 0:
                cout << "\nFinalizando sistema de telemetria de Luzu TV." << endl;
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
    cout << "\n=== SISTEMA DE TELEMETRIA - LUZU TV ===" << endl;
    cout << "1. Registrar Mediciones de Audiencia" << endl;
    cout << "2. Listar Mediciones y Filtrar Prime Time" << endl;
    cout << "3. Buscar y Modificar Medicion" << endl;
    cout << "4. Eliminar Medicion (Compactar Arreglo)" << endl;
    cout << "5. Ver Estadisticas de Transmision" << endl;
    cout << "0. Salir" << endl;
    cout << "Ingrese una opcion: ";
    cin >> opc;
}

void RegistrarAudiencia(float arr[], int &tam, int capacidad) {
    if (tam >= capacidad) {
        cout << "[Error] Memoria llena. No es posible registrar mas mediciones." << endl;
        return;
    }

    char continuar;
    do {
        if (tam >= capacidad) {
            cout << "[Aviso] Se alcanzo la capacidad maxima del arreglo (" << capacidad << " elementos)." << endl;
            break;
        }

        float valor;
        do {
            cout << "Ingrese cantidad de espectadores concurrentes en miles (5.0 - 150.0): ";
            cin >> valor;
            if (valor < 5.0f || valor > 150.0f) {
                cout << "[Error] El valor debe estar entre 5.0 y 150.0 miles de viewers." << endl;
            }
        } while (valor < 5.0f || valor > 150.0f);

        arr[tam] = valor;
        cout << "[Exito] Medicion registrada correctamente en la posicion " << tam << "." << endl;
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

void ListarAudiencias(const float arr[], int tam, float umbralPrimeTime) {
    if (tam == 0) {
        cout << "[Aviso] No hay mediciones registradas en el sistema." << endl;
        return;
    }

    cout << "\n--- REGISTRO DE AUDIENCIAS LUZU TV ---" << endl;
    int contPrimeTime = 0;
    for (int i = 0; i < tam; i++) {
        cout << "[" << i << "] " << arr[i] << " miles de viewers" << endl;
        if (arr[i] > umbralPrimeTime) {
            contPrimeTime++;
        }
    }

    cout << "Bloques en Prime Time (> " << umbralPrimeTime << " miles): " 
         << contPrimeTime << " de " << tam << " mediciones." << endl;
}

int BuscarAudiencia(const float arr[], int tam, float valorBuscado) {
    for (int i = 0; i < tam; i++) {
        if (arr[i] == valorBuscado) {
            return i;
        }
    }
    return -1;
}

void ModificarAudiencia(float arr[], int tam) {
    if (tam == 0) {
        cout << "[Aviso] No hay mediciones para modificar." << endl;
        return;
    }

    float buscado;
    cout << "Ingrese el valor de audiencia que desea buscar: ";
    cin >> buscado;

    int pos = BuscarAudiencia(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] No se encontro ninguna medicion con ese valor." << endl;
        return;
    }

    cout << "Medicion encontrada en la posicion " << pos << "." << endl;
    float nuevoValor;
    do {
        cout << "Ingrese el nuevo valor calibrado (5.0 - 150.0): ";
        cin >> nuevoValor;
        if (nuevoValor < 5.0f || nuevoValor > 150.0f) {
            cout << "[Error] El valor debe estar entre 5.0 y 150.0 miles de viewers." << endl;
        }
    } while (nuevoValor < 5.0f || nuevoValor > 150.0f);

    arr[pos] = nuevoValor;
    cout << "[Exito] Medicion actualizada correctamente." << endl;
}

void EliminarMedicion(float arr[], int &tam) {
    if (tam == 0) {
        cout << "[Aviso] No hay mediciones para eliminar." << endl;
        return;
    }

    float valorEliminar;
    cout << "Ingrese el valor de audiencia a eliminar: ";
    cin >> valorEliminar;

    int pos = BuscarAudiencia(arr, tam, valorEliminar);
    if (pos == -1) {
        cout << "[Error] Valor no encontrado. No se realizo ninguna eliminacion." << endl;
        return;
    }

    // Algoritmo de compactacion Shift-Left
    for (int i = pos; i < tam - 1; i++) {
        arr[i] = arr[i + 1];
    }
    tam--;

    cout << "[Exito] Medicion eliminada y arreglo compactado correctamente." << endl;
}

void CalcularEstadisticas(const float arr[], int tam) {
    if (tam == 0) {
        cout << "[Aviso] No hay mediciones registradas para calcular estadisticas." << endl;
        return;
    }

    float suma = 0.0f;
    float maximo = arr[0];
    int posMax = 0;

    for (int i = 0; i < tam; i++) {
        suma += arr[i];
        if (arr[i] > maximo) {
            maximo = arr[i];
            posMax = i;
        }
    }

    float promedio = suma / tam;

    cout << "\n--- ESTADISTICAS DE TRANSMISION ---" << endl;
    cout << "Cantidad de mediciones procesadas: " << tam << endl;
    cout << "Promedio general de audiencia: " << promedio << " miles de viewers" << endl;
    cout << "Pico Maximo de audiencia: " << maximo << " miles alcanzado en la posicion " << posMax << "." << endl;
}
