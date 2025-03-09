extends Area2D
@onready var fish_line: Line2D = $FishLine
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var fish_array:Array[Fish]
@onready var label1: Label = $Label1
@onready var label2: Label = $Label2

signal target_entered()
signal target_exited()

var speed := 0
var START_POS := Vector2.ZERO
var start_position := Vector2.ZERO
var end_position := Vector2.ZERO
var time : float= 0
var direction := Vector2.ZERO
var on_fish := false
var delay : float = 1
var respawn : bool = false
var random_vector : Vector2 = Vector2.ZERO


func _ready() -> void:
	START_POS = global_position
	fish_line.visible = false


func _process(delta):
	if speed == 0 && respawn == false:
			if Input.is_action_just_pressed("click"):
				start_position = get_global_mouse_position()
				time = 0
			if Input.is_action_just_released("click"):
				end_position = get_global_mouse_position()
				direction = (end_position - start_position)
				speed = direction.length() / time
				direction = direction.normalized()
				time = 0
				sprite_2d.rotation = direction.angle() 
				fish_line.visible = true
	time = time + delta
	if speed > 0:
		global_position += direction * speed * delta / 2 	#Moves target
		speed -= 7000 * delta								#Target decceleration
		if global_position.x < 0 or global_position.x > 1080 or global_position.y < 0 or global_position.y > 2400:
			respawn = true
			delay = 0.5
			speed = 0
		if time > 0.025:
			time = 0
			var r = speed / 150
			random_vector = Vector2(randf_range(-r,r),200)
			fish_line.add_point(START_POS - fish_line.global_position + random_vector)
			sprite_2d.scale -= Vector2(.02,.02)
		#print(speed)
		if speed < 50:		#Speed cutoff, below this point, target 'hits the water'
			speed = 0
			respawn = true
			_check_on_fish()
	if respawn == true:		#countdown before respawning target
		delay -= delta
		
		if delay < 0:
			delay = 1
			respawn = false
			var line_len : int = fish_line.get_point_count()
			fish_line.visible = false
			global_position = START_POS
			sprite_2d.scale = Vector2(.75,.75)
			_check_on_fish()

			for i in line_len-2:
				fish_line.remove_point(2)
	
func _check_on_fish() -> void:
	if not respawn: 
		sprite_2d.scale = Vector2(.75,.75)
		#sprite_2d.position -= Vector2(50,0)
		target_exited.emit()
		sprite_2d.texture = load("res://fishing minigame/assets/bobber.png")
		label1.visible = false
		label2.visible=false
		sprite_2d.rotation = 0
	elif not get_overlapping_bodies().is_empty() and respawn: 
		var fish_selector : int = randf_range(0,100)
		
		var index : int = 0
		if fish_selector<8 :

			index = 0
		elif fish_selector<18 :
			index = 1
		elif fish_selector<23 :
			index =2
		elif fish_selector<27 :
			index =3
		elif fish_selector<44 :
			index =4
		elif fish_selector<52 :
			index =5
		elif fish_selector<65:
			index =6
		elif fish_selector<71:
			index =7
		elif fish_selector<97:
			index =8
		elif fish_selector<100:
			index =9
		delay = 3
		
		#sprite_2d.texture = load("res://fishing minigame/assets/crosshair026.png")
		sprite_2d.texture = fish_array[index].fish_sprite
		label1.text = fish_array[index].fish_species
		label2.text = str(fish_array[index].fish_price)
		label2.text+=" Tokens!"
		Global.tokens += fish_array[index].fish_price
		label1.visible = true
		label2.visible=true
		sprite_2d.scale = Vector2(1,1)
		sprite_2d.position = Vector2.ZERO
		sprite_2d.offset = Vector2(0,100)
		
		target_entered.emit()
		
