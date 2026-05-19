extends CharacterBody2D

@onready var interact_area: Area2D = $InteractArea

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

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("input_interact"):
		if not interact_area.get_overlapping_areas().is_empty():
			var overlapArea = interact_area.get_overlapping_areas()[0]
			if overlapArea.name == "TaskArea":
				var taskInfo = overlapArea._getTaskInfo()
				var taskZone = taskInfo[0]
				var taskPriority = taskInfo[1]
				var taskCoop = taskInfo[2]
				print(taskInfo)
				
