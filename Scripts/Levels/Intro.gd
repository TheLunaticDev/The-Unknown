extends Control

signal intro_ended

func _ready() -> void:
	$InitialPause.start()


func _on_initial_pause_timeout() -> void:
	$DialogueBox.get_dialogue(0)


func _on_dialogue_box_dialogue_completed() -> void:
	emit_signal("intro_ended")
