extends Node2D

var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser.tscn")
var health := 3
var time_elapsed := 0
static var image = load("res://Assets/SPRITES AND SFX/SPRITES/EXTRA_LIFE.png")

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	
	meteor.connect('collision', _on_meteor_collision)
	pass # Replace with function body.

func _on_meteor_collision():
	health -= 1
	for child in $HBoxContainer.get_children():
		child.queue_free()
	
	for i in health:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$HBoxContainer.add_child(text_rect)
		
	if health == 0:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")
		
	pass

func _on_player_laser(pos: Vector2) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	pass # Replace with function body.


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$Score.text = "Score: " + str(time_elapsed)
	Global.score = time_elapsed
	pass # Replace with function body.
