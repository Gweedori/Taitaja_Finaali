extends Node2D

@onready var rootNode: Node2D = $"."
@onready var needle_sprite: Sprite2D = $NeedleSprite
@onready var meh_sprite: Sprite2D = $MehSprite
@onready var good_sprite: Sprite2D = $GoodSprite

@onready var needle_area: Area2D = $NeedleSprite/NeedleArea

@export var speed = 500.0

var moveNeedle = false
var direction = 1
var points = 0

@onready var needlePos = needle_sprite.position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(rootNode)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moveNeedle == true:
		
		if needle_area.get_overlapping_bodies():
			var overlapBody = needle_area.get_overlapping_bodies()[-1]
			var bodyName = overlapBody.name
			if rootNode == overlapBody.find_parent("TaskMinigame02"):
				#print("lasjhdlkasjdljaslkjdkl")
				match bodyName:
					"RightBody":
						direction = -1
					"LeftBody":
						direction = 1
			
		needle_sprite.position.x += speed * delta * direction
		

func startMinigame():
	moveNeedle = true
	
func stopMinigame():
	moveNeedle = false
	needle_sprite.position = needlePos
	if needle_area.get_overlapping_bodies():
		var overlapBody = needle_area.get_overlapping_bodies()[-1]
		var bodyName = overlapBody.name
		
		match bodyName:
			"MehBody":
				points = 1
			"GoodBody":
				points = 2
	print("Points: ",points)

#func _input(event: InputEvent) -> void:
	#if moveNeedle == true:
		#if event.is_action_pressed("input_interact"):
			#stopMinigame()
