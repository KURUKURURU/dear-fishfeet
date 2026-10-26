extends TextureButton
@onready var start_menu: Node2D = $".."
@onready var bouy_line: Line2D = $"../Panel/Bouy_Line"
@onready var bouy_line_ani = $"../Panel/Bouy_Line/AnimationPlayer"

signal level_1_preview
signal level_2_preview
signal level_3_preview

func _ready() -> void:
	self.material.set_shader_parameter("outline_tint", Color(0.839, 0.898, 0.145, 0.0))

func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property(self.material, "shader_parameter/outline_tint", Color(0.492, 0.884, 0.257, 1.0), 0.5)

func _on_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property(self.material, "shader_parameter/outline_tint", Color(0.839, 0.898, 0.145, 0.0), 0.5)

func _on_pressed() -> void:
	
	bouy_line_ani.play("gradient_blend")
	
	match name:
		"1_Buoy": 
			level_1_preview.emit() 
			print("level 1")
		"2_Buoy": 
			level_2_preview.emit()
			print("level 2")
		"3_Buoy": 
			level_3_preview.emit()
			print("level 3")
