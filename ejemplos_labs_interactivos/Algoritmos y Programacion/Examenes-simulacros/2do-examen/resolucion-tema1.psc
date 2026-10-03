Algoritmo Evaluacion_Tema1
	Definir opc, amistosos Como Entero;
	amistosos = 0;
	opc = -1;
	
	Repetir
		MostrarMenu(opc);
		
		Segun opc Hacer
			1:
				IngresarAmistosos(amistosos);
			2:
				CalcularEfectividadPases(amistosos);
			3:
				BuscarPeorPosesion(amistosos);
			4:
				MostrarEstado(amistosos);
			0:
				// Fin del programa
		FinSegun

		Esperar Tecla;
	Mientras Que opc <> 0
FinAlgoritmo

SubProceso MostrarMenu(opc Por Referencia)
	Borrar Pantalla;
	Escribir "=== EVALUACIÓN SCALONETA 2026 ===";
	Escribir "1. Ingresar Cantidad de Amistosos Previos";
	Escribir "2. Calcular Efectividad de Pases";
	Escribir "3. Buscar Peor Posesión de Balón";
	Escribir "4. Ver Estado Actual";
	Escribir "0. Salir";
	Escribir "Ingrese una opción: ";
	Leer opc;
FinSubProceso

SubProceso IngresarAmistosos(amistosos Por Referencia)
	Repetir
		Escribir "Ingrese cantidad de amistosos previos (1-10): ";
		Leer amistosos;
		Si amistosos < 1 O amistosos > 10 Entonces
			Escribir "[Error] El valor debe estar entre 1 y 10.";
		FinSi
	Mientras Que amistosos < 1 O amistosos > 10
FinSubProceso

SubProceso CalcularEfectividadPases(amistosos)
	Definir pases, total_pases, esperado Como Entero;
	Definir porcentaje Como Real;
	total_pases = 0;
	
	Repetir
		Escribir "Ingrese pases en secuencia (0 para finalizar): ";
		Leer pases;
		total_pases = total_pases + pases;
	Mientras Que pases <> 0
	
	esperado = amistosos * 500;
	porcentaje = (total_pases / esperado) * 100;
	
	Escribir "Total pases logrados: ", total_pases;
	Escribir "Porcentaje sobre objetivo esperado (", esperado, " pases): ", porcentaje, "%";
FinSubProceso

SubProceso BuscarPeorPosesion(amistosos)
	Definir i, posesion, min_posesion, min_posicion Como Entero;
	min_posesion = 99999;
	min_posicion = 0;
	
	Para i = 1 Hasta amistosos Hacer
		Escribir "Ingrese % de posesión en partido ", i, ": ";
		Leer posesion;
		
		Si posesion < min_posesion Entonces
			min_posesion = posesion;
			min_posicion = i;
		FinSi
	FinPara
	
	Escribir "La posesión mínima fue ", min_posesion, "% en el partido ", min_posicion, ".";
FinSubProceso

SubProceso MostrarEstado(amistosos)
	Escribir "Amistosos registrados en el sistema: ", amistosos;
FinSubProceso
