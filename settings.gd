extends Node2D
@onready var volume: HSlider = $MarginContainer/VBoxContainer/Volume

func _process(delta: float) -> void:
	pass

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value/5))

func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)
	
func _on_resolutions_item_selected(index: int) -> void:
	match index:
		0: 
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1: 
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2: 
			DisplayServer.window_set_size(Vector2i(1280, 720))
