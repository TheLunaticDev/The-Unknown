extends Control

@export var message :String

signal confirmed(String)

func _ready() -> void:
	$VBoxContainer/Message.text = message
	$VBoxContainer/Response.text = ""

func _on_button_pressed() -> void:
	$VBoxContainer/Response.text += "1"

func _on_button_2_pressed() -> void:
	$VBoxContainer/Response.text += "2"

func _on_button_3_pressed() -> void:
	$VBoxContainer/Response.text += "3"

func _on_button_4_pressed() -> void:
	$VBoxContainer/Response.text += "4"

func _on_button_5_pressed() -> void:
	$VBoxContainer/Response.text += "5"

func _on_button_6_pressed() -> void:
	$VBoxContainer/Response.text += "6"

func _on_button_7_pressed() -> void:
	$VBoxContainer/Response.text += "7"

func _on_button_8_pressed() -> void:
	$VBoxContainer/Response.text += "8"

func _on_button_9_pressed() -> void:
	$VBoxContainer/Response.text += "9"

func _on_button_10_pressed() -> void:
	$VBoxContainer/Response.text += "0"

func _on_button_11_pressed() -> void:
	$VBoxContainer/Response.text += "Q"

func _on_button_12_pressed() -> void:
	$VBoxContainer/Response.text += "W"

func _on_button_13_pressed() -> void:
	$VBoxContainer/Response.text += "E"

func _on_button_14_pressed() -> void:
	$VBoxContainer/Response.text += "R"

func _on_button_15_pressed() -> void:
	$VBoxContainer/Response.text += "T"

func _on_button_16_pressed() -> void:
	$VBoxContainer/Response.text += "Y"

func _on_button_17_pressed() -> void:
	$VBoxContainer/Response.text += "U"

func _on_button_18_pressed() -> void:
	$VBoxContainer/Response.text += "I"

func _on_button_19_pressed() -> void:
	$VBoxContainer/Response.text += "O"

func _on_button_20_pressed() -> void:
	$VBoxContainer/Response.text += "P"

func _on_button_21_pressed() -> void:
	$VBoxContainer/Response.text += "A"

func _on_button_22_pressed() -> void:
	$VBoxContainer/Response.text += "S"

func _on_button_23_pressed() -> void:
	$VBoxContainer/Response.text += "D"

func _on_button_24_pressed() -> void:
	$VBoxContainer/Response.text += "F"

func _on_button_25_pressed() -> void:
	$VBoxContainer/Response.text += "G"

func _on_button_26_pressed() -> void:
	$VBoxContainer/Response.text += "H"

func _on_button_27_pressed() -> void:
	$VBoxContainer/Response.text += "J"

func _on_button_28_pressed() -> void:
	$VBoxContainer/Response.text += "K"

func _on_button_29_pressed() -> void:
	$VBoxContainer/Response.text += "L"

func _on_button_30_pressed() -> void:
	$VBoxContainer/Response.text += "'"

func _on_button_31_pressed() -> void:
	$VBoxContainer/Response.text += "Z"

func _on_button_32_pressed() -> void:
	$VBoxContainer/Response.text += "X"

func _on_button_33_pressed() -> void:
	$VBoxContainer/Response.text += "C"

func _on_button_34_pressed() -> void:
	$VBoxContainer/Response.text += "V"

func _on_button_35_pressed() -> void:
	$VBoxContainer/Response.text += "B"

func _on_button_36_pressed() -> void:
	$VBoxContainer/Response.text += "N"

func _on_button_37_pressed() -> void:
	$VBoxContainer/Response.text += "M"

func _on_button_38_pressed() -> void:
	var string :String
	string = $VBoxContainer/Response.text
	string = string.left(string.length() - 1)
	$VBoxContainer/Response.text = string

func _on_button_39_pressed() -> void:
	$VBoxContainer/Response.text += " "

func _on_button_40_pressed() -> void:
	$VBoxContainer/Response.text = ""

func _on_confirm_pressed() -> void:
	emit_signal("confirmed", $VBoxContainer/Response.text)
