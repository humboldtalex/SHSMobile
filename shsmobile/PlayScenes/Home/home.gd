extends Node2D

@onready var animal_character: CharacterBody2D = $AnimalCharacter
@onready var transition_screen: CanvasLayer = $"Transition Screen"

func _ready():
	MenuThemeStream.stop()
	HomeThemeStream.play()
	FishingThemeStream.stop()

func _process(delta):
	if animal_character.global_position.y > 2000:
		transition_screen.transition_to_scene("res://fishing minigame/fishing_minigame.tscn")
