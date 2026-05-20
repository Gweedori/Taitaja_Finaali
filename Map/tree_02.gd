extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	changeStage(1)
	#print(sprite.region_rect)

#[P: (0.0, 0.0), S: (112.0, 160.0)]
#[P: (112.0, 0.0), S: (112.0, 160.0)]
#[P: (112.0, 160.0), S: (112.0, 160.0)]


func changeStage(stage):
	match stage:
		1:
			sprite.region_rect.position = Vector2(0.0, 0.0)
		2:
			sprite.region_rect.position = Vector2(96.0, 0.0)
		3:
			sprite.region_rect.position = Vector2(96.0, 160.0)

func _process(_delta: float) -> void:
	changeStage(GameManager.treeStage)
