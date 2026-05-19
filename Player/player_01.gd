extends CharacterBody2D

@export var player = 1
@export var speed = 150.0

@onready var device = 0

func _ready() -> void:
	if player == 1:
		device = 0
	else:
		device = 1

func _physics_process(delta: float) -> void:
	var up = "input_up"
	var down = "input_down"
	var left = "input_left"
	var right = "input_right"
	if player == 2:
		up = "p2_up"
		down = "p2_down"
		left = "p2_left"
		right = "p2_right"
	
	var directionY := Input.get_axis(up, down)
	var directionX := Input.get_axis(left, right)
	if directionX || directionY:
		velocity.x = directionX * speed * delta * 100.0
		velocity.y = directionY * speed * delta * 100.0
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta * 100.0)
		velocity.y = move_toward(velocity.y, 0, speed * delta * 100.0)

	move_and_slide()
