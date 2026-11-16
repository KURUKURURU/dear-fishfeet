extends TextureRect


func _ready() -> void:
	_on_mouse_exited()



func _on_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property(self.material, "shader_parameter/outline_tint", Color("ff0f36"), 0.5)
	tween.tween_property(self, "rotation", 8.0, 1.0)

#ff0f36

func _on_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property(self.material, "shader_parameter/outline_tint", Color(0.839, 0.898, 0.145, 0.0), 0.5)
	tween.tween_property(self, "rotation", 0.0, 1.0)
