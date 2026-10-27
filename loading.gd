extends Node2D
@onready var progress_bar: ProgressBar = $ProgressBar

var progress : Array[float] = []

func _ready() -> void:
	ResourceLoader.load_threaded_request(Globals.next_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(Globals.next_scene, progress)
	
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			var pct = progress[0] * 100
			progress_bar.value = pct
			
		ResourceLoader.THREAD_LOAD_LOADED:
			var scene = ResourceLoader.load_threaded_get(Globals.next_scene)
			get_tree().change_scene_to_packed(scene)
