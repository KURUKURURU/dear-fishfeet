extends Line2D

@export var buoy : Node2D
@export var camera : Camera2D  # Use Camera2D for 2D camera projections
@export var start_point : Node2D

func _process(delta: float) -> void:
	if not buoy or not camera:
		hide()
		return
	
	show()
	
	set_point_position(0, start_point.global_position)
	
	var buoy_world_pos = buoy.global_position
	
	var buoy_screen_pos = camera.get_canvas_transform() * buoy_world_pos
	set_point_position(1, buoy_screen_pos)

#func gradient_fade():
	#gradient_shift = val
	#gradient.set_offset(1, gradient_shift) 
	#bouy_line.gradient.offsets 
	
