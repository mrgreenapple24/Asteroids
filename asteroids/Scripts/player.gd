extends CharacterBody2D

const SPEED = 100
signal laser(pos: Vector2)

func _ready() -> void:
	position = Vector2(0, 0)

func _physics_process(_delta: float) -> void:
	var DIRECTION = Input.get_vector("left", "right", "up", "down")
	
	velocity = SPEED * DIRECTION
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		laser.emit(position)
		$AudioStreamPlayer2D.play()
