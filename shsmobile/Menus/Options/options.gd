extends Control

@onready var back_button : Button = $VBoxContainer/BackButton

func _ready():
	back_button.connect("pressed", on_back_pressed)
	
func on_back_pressed():
	get_tree().change_scene_to_file("res://Menus/MainMenu/main_menu.tscn")
	print("Back button presed")
	
