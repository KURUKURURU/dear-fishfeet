extends Node2D


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#_on_save_pressed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_save_pressed() -> void:
	SaveManager.contents_to_save.player_x = $Player.position.x
	SaveManager.contents_to_save.player_y = $Player.position.y
	SaveManager._save()


func _on_load_pressed() -> void:
	SaveManager._load()
	#SaveManager.contents_to_save.player_x = 
	$Player.position.x = SaveManager.contents_to_save.player_x 
	$Player.position.y = SaveManager.contents_to_save.player_y
	
