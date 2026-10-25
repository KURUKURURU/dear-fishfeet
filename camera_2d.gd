extends Camera2D

@export var max_y_offset: float = 1200.0
@export var max_x_offset: float = 200.0
@export var smooth_speed: float = 10.0

var initial_position: Vector2

func _ready() -> void:
	initial_position = global_position

func _process(delta: float) -> void:
	var viewport_center = get_viewport_rect().size / 2.0
	var mouse_pos = get_viewport().get_mouse_position()
	
	var offset_from_center = mouse_pos - viewport_center
	
	var clamped_x = clamp(offset_from_center.x, -max_x_offset, max_x_offset) # makes it snap nicelyyy
	var clamped_y = clamp(offset_from_center.y, -max_y_offset, max_y_offset) # makes it snap nicelyyy
	
	var target_pos = initial_position + Vector2(clamped_x * 0.9, clamped_y * 0.9) 
	
	global_position = global_position.lerp(target_pos, smooth_speed * delta)
