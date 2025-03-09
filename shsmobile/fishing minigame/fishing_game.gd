extends Control

@onready var target: Area2D = $Target
@onready var fish: CharacterBody2D = $Fish
@export var fish_array:Array[Fish]

func _ready():
	MenuThemeStream.stop()
	HomeThemeStream.stop()
	FishingThemeStream.play()
	
func _on_target_target_entered() -> void: #Func executes when fish is caught
	
	pass
	

func _on_target_target_exited() -> void:	#Func exectes when fish game resets
	
	pass
