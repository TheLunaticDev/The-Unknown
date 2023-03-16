extends Resource

class_name Item

@export var id :int
@export var name :String
@export_multiline var description :String
@export var texture :Texture2D
@export var amount :int : set = _set_amount
@export var maxAmount :int
@export var value :int

func discard(quantity := 1) -> int:
	amount -= quantity
	return amount

func _set_amount(value :int):
	if (value < 0):
		amount = 0
	elif (value > maxAmount):
		amount = maxAmount
	else:
		amount = value
