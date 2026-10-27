extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	Globals.next_scene = "res://game/main_menu/start_menu.tscn"
	get_tree().change_scene_to_packed(Globals.loading_screen)
