extends Control

@onready var back_button : Button = $PanelContainer/BackButton
@onready var transition_screen: CanvasLayer = $"Transition Screen"

func _ready():
	back_button.connect("pressed", on_back_pressed)
	
func on_back_pressed():
	transition_screen.transition_to_scene("res://PlayScenes/Home/home.tscn")
	print("Back button presed")
