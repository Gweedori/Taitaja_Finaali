extends Node

@onready var zone1Points = 0
@onready var zone2Points = 0
@onready var zone3Points = 0

@onready var zone1Stage = 1
@onready var zone2Stage = 1
@onready var zone3Stage = 1

@onready var treeStage = 1
@onready var playerWaiting = false
@onready var waitingPlayernum = 0
@onready var playerStartedAlready = false

func waitingForOther(playerNum):
	if waitingPlayernum == 0:
		waitingPlayernum = playerNum
	elif waitingPlayernum != playerNum:
		print(waitingPlayernum)
		print(playerNum)
		playerStartedAlready = true
		return true
