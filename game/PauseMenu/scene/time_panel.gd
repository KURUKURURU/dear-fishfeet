extends Panel
@onready var label: Label = $Label


func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	while true:
		label.text = "Playing Time:\n" + str(Statistics.get_playing_time())
		await get_tree().create_timer(0.1).timeout
