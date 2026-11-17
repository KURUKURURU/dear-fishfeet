extends Control
@onready var waves_texture: ColorRect = $BG
@onready var texture_rect: TextureRect = $TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func open():
	var tween = create_tween()
	
	waves_texture.material.set_shader_parameter("progress", 0.0)
	tween.tween_property(self.material, "shader_parameter/progress", 1.0, 0.7)
	
