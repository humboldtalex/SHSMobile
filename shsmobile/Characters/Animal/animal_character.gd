class_name AnimalCharacter
extends CharacterBody2D

@export var speed = 600

@onready var animal_model: Node3D = $ModelViewer/SubViewport/AnimalModel
@onready var animation_player: AnimationPlayer = $ModelViewer/SubViewport/AnimalModel/AnimationPlayer

var click_position = Vector2()
var target_position = Vector2()

func _ready() -> void:
	animation_player.play("idle")

func _physics_process(delta):
	if Input.is_action_just_pressed("tap"):
		click_position = get_global_mouse_position()
		print(click_position)
		
	if position.distance_to(click_position) > 15:
			target_position = (click_position - position).normalized()
			velocity = target_position * speed
			animation_player.play("walk")
			
			move_and_slide()
			animal_model.rotation.y = -atan2(velocity.y, velocity.x) + (0.5 * PI)
	else:
		animation_player.play("idle")
