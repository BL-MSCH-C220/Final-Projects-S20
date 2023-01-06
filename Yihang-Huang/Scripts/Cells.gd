extends Node2D

export var probability = 0.4
onready var Cell = load("res://Scenes/Cell.tscn")
onready var Cell2 = load("res://Scenes/Cell2.tscn")

func _ready():
	pass


func _on_Timer_timeout():
	if randf() < probability:
		var c = Cell.instance()
		add_child(c)
		var q = Cell2.instance()
		add_child(q)
