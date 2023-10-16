"""
Realizado por Diego Alberto Parra Garzón
Simple calculadora 
Colombia - Bogotá D.C. 2023
"""
extends Node

var data_input_1 = []
var data_input_2 = []
var operations = 0
var decimalD = false

func convertir_lista_a_numero():
	var output = ""
	for i in data_input_1:
		output += str(i)
		print(output)
	return output
	
func convertir_numero_a_lista(numero):
	numero = str(numero)
	for i in numero:
		data_input_1.append(i)
	
	
func cargar_numero(numero):
	if data_input_1.size() == 0  && str(numero) != str(0):
		data_input_1.append(numero)
		$Pantalla/Respuesta.text = convertir_lista_a_numero()
	elif data_input_1.size() > 0 && data_input_1.size() < 10:
		data_input_1.append(numero)
		$Pantalla/Respuesta.text = convertir_lista_a_numero()
	else:
		pass
		
func _on_btn1_emitir_btn_clear(value):
	if value == "clear":
		data_input_1.clear()
		$Pantalla/Respuesta.text = "0"
		decimalD = false
	if value == "clear_last":
		if data_input_1.size() > 0:
			var paso = []
			for i in range (0, data_input_1.size() - 1, 1):
				paso.append(data_input_1[i])
			data_input_1.clear()
			data_input_1 = paso
			$Pantalla/Respuesta.text = convertir_lista_a_numero()
		if data_input_1.size() == 0:
			data_input_1.clear()
			$Pantalla/Respuesta.text = "0"
			decimalD = false
	if value == "menosmas":
		var num = float(convertir_lista_a_numero())
		print("numero a convertir: ", num)
		num = num*(-1)
		print("numero convertido: ", num)
		data_input_1.clear()
		convertir_numero_a_lista(num)
		$Pantalla/Respuesta.text = str(num)
		
			

func _on_btn1_emitir_btn_number(value):
	if str(value) == "dot":
		if decimalD == false:
			cargar_numero(".")
			decimalD = true
			print("decimal")
	else:
		cargar_numero(value)

func Operations():
	data_input_2.clear()
	for i in data_input_1:
		data_input_2.append(i)
	data_input_1.clear()
	$Pantalla/Respuesta.text = "0"
	print(data_input_2)
	print(data_input_1)

func _on_btn1_emitir_btn_operaciones(value):
	decimalD = false
	if value == "suma":
		operations = 1
		Operations()
	if value == "resta":
		operations = 2
		Operations()
	if value == "multiply":
		operations = 3
		Operations()
		
	if value == "divide":
		operations = 4
		Operations()
		
	if value == "equals":
		var output = 0
		var num1 = convertir_lista_a_numero()
		data_input_1.clear()
		for i in data_input_2:
			data_input_1.append(i)
		var num2 = convertir_lista_a_numero()
		if operations == 1 :
			output = float(num1) + float(num2)
			acciones_operaciones(output)
		if operations == 2:
			output = float(num2) - float(num1)
			acciones_operaciones(output)
		if operations == 3:
			output = float(num2) * float(num1)
			acciones_operaciones(output)
		if operations == 4:
			if float(num1) == 0:
				$Pantalla/Respuesta.text = "Error"
			elif float(num1) != 0:
				output = float(num2) / float(num1)
				acciones_operaciones(output)
				
func acciones_operaciones(output):
	data_input_2.clear()
	$Pantalla/Respuesta.text = str(round_to_decimals(output, 5))
	data_input_1.clear()
	data_input_2.clear()
	convertir_numero_a_lista(round(output))
	operations = 0

	
func round_to_decimals(number, decimal):
	var multiplier = pow(10, decimal)
	return round(number * multiplier) / multiplier

