extends Control

@onready var back_button : Button = $VBoxContainer/BackButton
@onready var transition_screen: CanvasLayer = $"Transition Screen"

func _ready():
	back_button.connect("pressed", on_back_pressed)
	
func on_back_pressed():
	transition_screen.transition_to_scene("res://Menus/MainMenu/main_menu.tscn")
	print("Back button presed")
	
