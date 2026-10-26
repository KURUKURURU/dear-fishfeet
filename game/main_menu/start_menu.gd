extends Node2D

@onready var buoy_line: Line2D = $Panel/Bouy_Line
@onready var panel_title= $Panel/Panel/Title
@onready var panel_body= $Panel/Panel/Body
@onready var _1_buoy= $"1_Buoy/EndPoint"
@onready var _2_buoy = $"2_Buoy/EndPoint"
@onready var _3_buoy = $"3_Buoy/EndPoint"

@export var level_button_group: ButtonGroup

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#if level_button_group:
		#level_button_group.pressed.connect(_on_level_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	return


func _on__buoy_level_1_preview() -> void:
	buoy_line.buoy = _1_buoy

func _on__buoy_level_2_preview() -> void:
	buoy_line.buoy = _2_buoy

func _on__buoy_level_3_preview() -> void:
	buoy_line.buoy = _3_buoy
	

#func _on_level_button_pressed(button: BaseButton) -> void:
	## Use the name of the specific button that was pressed
	#match button.name:
		#"Level1": 
		#"Level2": 
		#"Level3": 
#
#func change_panel_text(panel_title: str, body: str):
	#
