extends CanvasLayer

signal transitioned

var scene_path : String = ""

func _ready():
	$AnimationPlayer.play("fade_to_normal")
	show()

func transition_to_scene(path_to_scene : String):
	$AnimationPlayer.play("fade_to_black")
	scene_path = path_to_scene
	print("Fading to black")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		print("Emit signal transitioned")
		get_tree().change_scene_to_file(scene_path)
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
	if anim_name == "fade_to_normal":
		print("finished fading")
