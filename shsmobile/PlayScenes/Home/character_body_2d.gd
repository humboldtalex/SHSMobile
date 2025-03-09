extends CharacterBody2D

@export var speed = 600
@export var min_bound : Vector2 = Vector2(175, 560)
@export var max_bound : Vector2 = Vector2(900, 2400)

@onready var animation_player: AnimationPlayer = $SubViewportContainer/SubViewport/AnimalModel/AnimationPlayer
@onready var animal_model: Node3D = $SubViewportContainer/SubViewport/AnimalModel

var click_position = Vector2()
var target_position = Vector2()

func _physics_process(delta):
	if Input.is_action_just_pressed("click"):
		click_position = get_global_mouse_position()
		click_position.x = clampf(click_position.x, min_bound.x, max_bound.x)
		click_position.y = clampf(click_position.y, min_bound.y, max_bound.y)
		
	if position.distance_to(click_position) > 10:
		target_position = (click_position - position).normalized()
		velocity = target_position * speed
		move_and_slide()
		animation_player.play("walk")
		animal_model.rotation.y = -atan2(velocity.y, velocity.x) + (PI * 0.5)
	else:
		animation_player.play("idle")
