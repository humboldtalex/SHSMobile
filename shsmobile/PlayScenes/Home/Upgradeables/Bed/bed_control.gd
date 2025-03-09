extends Control

@export var object_name : String = ""

@onready var cancel_button: Button = $VBoxContainer/CancelButton
@onready var pay_button: Button = $VBoxContainer/PayButton
@onready var upgradeable: Area2D = $".."

func _ready(): 
	cancel_button.connect("pressed", on_cancel_pressed)
	pay_button.connect("pressed", on_pay_pressed)

func on_cancel_pressed():
	hide()

func _process(delta: float) -> void:
	if Global.bed_upgrade < 4:
		var cost = upgradeable.cost_array[Global.bed_upgrade]
		if Global.tokens >= cost:
			pay_button.text = "Upgrade your " + object_name + " for " + str(cost) + " tokens?"
			pay_button.disabled = false
		else:
			pay_button.text = "Upgrade costs " + str(cost) + " tokens."
			pay_button.disabled = true
	else:
		pay_button.text = "Your " + object_name + " is maxed out!"
		pay_button.disabled = true

func on_pay_pressed():
	if Global.tokens >= upgradeable.cost_array[Global.bed_upgrade]:
		Global.tokens -= upgradeable.cost_array[Global.bed_upgrade]
		Global.bed_upgrade += 1
		hide()
	else:
		print("Go getta job!")
		hide()
