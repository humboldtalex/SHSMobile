extends CharacterBody2D

@export var speed = 600
@export var min_bound : Vector2 = Vector2(175, 560)
@export var max_bound : Vector2 = Vector2(900, 2400)

@onready var animation_player: AnimationPlayer = $SubViewportContainer/SubViewport/AnimalModel/AnimationPlayer
@onready var animal_model: Node3D = $SubViewportContainer/SubViewport/AnimalModel
@onready var dog_ears: MeshInstance3D = $SubViewportContainer/SubViewport/AnimalModel/Armature/Skeleton3D/BoneAttachment3D/DogEars
@onready var cat_ears: MeshInstance3D = $SubViewportContainer/SubViewport/AnimalModel/Armature/Skeleton3D/BoneAttachment3D/CatEars
@onready var cube: MeshInstance3D = $SubViewportContainer/SubViewport/AnimalModel/Armature/Skeleton3D/Cube

const ANIMAL_BASE = preload("res://Characters/Animal/Textures/animal_base.tres")
var click_position = Vector2(540, 980)
var target_position = Vector2()

func _ready():
	if Global.cat_or_dog:
		cat_ears.hide()
		dog_ears.show()
	else:
		cat_ears.show()
		dog_ears.hide()
	cat_ears.material_override.albedo_color = Global.sec_color
	dog_ears.material_override.albedo_color = Global.sec_color
	cube.get_surface_override_material(0).albedo_color = Global.prim_color

func _physics_process(delta):
	if Input.is_action_pressed("click"):
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
