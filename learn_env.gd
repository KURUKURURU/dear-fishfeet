extends Node2D

var x := "Smart"
var y : int = 0
var new_word_list : Array[String]
var new_word : String

func _ready() -> void:
	x = x.to_lower()
	
	for i in x:
		if i == "s":
			new_word_list.append(i)
			continue
		new_word_list.append(i.capitalize())
		
	new_word = "".join(new_word_list)
	print(new_word)
	
		
		


func _process(delta: float) -> void:
	pass
