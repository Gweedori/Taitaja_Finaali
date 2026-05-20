extends Node2D
@onready var flower_task: Node2D = $"."
@onready var taskmanager = flower_task.get_parent()
@onready var task_area: Area2D = $TaskArea

@onready var bad_meadow: TileMapLayer = $BadMeadow
@onready var good_meadow: TileMapLayer = $GoodMeadow


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	good_meadow.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func task_done():
	bad_meadow.hide()
	good_meadow.show()
	$Exclamation.hide()
