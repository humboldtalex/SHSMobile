extends Control

@onready var start_button: Button = $PanelContainer/VBoxContainer/StartButton
@onready var options_button: Button = $PanelContainer/VBoxContainer/OptionsButton
@onready var credits_button: Button = $PanelContainer/VBoxContainer/CreditsButton
@onready var transition_screen: CanvasLayer = $"Transition Screen"
@onready var character_customization: Button = $PanelContainer/VBoxContainer/CharacterCustomization

func _ready():
	credits_button.connect("pressed", on_credits_pressed)
	options_button.connect("pressed", on_options_pressed)
	start_button.connect("pressed", on_start_pressed)
	character_customization.connect("pressed", on_char_pressed)
	MenuThemeStream.play()
	HomeThemeStream.stop()
	FishingThemeStream.stop()

func _process(delta):
	pass

func on_char_pressed():
	transition_screen.transition_to_scene("res://Menus/CharacterCustomization/character_customization.tscn")

func on_credits_pressed():
	transition_screen.transition_to_scene("res://Menus/Credits/credits.tscn")
	
func on_options_pressed():
	transition_screen.transition_to_scene("res://Menus/Options/options.tscn")
	
func on_start_pressed():
	transition_screen.transition_to_scene("res://PlayScenes/Home/home.tscn")
	
