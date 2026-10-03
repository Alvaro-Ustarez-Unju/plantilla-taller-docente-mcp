Algoritmo CerveceriaQuilmes_Tema4
	Definir opc, stock, stockInicial, operarios Como Entero
	stock <- 0
	stockInicial <- 0
	operarios <- 0
	opc <- -1
	Repetir
		MostrarMenu(opc)
		Segun opc Hacer
			1: IngresarDatos(stock, stockInicial, operarios)
			2: ProcesarDespacho(stock, stockInicial)
			3: BuscarMejorOperario(stock, operarios)
			4: MostrarEstado(stock, operarios)
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
	Escribir "=== CERVECERIA QUILMES - PLANTA DE ENVASADO ==="
	Escribir "1. Ingresar Datos de Planta"
	Escribir "2. Procesar Despacho de Barriles"
	Escribir "3. Buscar Mejor Operario y Bonificacion"
	Escribir "4. Ver Estado Actual"
	Escribir "0. Salir"
	Escribir "Ingrese una opcion: "
	Leer opc
FinSubProceso

SubProceso IngresarDatos(stock Por Referencia, stockInicial Por Referencia, operarios Por Referencia)
	Repetir
		Escribir "Ingrese stock inicial de barriles (100-4000): "
		Leer stockInicial
		Si stockInicial < 100 O stockInicial > 4000 Entonces
			Escribir "[Error] El valor debe estar entre 100 y 4000."
		FinSi
	Hasta Que stockInicial >= 100 Y stockInicial <= 4000
	stock <- stockInicial
	Repetir
		Escribir "Ingrese cantidad de operarios de etiquetado (2-12): "
		Leer operarios
		Si operarios < 2 O operarios > 12 Entonces
			Escribir "[Error] El valor debe estar entre 2 y 12."
		FinSi
	Hasta Que operarios >= 2 Y operarios <= 12
FinSubProceso

SubProceso ProcesarDespacho(stock Por Referencia, stockInicial)
	Definir despacho Como Entero
	Definir porcentaje Como Real
	Si stockInicial = 0 Entonces
		Escribir "[Error] Primero debe ingresar los datos de la planta."
	SiNo
		Mientras stock >= 50 Hacer
			Escribir "Ingrese barriles a despachar: "
			Leer despacho
			Si despacho <= 0 Entonces
				Escribir "[Error] La cantidad debe ser mayor a cero."
			SiNo
				Si despacho > stock Entonces
					Escribir "[Error] No hay suficiente stock. Stock actual: ", stock
				SiNo
					stock <- stock - despacho
					Escribir "Stock restante: ", stock, " barriles"
				FinSi
			FinSi
		FinMientras
		Escribir "[Alerta] El stock bajo del umbral de 50 barriles."
		porcentaje <- (stockInicial - stock) * 100 / stockInicial
		Escribir "Porcentaje consumido sobre stock inicial: ", porcentaje, "%"
		Si porcentaje > 75 Entonces
			Escribir "REPOSICION URGENTE: ALERTA DE STOCK"
		SiNo
			Escribir "Stock dentro de parametros"
		FinSi
	FinSi
FinSubProceso

SubProceso BuscarMejorOperario(stock, operarios)
	Definir i, tiempo, menorTiempo Como Entero
	Definir nombre, mejorOperario Como Caracter
	Definir bonificacion Como Real
	Si operarios = 0 Entonces
		Escribir "[Error] Primero debe ingresar los datos de la planta."
	SiNo
		menorTiempo <- 999999
		Para i <- 1 Hasta operarios Hacer
			Escribir "Nombre del operario ", i, ": "
			Leer nombre
			Repetir
				Escribir "Tiempo de etiquetado de ", nombre, " (seg): "
				Leer tiempo
			Hasta Que tiempo > 0
			Si tiempo < menorTiempo Entonces
				menorTiempo <- tiempo
				mejorOperario <- nombre
			FinSi
		FinPara
		bonificacion <- stock * 45000 * 0.03
		Escribir "El mejor tiempo fue de ", mejorOperario, " con ", menorTiempo, " segundos."
		Escribir "Bonificacion otorgada: $", bonificacion
	FinSi
FinSubProceso

SubProceso MostrarEstado(stock, operarios)
	Escribir "Stock registrado: ", stock, " barriles | Operarios: ", operarios
FinSubProceso
