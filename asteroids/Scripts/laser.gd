extends Area2D

var speed := 100
var direction := Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.scale =  Vector2(0,0)
	var tween = create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(1,1), 0.2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	
	pass
