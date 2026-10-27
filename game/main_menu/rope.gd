extends Line2D

@export var start_point : Node2D
@export var end_point : Node2D

func _ready() -> void:
	# Ensure the Line2D has at least 2 points initialized so we can modify them safely
	if points.size() < 2:
		points.resize(2)

func _process(_delta: float) -> void:
	if not (start_point or end_point):
		return
		
	var global_start: Vector2 = start_point.global_position
	var global_end: Vector2 = end_point.global_position
	
	points[0] = to_local(global_start)
	points[points.size() - 1] = to_local(global_end)
