extends Node2D

var time_elapsed: float = 0.0

func _process(delta: float) -> void:
	time_elapsed += delta

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_playing_time() -> float:
	var time = str(snappedf(time_elapsed, 0.1))
	return time
