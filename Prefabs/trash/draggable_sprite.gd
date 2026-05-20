extends Sprite2D
@onready var trash_can: Node2D = $"../TrashCan"

var is_dragging = false
var mouse_offset # center mouse
var delay = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_dragging == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position(), delay * delta)
	if trash_can.mouseincan == true and is_dragging:
		print("dead")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				is_dragging = true
		else:
			is_dragging = false
