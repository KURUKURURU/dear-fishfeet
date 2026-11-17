extends CanvasLayer
@onready var _continue: Button = $MarginContainer/VBoxContainer/Continue
@onready var saves: Button = $MarginContainer/VBoxContainer/Saves
@onready var settings: Button = $MarginContainer/VBoxContainer/Settings
@onready var exit: Button = $MarginContainer/VBoxContainer/Exit

var can_open : bool = true
var opened : bool = false

func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	if can_open:
		if Input.is_action_just_pressed("escape"): 
			if opened:
				if Settings.visible: return 
				close()
			else: 
				open()
	else:
		if visible: hide()

func _on_continue_pressed() -> void:
	close()

func _on_exit_pressed() -> void:
	close()

func _on_settings_pressed() -> void:
	Settings.open()
	#close()
	print("Pause menu hidden behind, settings toggled")

func open():
	toggle_pause()
	print(open)
	opened = true
	print("dbug: open pause menu")
	show()
	
func close():
	toggle_pause()
	print(open)
	opened = false
	hide()
	
func toggle_pause() -> void:
	var new_pause_state := not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
