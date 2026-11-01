extends Node

# we first want a place to save
const save_file_name = "user://save.json"
const default_dictionary: Dictionary = {}

func save_game(data: Dictionary):
	var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.WRITE)
	var string_data: String = JSON.stringify(data)
	save_file.store_line(string_data)
	save_file.close()
	
	

func load_game():
	if FileAccess.file_exists(save_file_name):
		var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.READ)
		var json = JSON.new()
		
		var string_data: String = save_file.get_line()
		json.parse(string_data)
		var data: Dictionary = json.get_data()
		save_file.close()
		
		return data
