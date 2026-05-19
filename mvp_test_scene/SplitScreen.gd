extends Control

@onready var left_sub_viewport: SubViewport = $HBoxContainer/LeftSubViewportContainer/LeftSubViewport
@onready var right_sub_viewport: SubViewport = $HBoxContainer/RightSubViewportContainer/RightSubViewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var world = left_sub_viewport.find_world_2d()
	
	# give it to render to the viewport of Player 2
	right_sub_viewport.world_2d = world


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
