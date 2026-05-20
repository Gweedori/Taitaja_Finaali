extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(20).timeout
	AudioManager.task_complete.play()
	get_tree().change_scene_to_file("res://mvp_test_scene/test_scene_mvp_02.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
