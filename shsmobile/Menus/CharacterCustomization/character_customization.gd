extends Control

@onready var back_button : Button = $PanelContainer/VBoxContainer/BackButton
@onready var transition_screen: CanvasLayer = $"Transition Screen"
@onready var primary: ColorPickerButton = $PanelContainer/VBoxContainer/PrimColor/Primary
@onready var secondary: ColorPickerButton = $PanelContainer/VBoxContainer/SecColor/Secondary
@onready var cat_toggle: Button = $"PanelContainer/VBoxContainer/Cat (Toggle)"

func _ready():
	back_button.connect("pressed", on_back_pressed)
	primary.color = Global.prim_color
	secondary.color = Global.sec_color
	primary.color_changed.connect(color_changed)
	secondary.color_changed.connect(color_changed)
	cat_toggle.pressed.connect(cat_toggled)
	
func on_back_pressed():
	transition_screen.transition_to_scene("res://Menus/MainMenu/main_menu.tscn")

func color_changed(color):
	Global.prim_color = primary.color
	Global.sec_color = secondary.color

func cat_toggled():
	Global.cat_or_dog = !Global.cat_or_dog

func _process(delta):
	if Global.cat_or_dog:
		cat_toggle.text = "Dog (Toggle)"
	else:
		cat_toggle.text = "Cat (Toggle)"
