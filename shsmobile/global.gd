extends Node

@export var save_path : String = "user://save_game.tres"

var tokens : int = 0
var fish_caught : Dictionary = {
	"three_spined_stickle" : 0,
	"pacific_staghorn_sculpin" : 0,
	"shiner_perch" : 0,
	"coastrange_sculpin" : 0,
	"sacramento_sculpin" : 0,
	"chinook_salmon" : 0,
	"steelhead_trout" : 0,
	"green_sturgeon" : 0,
	"tidewater_goby" : 0
}
var food_upgrade : int = 0
var bed_upgrade : int = 0
var tree_upgrade : int = 0
var all_time_tokens : int = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		tokens += 1
	if event.is_action_pressed("ui_down"):
		save_game()

func _ready():
	load_game()

func save_game():
	var file := FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(get_vars_as_dict())
	print(get_vars_as_dict()["food_upgrade"])
	file.close()

func load_game():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		store_vars_from_dict(file.get_var())
		file.close()
	else:
		save_game()

func get_vars_as_dict() -> Dictionary:
	var dict : Dictionary = {
		"tokens" : tokens,
		"fish_caught" : fish_caught,
		"food_upgrade" : food_upgrade,
		"bed_upgrade" : bed_upgrade,
		"tree_upgrade" : tree_upgrade,
		"all_time_tokens" : all_time_tokens
	}
	return dict

func store_vars_from_dict(dict):
	if dict:
		if dict.has("tokens"):
			tokens = dict["tokens"]
		if dict.has("fish_caught"):
			fish_caught = dict["fish_caught"]
		if dict.has("food_upgrade"):
			food_upgrade = dict["food_upgrade"]
			print("Loaded" + str(food_upgrade))
		if dict.has("bed_upgrade"):
			bed_upgrade = dict["bed_upgrade"]
		if dict.has("tree_upgrade"):
			tree_upgrade = dict["tree_upgrade"]
		if dict.has("all_time_tokens"):
			all_time_tokens = dict["all_time_tokens"]
