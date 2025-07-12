extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CenterContainer/VBoxContainer/Score.text = "Score: " + str(Global.score)
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		$AudioStreamPlayer2D.play()
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/world.tscn")
