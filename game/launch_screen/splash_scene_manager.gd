extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	PauseMenu.can_open = false
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://game/main_menu/opening_menu.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"): # skip
		get_tree().change_scene_to_file("res://game/main_menu/opening_menu.tscn")
