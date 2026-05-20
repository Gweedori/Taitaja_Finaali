extends Node2D

@onready var task_manager: Node2D = $"."
@onready var test_task_pos: Marker2D = $test_task_pos
@onready var trash_task_pos: Marker2D = $trash_task_pos
@onready var flower_task_pos: Marker2D = $flower_task_pos
@onready var naturepath_task_pos: Marker2D = $naturepath_task_pos

const TEST_TASK = preload("uid://bgj4yn7rnrpaf")
const TRASH_TASK = preload("uid://b6g18beb3fl2y")
const FLOWER_TASK = preload("uid://lvrx256scg4q")
const NATUREPATH_TASK = preload("uid://dimftpdsd0kux")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#spawn_test_task()
	spawn_trash_task()
	#spawn_flower_task()
	spawn_naturepath_task()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_test_task():
	var test_task = TEST_TASK.instantiate()
	test_task.global_position = test_task_pos.global_position
	task_manager.add_child.call_deferred(test_task)

func spawn_trash_task():
	var trash_task = TRASH_TASK.instantiate()
	trash_task.global_position = trash_task_pos.position
	task_manager.add_child.call_deferred(trash_task)
	
func spawn_flower_task():
	var flower_task = FLOWER_TASK.instantiate()
	flower_task.global_position = flower_task_pos.position
	task_manager.add_child.call_deferred(flower_task)

func spawn_naturepath_task():
	var naturepath_task = NATUREPATH_TASK.instantiate()
	naturepath_task.global_position = naturepath_task_pos.position
	task_manager.add_child.call_deferred(naturepath_task)
