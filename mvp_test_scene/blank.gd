extends Node2D

@onready var label: Label = $Label
@onready var notools: Sprite2D = $Notools
@onready var tolls: Sprite2D = $Tolls
@onready var point: Sprite2D = $Point

func task_done():
	label.hide()
	tolls.show()
	notools.hide()
	point.hide()
