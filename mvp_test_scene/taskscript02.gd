extends Node2D

@export var zone = 0
@export var priority = 0
@export var coop = false

func taskInfoNow():
	return [zone, priority, coop]
