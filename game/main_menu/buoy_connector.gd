extends Line2D

@export var buoy : Control
@export var camera : Camera2D  # Use Camera2D for 2D camera projections
@export var start_point : Node2D

func _process(delta: float) -> void:
	if not buoy or not camera:
		return
	
	set_point_position(0, start_point.global_position)
	
	var buoy_world_pos = buoy.global_position
	
	var buoy_screen_pos = camera.get_canvas_transform() * buoy_world_pos
	set_point_position(1, buoy_screen_pos)
