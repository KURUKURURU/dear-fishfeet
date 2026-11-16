extends CanvasLayer
@onready var button_sfx: AudioStreamPlayer = $ButtonSFX
@onready var focus_button_sfx: AudioStreamPlayer = $FocusButtonSFX

func _ready()->void:
	var buttons: Array = get_tree().get_nodes_in_group("Button")
	for inst in buttons:
		inst.connect("pressed", on_button_pressed)
		inst.connect("mouse_entered", on_button_focused)

func on_button_pressed()->void: button_sfx.play()
func on_button_focused()->void: focus_button_sfx.play()
func on_button_focused()->void: focus_button_sfx.play()
