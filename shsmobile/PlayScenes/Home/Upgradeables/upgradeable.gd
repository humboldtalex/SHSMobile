class_name Upgradeable
extends Area2D

var stage : int = 4

@onready var food_sprite: Sprite2D = $FoodSprite

@export var sprite_array : Array[Texture2D] = []
@export var cost_array : Array[int] = [
	10,
	20,
	30,
	40,
	50
]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		upgrade()

func _process(delta):
	stage = Global.food_upgrade
	food_sprite.texture = sprite_array[stage]
	
func upgrade():
	Global.food_upgrade += 1
