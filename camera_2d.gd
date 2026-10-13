extends Camera2D
var speed = 10
var vertical_movement_zone_size = 100
var horizontal_movement_zone_size = 100

var window_size = Vector2.ZERO

func _ready():
	window_size = get_tree().root.size

func _process(delta):
	# this will get the position in the viewport/game-window
	var mouse_position = get_viewport().get_mouse_position()
	
	# check vertical
	if (mouse_position.y < vertical_movement_zone_size):
		position.y += speed * delta
	elif (mouse_position.y > window_size.y - vertical_movement_zone_size):
		position.y -= speed * delta
	
	# check horizontal
	if (mouse_position.x < horizontal_movement_zone_size):
		position.x += speed * delta
	elif (mouse_position.x > window_size.x - horizontal_movement_zone_size):
		position.x -= speed * delta
