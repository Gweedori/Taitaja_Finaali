extends Node2D
@onready var test_task_pos: Marker2D = $test_task_pos
@onready var task_manager: Node2D = $"."

const TEST_TASK = preload("uid://bgj4yn7rnrpaf")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_test_task()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_test_task():
	var test_task = TEST_TASK.instantiate()
	test_task.global_position = test_task_pos.global_position
	task_manager.add_child.call_deferred(test_task)
