Algoritmo RefineriaYPF_Tema3
	Definir opc, tanques, capacidad Como Entero
	tanques <- 0
	capacidad <- 0
	opc <- -1
	Repetir
		MostrarMenu(opc)
		Segun opc Hacer
			1: IngresarDatos(tanques, capacidad)
			2: ControlMermas(tanques, capacidad)
			3: BuscarMejorCaudal(tanques)
			4: MostrarEstado(tanques, capacidad)
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
	Escribir "=== REFINERIA YPF - CONTROL DE BOMBEO ==="
	Escribir "1. Ingresar Datos de Refineria"
	Escribir "2. Controlar Mermas en Bombeo"
	Escribir "3. Buscar Tanque con Mejor Caudal"
	Escribir "4. Ver Estado Actual"
	Escribir "0. Salir"
	Escribir "Ingrese una opcion: "
	Leer opc
FinSubProceso

SubProceso IngresarDatos(tanques Por Referencia, capacidad Por Referencia)
	Repetir
		Escribir "Ingrese cantidad de tanques operativos (1-15): "
		Leer tanques
		Si tanques < 1 O tanques > 15 Entonces
			Escribir "[Error] El valor debe estar entre 1 y 15."
		FinSi
	Hasta Que tanques >= 1 Y tanques <= 15
	Repetir
		Escribir "Ingrese capacidad por tanque en m3 (200-5000): "
		Leer capacidad
		Si capacidad < 200 O capacidad > 5000 Entonces
			Escribir "[Error] El valor debe estar entre 200 y 5000."
		FinSi
	Hasta Que capacidad >= 200 Y capacidad <= 5000
FinSubProceso

SubProceso ControlMermas(tanques, capacidad)
	Definir merma, totalMermas, totalEsperado Como Entero
	Definir porcentaje Como Real
	Si tanques = 0 Entonces
		Escribir "[Error] Primero debe ingresar los datos de la refineria."
	SiNo
		totalMermas <- 0
		Repetir
			Escribir "Ingrese mermas detectadas en m3 (-1 para finalizar): "
			Leer merma
			Si merma <> -1 Entonces
				Si merma >= 0 Entonces
					totalMermas <- totalMermas + merma
				SiNo
					Escribir "[Error] Ingrese un valor positivo o -1 para finalizar."
				FinSi
			FinSi
		Hasta Que merma = -1
		totalEsperado <- tanques * capacidad
		porcentaje <- totalMermas * 100 / totalEsperado
		Escribir "Total mermas: ", totalMermas, " m3"
		Escribir "Porcentaje de merma sobre volumen esperado (", totalEsperado, " m3): ", porcentaje, "%"
		Si porcentaje < 1.5 Entonces
			Escribir "Estado de bombeo: OPTIMO"
		SiNo
			Si porcentaje < 4 Entonces
				Escribir "Estado de bombeo: ACEPTABLE"
			SiNo
				Escribir "Estado de bombeo: CRITICO"
			FinSi
		FinSi
	FinSi
FinSubProceso

SubProceso BuscarMejorCaudal(tanques)
	Definir i, volumen, horas, tanqueMejor, volumenMejor Como Entero
	Definir caudal, mayorCaudal, liquidacion Como Real
	Si tanques = 0 Entonces
		Escribir "[Error] Primero debe ingresar los datos de la refineria."
	SiNo
		mayorCaudal <- -1
		Para i <- 1 Hasta tanques Hacer
			Escribir "--- Tanque ", i, " ---"
			Escribir "Volumen despachado en tanque ", i, " (m3): "
			Leer volumen
			Repetir
				Escribir "Horas de bombeo del tanque ", i, ": "
				Leer horas
			Hasta Que horas > 0
			caudal <- volumen / horas
			Escribir "Caudal tanque ", i, ": ", caudal, " m3/h"
			Si caudal > mayorCaudal Entonces
				mayorCaudal <- caudal
				tanqueMejor <- i
				volumenMejor <- volumen
			FinSi
		FinPara
		liquidacion <- volumenMejor * 850000 * 0.10
		Escribir "El mayor caudal fue ", mayorCaudal, " m3/h en el tanque ", tanqueMejor, "."
		Escribir "Liquidacion fiscal: $", liquidacion
	FinSi
FinSubProceso

SubProceso MostrarEstado(tanques, capacidad)
	Escribir "Tanques registrados: ", tanques, " | Capacidad por tanque: ", capacidad, " m3"
FinSubProceso
