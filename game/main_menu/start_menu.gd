extends Node2D

@onready var buoy_line: Line2D = $Panel/Bouy_Line
@onready var panel = $Panel
@onready var panel_title= $Panel/Panel/Layout/Title
@onready var panel_body= $Panel/Panel/Layout/Body
@onready var _1_buoy= $"1_Buoy/EndPoint"
@onready var _2_buoy = $"2_Buoy/EndPoint"
@onready var _3_buoy = $"3_Buoy/EndPoint"
@onready var wave_bubble_texture: ColorRect = $Panel/Panel/WaveBubbleTexture
@onready var water_fill: AudioStreamPlayer2D = $Panel/Panel/AcceptButtonMask/AudioStreamPlayer2D

@export var level_button_group: ButtonGroup

func _ready() -> void:
	panel.hide()
	
func _process(delta: float) -> void:
	return


func _on__buoy_level_1_preview() -> void:
	
	if buoy_line.buoy == _1_buoy:
		buoy_line.buoy = null
		close_panel()
		return
	
	buoy_line.buoy = _1_buoy
	change_panel_text("Coral Kingdom",
	"The coral world has extreme biodiversity and can house 25% of the ocean's species.")
	
func _on__buoy_level_2_preview() -> void:
	
	if buoy_line.buoy == _2_buoy:
		buoy_line.buoy = null
		close_panel()
		return
		
	buoy_line.buoy = _2_buoy
	change_panel_text("Mangrove Meadows",
	"Mangroves are survivors. With their roots submerged in water.")

func _on__buoy_level_3_preview() -> void:
	
	if buoy_line.buoy == _3_buoy:
		buoy_line.buoy = null
		close_panel()
		return
		
	buoy_line.buoy = _3_buoy
	change_panel_text("Abyssal",
	"Winter area, where you'd wear a scarf. spooky deeps.")

func change_panel_text(title, body):
	panel.show()
	panel_body.text = body
	panel_title.text = title


func _on_accept_button_mask_button_down() -> void:
	var tween = create_tween()
	water_fill.play()
	
	tween.tween_property(wave_bubble_texture.material, "shader_parameter/fill_value", 1.0, 1.0)


func _on_accept_button_mask_button_up() -> void:
	var tween = create_tween()
	tween.tween_property(wave_bubble_texture.material, "shader_parameter/fill_value", -1.0, 1.0)
	water_fill.stop()
	
	if wave_bubble_texture.material.get_shader_parameter("fill_value") > 0.9:
		match buoy_line.buoy:
			_1_buoy: Globals.next_scene = "res://game/trash/learn_env.tscn"
			_2_buoy: Globals.next_scene = "res://game/trash/learn_env.tscn"
			_3_buoy: Globals.next_scene = "res://game/trash/learn_env.tscn"
		get_tree().change_scene_to_packed(Globals.loading_screen)
			
func close_panel():
	panel.hide()
	panel_body.text = ""
	panel_title.text = ""
	
