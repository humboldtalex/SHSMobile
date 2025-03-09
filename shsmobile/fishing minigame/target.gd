extends Area2D

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

func _ready() -> void:
	START_POS = global_position

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
	
func _process(delta):
	time = time + delta
	if speed > 0:
		global_position += direction * speed * delta / 2 	#Moves target
		speed -= 7000 * delta								#Target deceleration
		#print(speed)
		if speed < 50:		#Speed cutoff, below this point, target 'hits the water'
			speed = 0
			respawn = true
	if respawn == true:		#countdown before respawning target
		delay -= delta
		if delay < 0:
			delay = 1
			respawn = false
			global_position = START_POS
	
func _check_on_fish() -> void:
	var bodies := get_overlapping_bodies()

	if bodies.is_empty() and on_fish: 
		on_fish = false
		target_exited.emit()
	elif not bodies.is_empty() and not on_fish: 
		on_fish = true
		target_entered.emit()
		
