extends Node

@onready var test_task: Node2D = $".."

@onready var zone = 0
@onready var priority = 0
@onready var coop = false

@onready var taskDone = false
@onready var playersInTask = 0

func _ready() -> void:
	var taskArray = test_task.taskInfoNow()
	zone = taskArray[0]
	priority = taskArray[1]
	coop = taskArray[2]

func _getTaskInfo():
	return [taskDone, zone, priority, coop]

func makeTaskDone():
	taskDone = true
	#print("Remember to change makeTaskDone back to true")

func playerJoin():
	playersInTask += 1
	#print("players: ",playersInTask)
