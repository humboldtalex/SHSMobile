class_name SaverLoader
extends Node

@onready var player = %Player

#func save_game():
#	var file = FileAccess.open("res://savegame.data", FileAccess.WRITE)
#	#file.store_var(player.global_tokens) # UNCOMMENT WHEN MONEY IS SETUP
#	file.close()

#func load_game():
#	var file = FileAccess.open("res://savegame.data", FileAccess.READ)
#	#player.global_tokens = file.get_var()
#	file.close()
