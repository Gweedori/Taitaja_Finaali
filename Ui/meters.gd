extends Control

@onready var forest_bar: ProgressBar = $Panel/VBoxContainer/ForestConatiner/ForestBar
@onready var camp_bar: ProgressBar = $Panel/VBoxContainer/CampContainer/CampBar
@onready var trail_bar: ProgressBar = $Panel/VBoxContainer/TrailContainer/TrailBar
@onready var meadow_bar: ProgressBar = $Panel/VBoxContainer/MeadowContainer/MeadowBar


func _process(_delta: float) -> void:
	camp_bar.value = GameManager.zone1Points
	trail_bar.value = GameManager.zone2Points
	meadow_bar.value = GameManager.zone3Points
