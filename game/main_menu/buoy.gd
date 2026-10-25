extends TextureButton


func _ready() -> void:
	self.material.set_shader_parameter("outline_tint", Color(0.839, 0.898, 0.145, 0.0))

func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	#self.material.set_shader_parameter("outline_tint", Color(0.839, 0.898, 0.145, 1.0))
	#global_position = global_position.lerp(target_pos, smooth_speed * delta)
	
	var tween = create_tween()
	tween.tween_property(self.material, "shader_parameter/outline_tint", Color(0.839, 0.898, 0.145, 1.0), 0.5)

func _on_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property(self.material, "shader_parameter/outline_tint", Color(0.839, 0.898, 0.145, 0.0), 0.5)
