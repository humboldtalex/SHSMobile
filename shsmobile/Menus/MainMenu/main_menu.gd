extends Control

@onready var start_button: Button = $VBoxContainer/StartButton
@onready var options_button: Button = $VBoxContainer/OptionsButton
@onready var credits_button: Button = $VBoxContainer/CreditsButton
@onready var transition_screen: CanvasLayer = $"Transition Screen"

func _ready():
	credits_button.connect("pressed", on_credits_pressed)
	options_button.connect("pressed", on_options_pressed)
	start_button.connect("pressed", on_start_pressed)
	MenuThemeStream.play()

func _process(delta):
	pass

func on_credits_pressed():
	transition_screen.transition_to_scene("res://Menus/Credits/credits.tscn")
	
func on_options_pressed():
	transition_screen.transition_to_scene("res://Menus/Options/options.tscn")
	
func on_start_pressed():
	transition_screen.transition_to_scene("res://PlayScenes/Home/home.tscn")
	
