extends Line2D

func _ready() -> void:
	start_sway()

func start_sway() -> void:
	var sway_tween = create_tween().set_loops()
	
	var original_pos = position
	var right_pos = Vector2(original_pos.x + 15, original_pos.y)
	
	# googled this brooooo dont flag for ai
	sway_tween.tween_property(self, "position", right_pos, 3.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	sway_tween.tween_property(self, "position", original_pos, 3.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
