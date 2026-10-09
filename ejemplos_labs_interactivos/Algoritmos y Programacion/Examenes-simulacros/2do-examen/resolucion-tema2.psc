Algoritmo FinanzasGoleadores_Tema2
	Definir opc, presupuesto Como Entero;
	presupuesto = 0;
	opc = -1;
	
	Repetir
		MostrarMenu(opc);
		
		Segun opc Hacer
			1:
				IngresarPresupuesto(presupuesto);
			2:
				ProcesarGastosDecrementales(presupuesto);
			3:
				BuscarGoleadorMaximo(presupuesto);
			4:
				MostrarEstado(presupuesto);
			0:
				// Fin del programa
		FinSegun
		
		Esperar Tecla;
	Mientras Que opc <> 0
FinAlgoritmo

SubProceso MostrarMenu(opc Por Referencia)
	Borrar Pantalla;
	Escribir "=== FINANZAS Y RÉCORDS AFA 2026 ===";
	Escribir "1. Ingresar Presupuesto Inicial";
	Escribir "2. Procesar Gastos Decrementales";
	Escribir "3. Buscar Máximo Goleador y su Nombre";
	Escribir "4. Ver Estado Actual";
	Escribir "0. Salir";
	Escribir "Ingrese una opción: ";
	Leer opc;
FinSubProceso

SubProceso IngresarPresupuesto(presupuesto Por Referencia)
	Repetir
		Escribir "Ingrese presupuesto (100000 a 5000000): ";
		Leer presupuesto;
		Si presupuesto < 100000 O presupuesto > 5000000 Entonces
			Escribir "[Error] El valor debe estar entre 100000 y 5000000.";
		FinSi
	Mientras Que presupuesto < 100000 O presupuesto > 5000000
FinSubProceso

SubProceso ProcesarGastosDecrementales(presupuesto Por Referencia)
	Definir gasto Como Entero;
	
	Mientras presupuesto >= 10000 Hacer
		Escribir "Ingrese un gasto: ";
		Leer gasto;
		presupuesto = presupuesto - gasto;
		Escribir "Presupuesto restante: ", presupuesto;
	FinMientras
	
	Escribir "[Alerta] El presupuesto cayó por debajo del umbral de 10000.";
FinSubProceso

SubProceso BuscarGoleadorMaximo(presupuesto)
	Definir i, n, goles, max_goles Como Entero;
	Definir nombre, max_nombre Como Caracter;
	Definir premio Como Real;
	max_goles = -1;
	
	Escribir "Ingrese cantidad de jugadores: ";
	Leer n;
	
	Para i = 1 Hasta n Hacer
		Escribir "Nombre del jugador ", i, ": ";
		Leer nombre;
		Escribir "Goles de ", nombre, ": ";
		Leer goles;
		
		Si goles > max_goles Entonces
			max_goles = goles;
			max_nombre = nombre;
		FinSi
	FinPara
	
	premio = presupuesto * 0.10;
	
	Escribir "El máximo goleador fue ", max_nombre, " con ", max_goles, " goles.";
	Escribir "Premio otorgado (10% de ", presupuesto, "): ", premio;
FinSubProceso

SubProceso MostrarEstado(presupuesto)
	Escribir "Presupuesto registrado en el sistema: ", presupuesto;
FinSubProceso
