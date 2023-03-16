extends Resource

class_name Dialogue

@export var id :int # Id starts with 1 and goes up. Id with 0 means null
@export var speaker :String
@export var expression :Texture2D
@export_multiline var dialogue :String
@export var nextDialogue :int
@export var prevDialogue :int
