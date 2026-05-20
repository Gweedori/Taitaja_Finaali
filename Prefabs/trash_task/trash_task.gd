extends Node2D
@onready var trash_task: Node2D = $"."
@onready var taskmanager = trash_task.get_parent()
@onready var area_2d: Area2D = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(5.0).timeout
	task_done()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func task_done():
	trash_task.hide()
	area_2d.queue_free()
	await get_tree().create_timer(randf_range(5, 20)).timeout
	taskmanager.spawn_trash_task()
	queue_free()
