Algoritmo UsinaLactea_Tema5
	Definir opc, silos, capacidad Como Entero
	silos <- 0
	capacidad <- 0
	opc <- -1
	Repetir
		MostrarMenu(opc)
		Segun opc Hacer
			1: IngresarDatos(silos, capacidad)
			2: ControlPasteurizacion(silos, capacidad)
			3: BuscarMejorSilo(silos)
			4: MostrarEstado(silos, capacidad)
			0: Escribir "Fin del programa."
			De Otro Modo: Escribir "[Error] Opcion invalida."
		FinSegun
		Si opc <> 0 Entonces
			Esperar Tecla
		FinSi
	Hasta Que opc = 0
FinAlgoritmo

SubProceso MostrarMenu(opc Por Referencia)
	Borrar Pantalla
	Escribir "=== USINA LACTEA LA SERENISIMA ==="
	Escribir "1. Ingresar Datos de Acopio"
	Escribir "2. Controlar Perdidas en Pasteurizacion"
	Escribir "3. Buscar Silo con Mejor Tenor Graso"
	Escribir "4. Ver Estado Actual"
	Escribir "0. Salir"
	Escribir "Ingrese una opcion: "
	Leer opc
FinSubProceso

SubProceso IngresarDatos(silos Por Referencia, capacidad Por Referencia)
	Repetir
		Escribir "Ingrese cantidad de silos de acopio (1-10): "
		Leer silos
		Si silos < 1 O silos > 10 Entonces
			Escribir "[Error] El valor debe estar entre 1 y 10."
		FinSi
	Hasta Que silos >= 1 Y silos <= 10
	Repetir
		Escribir "Ingrese capacidad por silo en litros (1000-30000): "
		Leer capacidad
		Si capacidad < 1000 O capacidad > 30000 Entonces
			Escribir "[Error] El valor debe estar entre 1000 y 30000."
		FinSi
	Hasta Que capacidad >= 1000 Y capacidad <= 30000
FinSubProceso

SubProceso ControlPasteurizacion(silos, capacidad)
	Definir descarte, totalDescartado, totalEsperado Como Entero
	Definir porcentaje Como Real
	Si silos = 0 Entonces
		Escribir "[Error] Primero debe ingresar los datos de acopio."
	SiNo
		totalDescartado <- 0
		Repetir
			Escribir "Ingrese litros descartados por control de acidez (-1 para finalizar): "
			Leer descarte
			Si descarte <> -1 Entonces
				Si descarte >= 0 Entonces
					totalDescartado <- totalDescartado + descarte
				SiNo
					Escribir "[Error] Ingrese un valor positivo o -1 para finalizar."
				FinSi
			FinSi
		Hasta Que descarte = -1
		totalEsperado <- silos * capacidad
		porcentaje <- totalDescartado * 100 / totalEsperado
		Escribir "Total descartado: ", totalDescartado, " litros"
		Escribir "Porcentaje de descarte sobre produccion esperada (", totalEsperado, " litros): ", porcentaje, "%"
		Si porcentaje < 1 Entonces
			Escribir "Calidad: PREMIUM - APTO EXPORTACION"
		SiNo
			Si porcentaje < 3 Entonces
				Escribir "Calidad: ESTANDAR"
			SiNo
				Escribir "Calidad: FUERA DE NORMA - AUDITORIA URGENTE"
			FinSi
		FinSi
	FinSi
FinSubProceso

SubProceso BuscarMejorSilo(silos)
	Definir i, litros, siloMejor, litrosMejor Como Entero
	Definir tenor, mayorTenor, premio Como Real
	Si silos = 0 Entonces
		Escribir "[Error] Primero debe ingresar los datos de acopio."
	SiNo
		mayorTenor <- -1
		Para i <- 1 Hasta silos Hacer
			Escribir "--- Silo ", i, " ---"
			Escribir "Litros procesados en silo ", i, ": "
			Leer litros
			Escribir "Tenor graso del silo ", i, " (g/L): "
			Leer tenor
			Si tenor > mayorTenor Entonces
				mayorTenor <- tenor
				siloMejor <- i
				litrosMejor <- litros
			FinSi
		FinPara
		premio <- litrosMejor * 720 * 0.08
		Escribir "El mayor tenor graso fue ", mayorTenor, " g/L en el silo ", siloMejor, "."
		Escribir "Premio al tambo del silo ", siloMejor, ": $", premio
	FinSi
FinSubProceso

SubProceso MostrarEstado(silos, capacidad)
	Escribir "Silos registrados: ", silos, " | Capacidad por silo: ", capacidad, " litros"
FinSubProceso
