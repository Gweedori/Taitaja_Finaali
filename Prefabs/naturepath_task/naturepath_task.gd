extends Node2D
@onready var nestingbox_task: Node2D = $"."
@onready var taskmanager = nestingbox_task.get_parent()
@onready var task_area: Area2D = $TaskArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func task_done():
	nestingbox_task.hide()
	#task_area.queue_free() #Currently causes lack of area data for 2nd completing player.
	await get_tree().create_timer(randf_range(20, 100)).timeout
	taskmanager.spawn_nestingbox_task()
	queue_free()
	$Exclamation.hide()
