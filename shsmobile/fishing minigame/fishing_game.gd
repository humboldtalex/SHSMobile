extends Control

@onready var target: Area2D = $Target
@onready var fish: CharacterBody2D = $Fish

func _ready():
	MenuThemeStream.stop()
	HomeThemeStream.stop()
	FishingThemeStream.play()
	
func _on_target_target_entered() -> void: #Func executes when fish is caught
	target.visible = false
	fish.visible = false
	print("CATCH")

func _on_target_target_exited() -> void:	#Func exectes when fish game resets
	target.visible = true					#doesn't care if fish was caught
	fish.visible = true
	print("RELEASE/RESET")
