extends Node2D

var time_elapsed: float = 0.0

func _process(delta: float) -> void:
	time_elapsed += delta

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_playing_time() -> float:
	var time := 0.0
	
	var seconds = snappedf(time_elapsed, 0.1)
	var minutes := 0
	var hours := 0
	
	if seconds % 60 == 0: #when there are full minutes
		minutes += 1
		
	if minutes % 60 == 0: #when there are full hours
		hours += 1
	
	return time
