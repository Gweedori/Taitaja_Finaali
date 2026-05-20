extends Node2D

@onready var task_manager: Node2D = $"."
@onready var test_task_pos: Marker2D = $test_task_pos
@onready var trash_task_pos: Marker2D = $trash_task_pos
const TEST_TASK = preload("uid://bgj4yn7rnrpaf")
const TRASH_TASK = preload("uid://b6g18beb3fl2y")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#spawn_test_task()
	spawn_trash_task()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_test_task():
	var test_task = TEST_TASK.instantiate()
	test_task.global_position = test_task_pos.global_position
	task_manager.add_child.call_deferred(test_task)

func spawn_trash_task():
	var trash_task = TRASH_TASK.instantiate()
	trash_task.global_position = trash_task_pos.global_position
	task_manager.add_child.call_deferred(trash_task)
