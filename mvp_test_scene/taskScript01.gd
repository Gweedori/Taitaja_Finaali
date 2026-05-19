extends Node

@export var zone = 0
@export var priority = 0
@export var coop = false

func _getTaskInfo():
	return [zone, priority, coop]
