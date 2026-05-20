extends Control

@onready var forest_bar: ProgressBar = $Panel/VBoxContainer/ForestConatiner/ForestBar
@onready var camp_bar: ProgressBar = $Panel/VBoxContainer/CampContainer/CampBar
@onready var trail_bar: ProgressBar = $Panel/VBoxContainer/TrailContainer/TrailBar
@onready var meadow_bar: ProgressBar = $Panel/VBoxContainer/MeadowContainer/MeadowBar

@onready var progress_bar: ProgressBar = $Panel2/ProgressBar
@onready var label: Label = $Panel2/ProgressBar/Label
@onready var timer: Timer = $Timer

func _ready() -> void:
	label.text = str(progress_bar.value)

func _process(_delta: float) -> void:
	camp_bar.value = GameManager.zone1Points
	trail_bar.value = GameManager.zone2Points
	meadow_bar.value = GameManager.zone3Points
	forest_bar.value = GameManager.zone1Points + GameManager.zone2Points + GameManager.zone3Points
	if camp_bar.value >= 10.0 and trail_bar.value <= 19.0:
		GameManager.zone1Stage = 2
	elif  camp_bar.value >= 20.0:
		GameManager.zone1Stage = 3
	
	if trail_bar.value >= 10.0 and trail_bar.value <= 19.0:
		GameManager.zone2Stage = 2
	elif  trail_bar.value >= 20.0:
		GameManager.zone2Stage = 3
	
	if meadow_bar.value >= 10.0 and trail_bar.value <= 19.0:
		GameManager.zone3Stage = 2
	elif  meadow_bar.value >= 20.0:
		GameManager.zone3Stage = 3

	if forest_bar.value >= 45.0:
		print("WIN GAME")
		get_tree().change_scene_to_file("res://screens/WinScreen.tscn")


func _on_timer_timeout() -> void:
	progress_bar.value -= 1
	label.text = str(progress_bar.value)
	if progress_bar.value <= 0.0:
		get_tree().change_scene_to_file("res://screens/endScreenLose.tscn")
