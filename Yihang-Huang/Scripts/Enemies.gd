extends Node2D

export var max_enemies = 4
export var probability = 0.3

onready var Enemy1 = load("res://Scenes/Enemy1.tscn")
onready var Enemy2 = load("res://Scenes/Enemy2.tscn")
onready var Enemy3 = load("res://Scenes/Enemy3.tscn")
onready var Enemy4 = load("res://Scenes/Enemy4.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if get_child_count() < max_enemies + 1:
		if randf() < probability or get_child_count() == 1:
			if randf() < 0.5:
				var e = Enemy1.instance()
				add_child(e)
				var b = Enemy2.instance()
				add_child(b)
			else:
				var e = Enemy3.instance()
				add_child(e)
				var a = Enemy4.instance()
				add_child(a)
