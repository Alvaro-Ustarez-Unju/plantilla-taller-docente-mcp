#include <iostream>
#include <iomanip>

using namespace std;

const int CAPACIDAD = 15;

// Prototipos de funciones
void MostrarMenu(int &opc);
void RegistrarRetencion(float arr[], int &tam, int capacidad);
void ListarRetenciones(const float arr[], int tam, float umbralAltaFidelidad);
int BuscarRetencion(const float arr[], int tam, float valorBuscado);
void ModificarRetencion(float arr[], int tam);
void EliminarSesion(float arr[], int &tam);
void CalcularEstadisticas(const float arr[], int tam);

int main() {
    float retenciones[CAPACIDAD];
    int tam = 0;
    int opc = -1;

    cout << fixed << setprecision(2);

    do {
        MostrarMenu(opc);
        
        switch (opc) {
            case 1:
                RegistrarRetencion(retenciones, tam, CAPACIDAD);
                break;
            case 2:
                ListarRetenciones(retenciones, tam, 40.0f);
                break;
            case 3:
                ModificarRetencion(retenciones, tam);
                break;
            case 4:
                EliminarSesion(retenciones, tam);
                break;
            case 5:
                CalcularEstadisticas(retenciones, tam);
                break;
            case 0:
                cout << "\nFinalizando sistema de telemetria de Blender." << endl;
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
    cout << "\n=== SISTEMA DE TELEMETRIA - BLENDER ===" << endl;
    cout << "1. Registrar Sesion de Retencion" << endl;
    cout << "2. Listar Sesiones y Filtrar Alta Fidelidad" << endl;
    cout << "3. Buscar y Modificar Sesion" << endl;
    cout << "4. Descartar Sesion (Compactar Arreglo)" << endl;
    cout << "5. Ver Estadisticas de Fidelizacion" << endl;
    cout << "0. Salir" << endl;
    cout << "Ingrese una opcion: ";
    cin >> opc;
}

void RegistrarRetencion(float arr[], int &tam, int capacidad) {
    if (tam >= capacidad) {
        cout << "[Error] Memoria llena. No es posible registrar mas sesiones." << endl;
        return;
    }

    float minutos;
    do {
        cout << "Ingrese tiempo de retencion en minutos (2.0 - 90.0): ";
        cin >> minutos;
        if (minutos < 2.0f || minutos > 90.0f) {
            cout << "[Error] El tiempo de retencion debe estar entre 2.0 y 90.0 minutos." << endl;
        }
    } while (minutos < 2.0f || minutos > 90.0f);

    arr[tam] = minutos;
    cout << "[Exito] Sesion registrada correctamente en la posicion " << tam << "." << endl;
    tam++;
}

void ListarRetenciones(const float arr[], int tam, float umbralAltaFidelidad) {
    if (tam == 0) {
        cout << "[Aviso] No hay sesiones registradas en el sistema." << endl;
        return;
    }

    cout << "\n--- REGISTRO DE RETENCION BLENDER ---" << endl;
    int contAltaFidelidad = 0;
    for (int i = 0; i < tam; i++) {
        cout << "[" << i << "] " << arr[i] << " minutos" << endl;
        if (arr[i] > umbralAltaFidelidad) {
            contAltaFidelidad++;
        }
    }

    cout << "Sesiones con Alta Fidelidad (> " << umbralAltaFidelidad << " min): " 
         << contAltaFidelidad << " de " << tam << " sesiones." << endl;
}

int BuscarRetencion(const float arr[], int tam, float valorBuscado) {
    for (int i = 0; i < tam; i++) {
        if (arr[i] == valorBuscado) {
            return i;
        }
    }
    return -1;
}

void ModificarRetencion(float arr[], int tam) {
    if (tam == 0) {
        cout << "[Aviso] No hay sesiones para modificar." << endl;
        return;
    }

    float buscado;
    cout << "Ingrese el tiempo de sesion que desea buscar: ";
    cin >> buscado;

    int pos = BuscarRetencion(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] No se encontro ninguna sesion con ese tiempo." << endl;
        return;
    }

    cout << "Sesion encontrada en la posicion " << pos << "." << endl;
    float nuevoTiempo;
    do {
        cout << "Ingrese el nuevo tiempo corregido (2.0 - 90.0): ";
        cin >> nuevoTiempo;
        if (nuevoTiempo < 2.0f || nuevoTiempo > 90.0f) {
            cout << "[Error] El tiempo de retencion debe estar entre 2.0 y 90.0 minutos." << endl;
        }
    } while (nuevoTiempo < 2.0f || nuevoTiempo > 90.0f);

    arr[pos] = nuevoTiempo;
    cout << "[Exito] Sesion actualizada correctamente." << endl;
}

void EliminarSesion(float arr[], int &tam) {
    if (tam == 0) {
        cout << "[Aviso] No hay sesiones para descartar." << endl;
        return;
    }

    float tiempoDescartar;
    cout << "Ingrese el tiempo de sesion a descartar: ";
    cin >> tiempoDescartar;

    int pos = BuscarRetencion(arr, tam, tiempoDescartar);
    if (pos == -1) {
        cout << "[Error] Sesion no encontrada. No se realizo ninguna eliminacion." << endl;
        return;
    }

    // Algoritmo de compactacion Shift-Left
    for (int i = pos; i < tam - 1; i++) {
        arr[i] = arr[i + 1];
    }
    tam--;

    cout << "[Exito] Sesion eliminada y arreglo compactado correctamente." << endl;
}

void CalcularEstadisticas(const float arr[], int tam) {
    if (tam == 0) {
        cout << "[Aviso] No hay sesiones registradas para calcular estadisticas." << endl;
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

    cout << "\n--- ESTADISTICAS DE FIDELIZACION ---" << endl;
    cout << "Cantidad de sesiones procesadas: " << tam << endl;
    cout << "Promedio general de permanencia: " << promedio << " minutos" << endl;
    cout << "Pico Maximo de permanencia: " << maximo << " minutos registrado en la posicion " << posMax << "." << endl;
}
