extends Control

@onready var button: Button = $Button
@onready var transition_screen: CanvasLayer = $"../Transition Screen"

func _ready():
	button.connect("pressed", button_pressed)
	
func button_pressed():
	transition_screen.transition_to_scene("res://PlayScenes/Home/home.tscn")
	print("home button presed")
