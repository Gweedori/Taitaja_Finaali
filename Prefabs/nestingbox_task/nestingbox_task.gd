extends Node2D
@onready var nestingbox_task: Node2D = $"."
@onready var task_area: Area2D = $TaskArea

@onready var bad_box: TileMapLayer = $BadBox
@onready var good_box: TileMapLayer = $GoodBox



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	good_box.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func task_done():
	bad_box.hide()
	good_box.show()
