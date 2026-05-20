extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_music_slider_value_changed(value: float) -> void:
	var bus_idx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value))


func _on_sfx_slider_value_changed(value: float) -> void:
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value))


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")
	AudioManager.menu_back.play()


func _on_music_slider_drag_ended(value_changed: bool) -> void:
	AudioManager.menu_select.play()


func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	AudioManager.menu_select.play()
