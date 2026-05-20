extends Node2D
@onready var test_task: Node2D = $"."
@onready var taskmanager = test_task.get_parent()
@onready var area_2d: Area2D = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(5.0).timeout
	test_task.hide()
	area_2d.queue_free()
	await get_tree().create_timer(5.0).timeout
	taskmanager.spawn_test_task()
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	test_task.hide()
	area_2d.queue_free()
	await get_tree().create_timer(15.0).timeout
	taskmanager.spawn_test_task()
	queue_free()
