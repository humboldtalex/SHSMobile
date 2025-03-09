extends Area2D

var stage : int = 4

@onready var bed_sprite: Sprite2D = $FoodSprite
@onready var control: Control = $Control

@export var sprite_array : Array[Texture2D] = []
@export var cost_array : Array[int] = [
	12,
	24,
	36,
	50
]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		upgrade()
	if event.is_action_pressed("ui_down"):
		downgrade()

func _process(delta):
	stage = Global.bed_upgrade
	bed_sprite.texture = sprite_array[stage]
	
func upgrade():
	if stage == 4:
		print("too big")
	else:
		Global.bed_upgrade += 1

func downgrade():
	if stage <= 0:
		print("too small")
	else:
		Global.bed_upgrade -= 1

# COLLISION DETECTION
func _on_body_entered(body):
	if body is CharacterBody2D:
		control.show()
