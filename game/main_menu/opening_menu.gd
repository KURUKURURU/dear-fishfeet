extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PauseMenu.can_open = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	PauseMenu.can_open = true
	Globals.next_scene = "res://game/main_menu/start_menu.tscn"
	get_tree().change_scene_to_packed(Globals.loading_screen)

func _on_settings_pressed() -> void:
	Settings.open()
