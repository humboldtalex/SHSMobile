extends Area2D
@onready var fish_line: Line2D = $FishLine
@onready var sprite_2d: Sprite2D = $Sprite2D
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

func _physics_process(delta: float) -> void:
	_check_on_fish()
	#print(respawn)
	
	if speed == 0 && respawn == false:
		if Input.is_action_just_pressed("click"):
			#print(get_global_mouse_position())
			start_position = get_global_mouse_position()
			time = 0
		if Input.is_action_just_released("click"):
			#print(get_global_mouse_position())
			end_position = get_global_mouse_position()
			#print(time)
			#print(end_position - start_position)
			direction = (end_position - start_position)
			speed = direction.length() / time
			direction = direction.normalized()
			time = 0
			sprite_2d.rotation = direction.angle()
			fish_line.visible = true
			
			#fish_line.cr
	
func _process(delta):
	time = time + delta
	if speed > 0:
		global_position += direction * speed * delta / 2 	#Moves target
		speed -= 7000 * delta								#Target decceleration
		if time > 0.025:
			time = 0
			var r = speed / 125
			random_vector = Vector2(randf_range(-r,r),randf_range(-r,r))
			fish_line.add_point(START_POS - fish_line.global_position + random_vector)
			sprite_2d.scale -= Vector2(.005,.005)
		#print(speed)
		if speed < 50:		#Speed cutoff, below this point, target 'hits the water'
			speed = 0
			respawn = true
			sprite_2d.visible=false
	if respawn == true:		#countdown before respawning target
		delay -= delta
		if delay < 0:
			delay = 1
			respawn = false
			var line_len : int = fish_line.get_point_count()
			fish_line.visible = false
			global_position = START_POS
			sprite_2d.scale = Vector2(.25,.25)
			sprite_2d.visible=true

			for i in line_len-2:
				fish_line.remove_point(2)
	
func _check_on_fish() -> void:
	var bodies := get_overlapping_bodies()

	if bodies.is_empty() and on_fish: 
		on_fish = false
		target_exited.emit()
	elif not bodies.is_empty() and not on_fish: 
		on_fish = true
		target_entered.emit()
		
