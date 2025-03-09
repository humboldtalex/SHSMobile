extends Control

@onready var home_button : Button = $PanelContainer/BackButton
@onready var transition_screen: CanvasLayer = $"Transition Screen"

func _ready():
	home_button.connect("pressed", on_back_pressed)
	
func on_back_pressed():
	transition_screen.transition_to_scene("res://PlayScenes/Home/home.tscn")
	print("home button presed")
