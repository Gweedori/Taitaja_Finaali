extends Node

@export var zone = 0
@export var priority = 0
@export var coop = false

@onready var taskDone = false
@onready var playersInTask = 0

func _getTaskInfo():
	return [taskDone, zone, priority, coop]

func makeTaskDone():
	taskDone = true
	#print("Remember to change makeTaskDone back to true")

func playerJoin():
	playersInTask += 1
	#print("players: ",playersInTask)
