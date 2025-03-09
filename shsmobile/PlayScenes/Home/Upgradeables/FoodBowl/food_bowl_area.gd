extends Area2D

var stage : int = 4

@onready var food_sprite: Sprite2D = $FoodSprite
@onready var control: Control = $Control

@export var sprite_array : Array[Texture2D] = []
@export var cost_array : Array[int] = [
	10,
	20,
	30,
	40
]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		upgrade()
	if event.is_action_pressed("ui_down"):
		downgrade()

func _process(delta):
	stage = Global.food_upgrade
	food_sprite.texture = sprite_array[stage]
	
func upgrade():
	if stage == 4:
		print("too big")
	else:
		Global.food_upgrade += 1

func downgrade():
	if stage <= 0:
		print("too small")
	else:
		Global.food_upgrade -= 1

# COLLISION DETECTION
func _on_body_entered(body):
	if body is CharacterBody2D:
		control.show()
