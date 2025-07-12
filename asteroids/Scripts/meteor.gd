extends Area2D

var rotation_speed : int
var speed : float
var direction_x : float

signal collision

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	var random_x = rng.randi_range(-125, 125)
	var random_y = rng.randi_range(-150, -126)
	position = Vector2(random_x, random_y)
	
	speed = rng.randf_range(50, 100)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(1, 10)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation += rotation_speed * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	collision.emit()
	$AnimatedSprite2D.play("explosion")
	$AudioStreamPlayer2D.play()
	if body.name == "House2" or body.name == "House" or body.name == "House3":
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	$AnimatedSprite2D.play("explosion")
	$ExplosionTimer.start()
	$AudioStreamPlayer2D.play()
	area.queue_free()
	pass # Replace with function body.

func _on_explosion_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
