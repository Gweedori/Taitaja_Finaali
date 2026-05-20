extends CharacterBody2D

@onready var interact_area: Area2D = $InteractArea
@onready var taskMinigame: Node2D = $TaskMinigame02

@export var player = 1
@export var speed = 150.0

@onready var device = 0

var taskStarted = false
var points = 0
var playerLock = false

func _ready() -> void:
	taskMinigame.hide()
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
		
	if playerLock == false:
		move_and_slide()

func _input(event: InputEvent) -> void:
	var interact = "input_interact"
	if player == 2:
		interact = "p2_interact"
	if event.is_action_pressed(interact):
		if taskStarted == true:
			points = taskMinigame.stopMinigame()
			taskMinigame.hide()
		if not interact_area.get_overlapping_areas().is_empty():
			var overlapAreasArray = interact_area.get_overlapping_areas()
			var overlapArea = overlapAreasArray[0]
			for i in range(overlapAreasArray.size()):
				if overlapAreasArray[i].name == "TaskArea":
					overlapArea = overlapAreasArray[i]
			if taskStarted == true:
				var taskInfo = overlapArea._getTaskInfo()
				var taskZone = taskInfo[1]
				overlapArea.makeTaskDone()
				match taskZone:
					1:
						GameManager.zone1Points = points
					2:
						GameManager.zone2Points = points
					3:
						GameManager.zone3Points = points
				points = 0
				taskStarted = false
				playerLock = false
			if overlapArea.name == "TaskArea" and taskStarted == false:
				var taskInfo = overlapArea._getTaskInfo()
				var taskDone = taskInfo[0]
				var taskZone = taskInfo[1]
				var taskPriority = taskInfo[2]
				var taskCoop = taskInfo[3]
				print(taskInfo)
				if taskDone == false:
					overlapArea.playerJoin()
					#overlapArea.makeTaskDone()
					taskStarted = true
					taskMinigame.startMinigame()
					playerLock = true
					taskMinigame.show()
		
