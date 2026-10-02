/**
 * @file resolucion-tema1.cpp
 * @brief 3er Examen Parcial (Ciclo Lectivo 2026) - Tema 1: Cine Gaumont
 * @details Cátedra de Algoritmos y Programación - Módulo 3 (Arreglos Unidimensionales)
 * 
 * Eje Temático: Boletería y Aforo - Espacio INCAA / Cine Gaumont
 * Invariante: 0 <= tam <= CAPACIDAD (CAPACIDAD = 15)
 * Rango de Entradas Válidas: [10, 300]
 * Umbral de Sala Llena: > 180 entradas
 */

#include <iostream>
#include <iomanip>

using namespace std;

// Capacidad física estática del arreglo
const int CAPACIDAD = 15;

// Prototipos de funciones modulares
void MostrarMenu(int &opc);
void RegistrarFuncion(int arr[], int &tam, int capacidad);
void ListarFunciones(const int arr[], int tam, int umbralSalaLlena);
int BuscarFuncion(const int arr[], int tam, int valorBuscado);
void ModificarEntradas(int arr[], int tam);
void CancelarFuncion(int arr[], int &tam);
void CalcularEstadisticas(const int arr[], int tam);

int main() {
    int funciones[CAPACIDAD];
    int tam = 0;
    int opc = -1;

    cout << fixed << setprecision(2);

    do {
        MostrarMenu(opc);

        switch (opc) {
            case 1:
                RegistrarFuncion(funciones, tam, CAPACIDAD);
                break;
            case 2:
                ListarFunciones(funciones, tam, 180);
                break;
            case 3:
                ModificarEntradas(funciones, tam);
                break;
            case 4:
                CancelarFuncion(funciones, tam);
                break;
            case 5:
                CalcularEstadisticas(funciones, tam);
                break;
            case 0:
                cout << "\nFinalizando sistema de boleteria del Cine Gaumont." << endl;
                break;
            default:
                cout << "\n[Error] Opcion invalida. Intente nuevamente." << endl;
        }

        if (opc != 0) {
            cout << "\nPresione Enter para continuar...";
            cin.ignore();
            cin.get();
        }

    } while (opc != 0);

    return 0;
}

/**
 * @brief Despliega el menú de opciones e interactúa con el usuario.
 * @param opc Variable donde se almacena la opción elegida (pasaje por referencia).
 */
void MostrarMenu(int &opc) {
    cout << "\n==============================================" << endl;
    cout << "   SISTEMA DE BOLETERIA - CINE GAUMONT        " << endl;
    cout << "==============================================" << endl;
    cout << "1. Registrar Venta de Funcion" << endl;
    cout << "2. Listar Funciones y Filtrar Salas Llenas" << endl;
    cout << "3. Buscar y Modificar Venta" << endl;
    cout << "4. Cancelar Funcion (Compactar Cartelera)" << endl;
    cout << "5. Ver Estadisticas de Boleteria" << endl;
    cout << "0. Salir" << endl;
    cout << "----------------------------------------------" << endl;
    cout << "Ingrese una opcion: > ";
    cin >> opc;
}

/**
 * @brief Registra una nueva función controlando capacidad física y rango de entradas.
 * @param arr Arreglo de funciones.
 * @param tam Tamaño lógico actual (incrementado por referencia).
 * @param capacidad Capacidad física máxima del vector.
 */
void RegistrarFuncion(int arr[], int &tam, int capacidad) {
    if (tam >= capacidad) {
        cout << "\n[Error] Capacidad completa. No se pueden registrar mas funciones en cartelera." << endl;
        return;
    }

    int entradas;
    do {
        cout << "Ingrese cantidad de entradas vendidas (10 - 300): > ";
        cin >> entradas;

        if (entradas < 10 || entradas > 300) {
            cout << "[Error] La cantidad de entradas debe estar entre 10 y 300." << endl;
        }
    } while (entradas < 10 || entradas > 300);

    arr[tam] = entradas;
    cout << "[Exito] Funcion registrada correctamente en la posicion " << tam << "." << endl;
    tam++;
}

/**
 * @brief Lista todas las funciones y cuenta cuántas alcanzaron el aforo de Sala Llena.
 * @param arr Arreglo de funciones (protegido con const).
 * @param tam Tamaño lógico de funciones registradas.
 * @param umbralSalaLlena Cantidad mínima para considerar sala llena (> 180).
 */
void ListarFunciones(const int arr[], int tam, int umbralSalaLlena) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay funciones registradas en cartelera." << endl;
        return;
    }

    cout << "\n--- CARTELERA CINE GAUMONT ---" << endl;
    int salasLlenas = 0;

    for (int i = 0; i < tam; i++) {
        cout << "[" << i << "] " << arr[i] << " entradas vendidas" << endl;
        if (arr[i] > umbralSalaLlena) {
            salasLlenas++;
        }
    }

    cout << "Funciones con Sala Llena (> " << umbralSalaLlena << " entradas): " 
         << salasLlenas << " de " << tam << " funciones." << endl;
}

/**
 * @brief Búsqueda secuencial lineal de una función por cantidad de entradas.
 * @param arr Arreglo de funciones (solo lectura).
 * @param tam Tamaño lógico.
 * @param valorBuscado Cantidad de entradas a localizar.
 * @return Posición del elemento (0 a tam-1) o -1 si no existe.
 */
int BuscarFuncion(const int arr[], int tam, int valorBuscado) {
    for (int i = 0; i < tam; i++) {
        if (arr[i] == valorBuscado) {
            return i;
        }
    }
    return -1;
}

/**
 * @brief Busca una función y modifica su cantidad rectificada de entradas vendidas.
 * @param arr Arreglo de funciones.
 * @param tam Tamaño lógico.
 */
void ModificarEntradas(int arr[], int tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay funciones registradas para modificar." << endl;
        return;
    }

    int buscado;
    cout << "Ingrese cantidad de entradas a buscar: > ";
    cin >> buscado;

    int pos = BuscarFuncion(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] No se encontro ninguna funcion con esa cantidad de entradas vendidas." << endl;
        return;
    }

    cout << "Funcion encontrada en la posicion " << pos << "." << endl;
    int nuevoValor;
    do {
        cout << "Ingrese nueva cantidad de entradas rectificada (10 - 300): > ";
        cin >> nuevoValor;

        if (nuevoValor < 10 || nuevoValor > 300) {
            cout << "[Error] La cantidad de entradas debe estar entre 10 y 300." << endl;
        }
    } while (nuevoValor < 10 || nuevoValor > 300);

    arr[pos] = nuevoValor;
    cout << "[Exito] Venta rectificada correctamente." << endl;
}

/**
 * @brief Elimina una función de la cartelera aplicando desplazamiento a la izquierda (Shift-Left).
 * @param arr Arreglo de funciones.
 * @param tam Tamaño lógico (decrementado por referencia).
 */
void CancelarFuncion(int arr[], int &tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay funciones registradas para cancelar." << endl;
        return;
    }

    int buscado;
    cout << "Ingrese cantidad de entradas de la funcion a cancelar: > ";
    cin >> buscado;

    int pos = BuscarFuncion(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] Funcion no encontrada. No se realizo ninguna cancelacion." << endl;
        return;
    }

    // Algoritmo de compactación física Shift-Left
    for (int i = pos; i < tam - 1; i++) {
        arr[i] = arr[i + 1];
    }

    tam--;
    cout << "[Exito] Funcion cancelada y cartelera compactada correctamente." << endl;
}

/**
 * @brief Calcula el promedio de entradas y determina la función con máxima convocatoria.
 * @param arr Arreglo de funciones (const).
 * @param tam Tamaño lógico.
 */
void CalcularEstadisticas(const int arr[], int tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay funciones registradas para calcular estadisticas." << endl;
        return;
    }

    int suma = 0;
    int maxVenta = arr[0];
    int posMax = 0;

    for (int i = 0; i < tam; i++) {
        suma += arr[i];
        if (arr[i] > maxVenta) {
            maxVenta = arr[i];
            posMax = i;
        }
    }

    double promedio = static_cast<double>(suma) / tam;

    cout << "\n--- ESTADISTICAS DE BOLETERIA ---" << endl;
    cout << "Total de funciones registradas: " << tam << endl;
    cout << "Promedio de entradas por funcion: " << promedio << " entradas" << endl;
    cout << "Maxima venta registrada: " << maxVenta << " entradas en la posicion " << posMax << "." << endl;
}
