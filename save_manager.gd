extends Node

# we first want a place to save
const save_file_name = "user://save.json"
const default_dictionary: Dictionary = {}

func _ready() -> void:
	_load()

var contents_to_save: Dictionary = {
	"story_levels_unlocked" : {1.0 : true, #home? + fake/intro to running game
								1.1 : false, # coral town
								1.2 : false, # running activity
								2.1 : false, # cave systems
								2.2 : false,
								3.1 : false,
								3.2 : false},
	"player_y" : 0.0,
	"player_x" : 0.0
	}

func _save():
	var save_file = FileAccess.open_encrypted_with_pass(save_file_name, FileAccess.WRITE, "76357499394432")
	save_file.store_var(contents_to_save.duplicate())
	save_file.close()
	

func _load():
	if FileAccess.file_exists(save_file_name):
		var save_file = FileAccess.open_encrypted_with_pass(save_file_name, FileAccess.READ, "76357499394432")
		var data = save_file.get_var()
		save_file.close()
		
		for key in contents_to_save.keys():
			if data.has(key):
				contents_to_save[key] = data[key]
			
		var save_data = data.duplicate()
