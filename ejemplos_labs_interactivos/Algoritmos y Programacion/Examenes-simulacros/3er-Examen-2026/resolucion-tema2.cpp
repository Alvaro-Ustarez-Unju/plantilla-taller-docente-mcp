/**
 * @file resolucion-tema2.cpp
 * @brief 3er Examen Parcial (Ciclo Lectivo 2026) - Tema 2: Teatro Gran Rex
 * @details Cátedra de Algoritmos y Programación - Módulo 3 (Arreglos Unidimensionales)
 * 
 * Eje Temático: Localidades y Aforo - Teatro Gran Rex / Calle Corrientes
 * Invariante: 0 <= tam <= CAPACIDAD (CAPACIDAD = 15)
 * Rango de Butacas Válidas: [50, 800]
 * Umbral de Gran Convocatoria: > 500 butacas
 */

#include <iostream>
#include <iomanip>

using namespace std;

// Capacidad física estática del arreglo
const int CAPACIDAD = 15;

// Prototipos de funciones modulares
void MostrarMenu(int &opc);
void RegistrarFuncion(int arr[], int &tam, int capacidad);
void ListarFunciones(const int arr[], int tam, int umbralConvocatoria);
int BuscarFuncion(const int arr[], int tam, int valorBuscado);
void ModificarButacas(int arr[], int tam);
void AnularFuncion(int arr[], int &tam);
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
                ListarFunciones(funciones, tam, 500);
                break;
            case 3:
                ModificarButacas(funciones, tam);
                break;
            case 4:
                AnularFuncion(funciones, tam);
                break;
            case 5:
                CalcularEstadisticas(funciones, tam);
                break;
            case 0:
                cout << "\nFinalizando sistema de sala del Teatro Gran Rex." << endl;
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
    cout << "   SISTEMA DE SALA - TEATRO GRAN REX          " << endl;
    cout << "==============================================" << endl;
    cout << "1. Registrar Venta de Localidades" << endl;
    cout << "2. Listar Funciones y Gran Convocatoria" << endl;
    cout << "3. Buscar y Modificar Butacas" << endl;
    cout << "4. Anular Funcion (Compactar Cartelera)" << endl;
    cout << "5. Ver Estadisticas de Temporada" << endl;
    cout << "0. Salir" << endl;
    cout << "----------------------------------------------" << endl;
    cout << "Ingrese una opcion: > ";
    cin >> opc;
}

/**
 * @brief Registra una nueva función controlando capacidad física y rango de butacas.
 * @param arr Arreglo de funciones.
 * @param tam Tamaño lógico actual (incrementado por referencia).
 * @param capacidad Capacidad física máxima del vector.
 */
void RegistrarFuncion(int arr[], int &tam, int capacidad) {
    if (tam >= capacidad) {
        cout << "\n[Error] Capacidad completa. No se pueden registrar mas funciones teatrales." << endl;
        return;
    }

    int butacas;
    do {
        cout << "Ingrese cantidad de butacas vendidas (50 - 800): > ";
        cin >> butacas;

        if (butacas < 50 || butacas > 800) {
            cout << "[Error] La cantidad de butacas debe estar entre 50 y 800." << endl;
        }
    } while (butacas < 50 || butacas > 800);

    arr[tam] = butacas;
    cout << "[Exito] Funcion registrada correctamente en la posicion " << tam << "." << endl;
    tam++;
}

/**
 * @brief Lista todas las funciones y cuenta cuántas alcanzaron Gran Convocatoria.
 * @param arr Arreglo de funciones (protegido con const).
 * @param tam Tamaño lógico de funciones registradas.
 * @param umbralConvocatoria Cantidad mínima para Gran Convocatoria (> 500).
 */
void ListarFunciones(const int arr[], int tam, int umbralConvocatoria) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay funciones registradas." << endl;
        return;
    }

    cout << "\n--- CARTELERA TEATRO GRAN REX ---" << endl;
    int granConvocatoria = 0;

    for (int i = 0; i < tam; i++) {
        cout << "[" << i << "] " << arr[i] << " butacas ocupadas" << endl;
        if (arr[i] > umbralConvocatoria) {
            granConvocatoria++;
        }
    }

    cout << "Funciones con Gran Convocatoria (> " << umbralConvocatoria << " butacas): " 
         << granConvocatoria << " de " << tam << " funciones." << endl;
}

/**
 * @brief Búsqueda secuencial lineal de una función por cantidad de butacas.
 * @param arr Arreglo de funciones (solo lectura).
 * @param tam Tamaño lógico.
 * @param valorBuscado Cantidad de butacas a localizar.
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
 * @brief Busca una función y modifica su cantidad rectificada de butacas vendidas.
 * @param arr Arreglo de funciones.
 * @param tam Tamaño lógico.
 */
void ModificarButacas(int arr[], int tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay funciones registradas para modificar." << endl;
        return;
    }

    int buscado;
    cout << "Ingrese cantidad de butacas a buscar: > ";
    cin >> buscado;

    int pos = BuscarFuncion(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] No se encontro ninguna funcion con esa cantidad de butacas." << endl;
        return;
    }

    cout << "Funcion encontrada en la posicion " << pos << "." << endl;
    int nuevoValor;
    do {
        cout << "Ingrese nueva cantidad de butacas rectificada (50 - 800): > ";
        cin >> nuevoValor;

        if (nuevoValor < 50 || nuevoValor > 800) {
            cout << "[Error] La cantidad de butacas debe estar entre 50 y 800." << endl;
        }
    } while (nuevoValor < 50 || nuevoValor > 800);

    arr[pos] = nuevoValor;
    cout << "[Exito] Localidades rectificadas correctamente." << endl;
}

/**
 * @brief Anula una función teatral aplicando desplazamiento a la izquierda (Shift-Left).
 * @param arr Arreglo de funciones.
 * @param tam Tamaño lógico (decrementado por referencia).
 */
void AnularFuncion(int arr[], int &tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay funciones registradas para anular." << endl;
        return;
    }

    int buscado;
    cout << "Ingrese cantidad de butacas de la funcion a anular: > ";
    cin >> buscado;

    int pos = BuscarFuncion(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] Funcion no encontrada. No se realizo ninguna anulacion." << endl;
        return;
    }

    // Algoritmo de compactación física Shift-Left
    for (int i = pos; i < tam - 1; i++) {
        arr[i] = arr[i + 1];
    }

    tam--;
    cout << "[Exito] Funcion anulada y cartelera compactada correctamente." << endl;
}

/**
 * @brief Calcula el promedio de butacas y determina la función con menor convocatoria para análisis.
 * @param arr Arreglo de funciones (const).
 * @param tam Tamaño lógico.
 */
void CalcularEstadisticas(const int arr[], int tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay funciones registradas para calcular estadisticas." << endl;
        return;
    }

    int suma = 0;
    int minButacas = arr[0];
    int posMin = 0;

    for (int i = 0; i < tam; i++) {
        suma += arr[i];
        if (arr[i] < minButacas) {
            minButacas = arr[i];
            posMin = i;
        }
    }

    double promedio = static_cast<double>(suma) / tam;

    cout << "\n--- ESTADISTICAS DE TEMPORADA ---" << endl;
    cout << "Total de funciones registradas: " << tam << endl;
    cout << "Promedio de butacas ocupadas por funcion: " << promedio << " butacas" << endl;
    cout << "Minima convocatoria registrada: " << minButacas << " butacas en la posicion " << posMin << "." << endl;
}
