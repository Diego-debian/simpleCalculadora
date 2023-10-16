"""
Realizado por Diego Alberto Parra Garzón
Simple calculadora 
Colombia - Bogotá D.C. 2023
"""

extends Node

signal emitir_btn_clear
signal emitir_btn_number
signal emitir_btn_operaciones
signal emitir_btn_coma

var option = 0

func _on_BtnClear_pressed():
	$BtnClear.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_clear", "clear")
	Mostrar_Operaciones()


func _on_BtnLast_pressed():
	$BtnClear.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_clear", "clear_last")


func _on_Btn9_pressed():
	$Btn9.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 9)

func _on_Btn8_pressed():
	$Btn8.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 8)

func _on_Btn7_pressed():
	$Btn7.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 7)


func _on_Btn6_pressed():
	$Btn6.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 6)


func _on_Btn5_pressed():
	$Btn5.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 5)

func _on_Btn4_pressed():
	$Btn4.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 4)

func _on_Btn3_pressed():
	$Btn3.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 3)

func _on_Btn2_pressed():
	$Btn2.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 2)

func _on_Btn1_pressed():
	$Btn1.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 1)

func _on_Btn0_pressed():
	$Btn0.get_icon("res://Assets/Buttons/btn_selected.png")
	emit_signal("emitir_btn_number", 0)

func _on_BtnDot_pressed():
	emit_signal("emitir_btn_number", "dot")
	$BtnDot.visible = false
	
func Mostrar_Operaciones():
	option = 0
	$BtnDot.visible = true
	$BtnAdd.visible = true
	$BtnEquals.visible = true
	$BtnMenus.visible = true
	$BtnMultiply.visible = true
	$BtnDivide.visible = true
	
	
func operaciones():
	if option	== 1:
		Mostrar_Operaciones()
		$BtnAdd.visible = false
		emit_signal("emitir_btn_operaciones", "suma")
		
	if option == 2:
		Mostrar_Operaciones()
		$BtnMenus.visible = false
		emit_signal("emitir_btn_operaciones", "resta")
	if option == 3:
		Mostrar_Operaciones()
		$BtnMultiply.visible = false
		emit_signal("emitir_btn_operaciones", "multiply")
	if option == 4: 
		Mostrar_Operaciones()
		$BtnDivide.visible = false
		emit_signal("emitir_btn_operaciones", "divide")
		
	if option == 5:
		emit_signal("emitir_btn_operaciones", "equals")
		Mostrar_Operaciones()
		$BtnEquals.visible = false
		


func _on_BtnAdd_pressed():
	option = 1
	operaciones()
	

func _on_BtnMenus_pressed():
	option = 2
	operaciones()


func _on_BtnMultiply_pressed():
	option = 3
	operaciones()
	


func _on_BtnDivide_pressed():
	option = 4
	operaciones()


func _on_BtnEquals_pressed():
	option = 5
	operaciones()
	




func _on_BtnAddMenus_pressed():
	emit_signal("emitir_btn_clear", "menosmas")
