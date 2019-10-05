extends Node

# global variables here

func _ready()->void:
	randomize()

func _input(event: InputEvent)->void:
	# Close the game on ESC
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_reset"):
		get_tree().reload_current_scene()