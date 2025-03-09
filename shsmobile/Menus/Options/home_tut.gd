
extends Control

@onready var tut_button : Button = $PanelContainer/tutButton

func _ready():
	tut_button.connect("pressed", on_tut_pressed)
	
func on_tut_pressed():
	hide()
	print("Back button presed")
