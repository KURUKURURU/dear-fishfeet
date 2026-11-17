extends CanvasLayer
@export var button_group: ButtonGroup
@onready var general: Button = $SettingsList/General
@onready var viewport: Button = $SettingsList/Viewport
@onready var audio: Button = $SettingsList/Audio
@onready var other: Button = $SettingsList/Other
@onready var main_page_group: MarginContainer = $MarginContainer
@onready var main_page_general = $MarginContainer/General
@onready var main_page_viewport= $MarginContainer/Viewport
@onready var main_page_audio = $MarginContainer/Audio
@onready var main_page_other = $MarginContainer/Other
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var opened := false
var menu_open := false

func _ready() -> void:
	button_group.pressed.connect(_on_button_group_pressed)
	hide()
	_on_button_group_pressed(general)

func _process(delta: float) -> void:
	if opened:
		if Input.is_action_just_pressed("escape"): 
			await _on_close_pressed() 

func _on_button_group_pressed(button: BaseButton) -> void:
	print("settings button select: ", button.name)
	
	for child in main_page_group.get_children():
		child.hide()
	
	match button:
		general: main_page_general.show()
		viewport: main_page_viewport.show()
		audio: main_page_audio.show()
		other: main_page_other.show()
	
	var active_button = button_group.get_pressed_button()
	if active_button:
		print("currently active: ", active_button.text)

func open():
	#toggle_pause()
	#if PauseMenu.visible: menu_open = true
	
	opened = true
	
	Ui.paper_slide()
	animation_player.play("slide_card_enter")
	show()

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value/5))

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value/5))

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(value/5))

func _on_ambience_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(3, linear_to_db(value/5))

func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)
	
func _on_resolutions_item_selected(index: int) -> void:
	match index:
		0: 
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1: 
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2: 
			DisplayServer.window_set_size(Vector2i(1280, 720))

func _on_close_pressed() -> void:
	#toggle_pause()
	#if menu_open: PauseMenu.open()
	
	opened = false
	
	Ui.paper_slide()
	animation_player.play("slide_card_exit")
	await animation_player.animation_finished
	hide()
#
#func toggle_pause() -> void:
	#var new_pause_state := not get_tree().paused
	#get_tree().paused = new_pause_state
	#visible = new_pause_state
