extends Control

@onready var start_button: Button = $VBoxContainer/StartButton
@onready var options_button: Button = $VBoxContainer/OptionsButton
@onready var credits_button: Button = $VBoxContainer/CreditsButton

func _ready():
	credits_button.connect("pressed", on_credits_pressed)
	options_button.connect("pressed", on_options_pressed)

func _process(delta):
	pass

func on_credits_pressed():
	get_tree().change_scene_to_file("res://Menus/Credits/credits.tscn")
	
func on_options_pressed():
	get_tree().change_scene_to_file("res://Menus/Options/options.tscn")
	
