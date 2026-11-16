extends TextureRect


func _ready() -> void:
	_on_mouse_exited()



func _on_mouse_entered() -> void:
	var tween1 = create_tween()
	var tween2 = create_tween()
	tween1.tween_property(self.material, "shader_parameter/outline_tint", Color("00fec3ff"), 0.5)
	tween2.tween_property(self, "rotation_degrees", 2.0, 0.5)

#ff0f36

func _on_mouse_exited() -> void:
	var tween1 = create_tween()
	var tween2 = create_tween()
	tween1.tween_property(self.material, "shader_parameter/outline_tint", Color(0.839, 0.898, 0.145, 0.0), 0.5)
	tween2.tween_property(self, "rotation_degrees", 0.0, 0.5)
