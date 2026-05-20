extends Node2D
var playerinarea = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerinarea and Input.is_action_just_pressed("input_interact"):
		get_tree().quit()

func _on_player_detector_body_entered(body: Node2D) -> void:
	playerinarea = true


func _on_player_detector_body_exited(body: Node2D) -> void:
	playerinarea = false
