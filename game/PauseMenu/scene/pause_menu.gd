extends CanvasLayer
@onready var _continue: Button = $MarginContainer/VBoxContainer/Continue
@onready var saves: Button = $MarginContainer/VBoxContainer/Saves
@onready var settings: Button = $MarginContainer/VBoxContainer/Settings
@onready var exit: Button = $MarginContainer/VBoxContainer/Exit

var can_open : bool = true

func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	if can_open:
		if Input.is_action_just_pressed("escape"):
			open()
	else:
		if visible: close()

func _on_continue_pressed() -> void:
	hide()

func _on_exit_pressed() -> void:
	hide()

func _on_settings_pressed() -> void:
	Settings.open()
	hide()
	print("test")

func open():
	print("dbug: open pause menu")
	show()
	
func close():
	hide()
