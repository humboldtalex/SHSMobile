extends Control

@onready var home_button : Button = $PanelContainer/home_Button
@onready var transition_screen: CanvasLayer = $"Transition Screen"


func _ready():
	home_button.connect("pressed", on_home_pressed)
	
func on_home_pressed():
	transition_screen.transition_to_scene("res://PlayScenes/Home/home.tscn")
	print("home button presed")
