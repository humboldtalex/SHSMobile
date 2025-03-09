extends CharacterBody2D

@export var speed = 600
@onready var animation_player: AnimationPlayer = $SubViewportContainer/SubViewport/AnimalModel/AnimationPlayer
@onready var animal_model: Node3D = $SubViewportContainer/SubViewport/AnimalModel

var click_position = Vector2()
var target_position = Vector2()

func _physics_process(delta):
	if Input.is_action_just_pressed("tap"):
		click_position = get_global_mouse_position()
		print(click_position)
		
	if position.distance_to(click_position) > 10:
		target_position = (click_position - position).normalized()
		velocity = target_position * speed
		move_and_slide()
		animation_player.play("walk")
		animal_model.rotation.y = -atan2(velocity.y, velocity.x) + (PI * 0.5)
	else:
		animation_player.play("idle")
