extends Node2D
export var probability = 0.7
onready var Nurses = load("res://Scenes/Nurse.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability:
		var n = Nurses.instance()
		add_child(n)
