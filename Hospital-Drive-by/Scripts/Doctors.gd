extends Node2D
export var probability = 0.1
onready var Doc = load("res://Scenes/Doctor.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability:
		var d = Doc.instance()
		add_child(d)
