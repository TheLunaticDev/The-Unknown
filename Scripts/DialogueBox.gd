extends ColorRect

signal dialogue_started
signal dialogue_ended
signal dialogue_skipped
signal dialogue_completed

var dialogues :Array[Dialogue]
var currentDialogue :Dialogue
var tween :Tween

@export var wpm :int
@export_dir var dialoguesLocation :String

func _ready() -> void:
	_load_dialogues()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("accept") && $Text.visible_ratio < 1.0:
		emit_signal("dialogue_skipped")
	elif Input.is_action_just_pressed("accept") && $Pointer.visible == true:
		if currentDialogue.nextDialogue < 0:
			emit_signal("dialogue_completed")
		else:
			get_dialogue(currentDialogue.nextDialogue)

func _load_dialogues() -> void:
	var allDialgoues = DirAccess.get_files_at(dialoguesLocation)
	for i in range(allDialgoues.size()):
		var location = dialoguesLocation + "/" + allDialgoues[i]
		dialogues.push_back(load(location))

func get_dialogue(id :int) -> void:
	for i in range(dialogues.size()):
		if id == dialogues[i].id:
			currentDialogue = dialogues[i]
			_show_dialogue(dialogues[i])

func _show_dialogue(dialogue :Dialogue):
	emit_signal("dialogue_started")
	$Name.text = dialogue.speaker
	$Potrait.texture = dialogue.expression
	$Text.text = dialogue.dialogue
	tween = get_tree().create_tween()
	tween.tween_property($Text, "visible_ratio", 1.0, $Text.get_total_character_count() / (wpm / 12.0))
	await tween.finished
	emit_signal("dialogue_ended")

func _on_dialogue_started() -> void:
	visible = true
	$Text.visible_ratio = 0
	$Pointer.visible = false

func _on_dialogue_ended() -> void:
	$Pointer.visible = true

func _on_dialogue_skipped() -> void:
	tween.stop()
	$Text.visible_ratio = 1.0
	emit_signal("dialogue_ended")

func _on_dialogue_completed() -> void:
	visible = false
