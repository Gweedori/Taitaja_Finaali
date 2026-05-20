extends Node

@export var zone = 0
@export var priority = 0
@export var coop = false

@onready var taskDone = false

func _getTaskInfo():
	return [taskDone, zone, priority, coop]

func makeTaskDone():
	taskDone = true
