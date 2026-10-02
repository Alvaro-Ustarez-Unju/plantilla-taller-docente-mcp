/**
 * @file resolucion-tema3.cpp
 * @brief 3er Examen Parcial (Ciclo Lectivo 2026) - Tema 3: Cosquín Rock
 * @details Cátedra de Algoritmos y Programación - Módulo 3 (Arreglos Unidimensionales)
 * 
 * Eje Temático: Abonos por Sector - Cosquín Rock (Aeródromo Santa María de Punilla)
 * Invariante: 0 <= tam <= CAPACIDAD (CAPACIDAD = 15)
 * Rango de Abonos Válidos: [100, 2500]
 * Umbral de Aforo Agotado: > 1500 abonos
 */

#include <iostream>
#include <iomanip>

using namespace std;

// Capacidad física estática del arreglo
const int CAPACIDAD = 15;

// Prototipos de funciones modulares
void MostrarMenu(int &opc);
void RegistrarSector(int arr[], int &tam, int capacidad);
void ListarSectores(const int arr[], int tam, int umbralAgotado);
int BuscarSector(const int arr[], int tam, int valorBuscado);
void ModificarAbonos(int arr[], int tam);
void ClausurarSector(int arr[], int &tam);
void CalcularEstadisticas(const int arr[], int tam);

int main() {
    int sectores[CAPACIDAD];
    int tam = 0;
    int opc = -1;

    cout << fixed << setprecision(2);

    do {
        MostrarMenu(opc);

        switch (opc) {
            case 1:
                RegistrarSector(sectores, tam, CAPACIDAD);
                break;
            case 2:
                ListarSectores(sectores, tam, 1500);
                break;
            case 3:
                ModificarAbonos(sectores, tam);
                break;
            case 4:
                ClausurarSector(sectores, tam);
                break;
            case 5:
                CalcularEstadisticas(sectores, tam);
                break;
            case 0:
                cout << "\nFinalizando sistema de aforo de Cosquin Rock." << endl;
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
    cout << "   CONTROL DE AFORO - COSQUIN ROCK            " << endl;
    cout << "==============================================" << endl;
    cout << "1. Registrar Abonos de Sector" << endl;
    cout << "2. Listar Sectores y Aforo Agotado" << endl;
    cout << "3. Buscar y Modificar Abonos" << endl;
    cout << "4. Clausurar Sector (Compactar Predio)" << endl;
    cout << "5. Ver Estadisticas del Festival" << endl;
    cout << "0. Salir" << endl;
    cout << "----------------------------------------------" << endl;
    cout << "Ingrese una opcion: > ";
    cin >> opc;
}

/**
 * @brief Registra un nuevo sector controlando capacidad física y rango de abonos.
 * @param arr Arreglo de sectores.
 * @param tam Tamaño lógico actual (incrementado por referencia).
 * @param capacidad Capacidad física máxima del vector.
 */
void RegistrarSector(int arr[], int &tam, int capacidad) {
    if (tam >= capacidad) {
        cout << "\n[Error] Capacidad completa. No se pueden registrar mas sectores en el predio." << endl;
        return;
    }

    int abonos;
    do {
        cout << "Ingrese cantidad de abonos vendidos (100 - 2500): > ";
        cin >> abonos;

        if (abonos < 100 || abonos > 2500) {
            cout << "[Error] La cantidad de abonos debe estar entre 100 y 2500." << endl;
        }
    } while (abonos < 100 || abonos > 2500);

    arr[tam] = abonos;
    cout << "[Exito] Sector registrado correctamente en la posicion " << tam << "." << endl;
    tam++;
}

/**
 * @brief Lista todos los sectores y cuenta cuántos alcanzaron el Aforo Agotado.
 * @param arr Arreglo de sectores (protegido con const).
 * @param tam Tamaño lógico de sectores registrados.
 * @param umbralAgotado Cantidad mínima para Aforo Agotado (> 1500).
 */
void ListarSectores(const int arr[], int tam, int umbralAgotado) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay sectores registrados en el predio." << endl;
        return;
    }

    cout << "\n--- CONTROL DE SECTORES COSQUIN ROCK ---" << endl;
    int aforoAgotado = 0;

    for (int i = 0; i < tam; i++) {
        cout << "[" << i << "] " << arr[i] << " abonos" << endl;
        if (arr[i] > umbralAgotado) {
            aforoAgotado++;
        }
    }

    cout << "Sectores con Aforo Agotado (> " << umbralAgotado << " abonos): " 
         << aforoAgotado << " de " << tam << " sectores." << endl;
}

/**
 * @brief Búsqueda secuencial lineal de un sector por cantidad de abonos.
 * @param arr Arreglo de sectores (solo lectura).
 * @param tam Tamaño lógico.
 * @param valorBuscado Cantidad de abonos a localizar.
 * @return Posición del elemento (0 a tam-1) o -1 si no existe.
 */
int BuscarSector(const int arr[], int tam, int valorBuscado) {
    for (int i = 0; i < tam; i++) {
        if (arr[i] == valorBuscado) {
            return i;
        }
    }
    return -1;
}

/**
 * @brief Busca un sector y modifica su cantidad rectificada de abonos vendidos.
 * @param arr Arreglo de sectores.
 * @param tam Tamaño lógico.
 */
void ModificarAbonos(int arr[], int tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay sectores registrados para modificar." << endl;
        return;
    }

    int buscado;
    cout << "Ingrese cantidad de abonos a buscar: > ";
    cin >> buscado;

    int pos = BuscarSector(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] No se encontro ningun sector con esa cantidad de abonos." << endl;
        return;
    }

    cout << "Sector encontrado en la posicion " << pos << "." << endl;
    int nuevoValor;
    do {
        cout << "Ingrese nueva cantidad de abonos rectificada (100 - 2500): > ";
        cin >> nuevoValor;

        if (nuevoValor < 100 || nuevoValor > 2500) {
            cout << "[Error] La cantidad de abonos debe estar entre 100 y 2500." << endl;
        }
    } while (nuevoValor < 100 || nuevoValor > 2500);

    arr[pos] = nuevoValor;
    cout << "[Exito] Sector actualizado correctamente." << endl;
}

/**
 * @brief Clausura un sector aplicando desplazamiento a la izquierda (Shift-Left).
 * @param arr Arreglo de sectores.
 * @param tam Tamaño lógico (decrementado por referencia).
 */
void ClausurarSector(int arr[], int &tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay sectores registrados para clausurar." << endl;
        return;
    }

    int buscado;
    cout << "Ingrese cantidad de abonos del sector a clausurar: > ";
    cin >> buscado;

    int pos = BuscarSector(arr, tam, buscado);
    if (pos == -1) {
        cout << "[Error] Sector no encontrado. No se realizo ninguna clausura." << endl;
        return;
    }

    // Algoritmo de compactación física Shift-Left
    for (int i = pos; i < tam - 1; i++) {
        arr[i] = arr[i + 1];
    }

    tam--;
    cout << "[Exito] Sector clausurado y predio compactado correctamente." << endl;
}

/**
 * @brief Calcula el promedio de abonos y determina el sector con máxima concentración.
 * @param arr Arreglo de sectores (const).
 * @param tam Tamaño lógico.
 */
void CalcularEstadisticas(const int arr[], int tam) {
    if (tam == 0) {
        cout << "\n[Aviso] No hay sectores registrados para calcular estadisticas." << endl;
        return;
    }

    int suma = 0;
    int maxAbonos = arr[0];
    int posMax = 0;

    for (int i = 0; i < tam; i++) {
        suma += arr[i];
        if (arr[i] > maxAbonos) {
            maxAbonos = arr[i];
            posMax = i;
        }
    }

    double promedio = static_cast<double>(suma) / tam;

    cout << "\n--- ESTADISTICAS DEL FESTIVAL ---" << endl;
    cout << "Cantidad de sectores habilitados: " << tam << endl;
    cout << "Promedio de abonos por sector: " << promedio << " abonos" << endl;
    cout << "Maxima concentracion registrada: " << maxAbonos << " abonos en la posicion " << posMax << "." << endl;
}
