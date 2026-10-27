extends Camera2D

@export var max_y_offset: float = 800.0  
@export var max_x_offset: float = 500.0  
@export var smooth_speed: float = 3.0    

var initial_position: Vector2

func _ready() -> void:
	initial_position = global_position

func _process(delta: float) -> void:
	var viewport_size = get_viewport_rect().size
	var viewport_center = viewport_size / 2.0
	var mouse_pos = get_viewport().get_mouse_position()
	
	var offset_from_center = mouse_pos - viewport_center
	
	var standard_x = offset_from_center.x / viewport_center.x
	var standard_y = offset_from_center.y / viewport_center.y
	
	var target_x = standard_x * max_x_offset
	var target_y = standard_y * max_y_offset
	
	var target_pos = initial_position + Vector2(target_x, target_y)
	
	global_position = global_position.lerp(target_pos, smooth_speed * delta)
