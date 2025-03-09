extends Control

@onready var exit_button: Button = $PanelContainer/Button

func _ready():
	exit_button.connect("pressed", _on_exit_button_pressed)

func _on_exit_button_pressed():
	hide() 
