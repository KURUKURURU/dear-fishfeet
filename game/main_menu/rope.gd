extends Line2D

@export var start_point : Node2D
@export var end_point : Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points[0] = start_point.points[0]
	points[len(points) - 1] = end_point.points[0]
