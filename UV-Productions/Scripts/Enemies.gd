extends Node2D

export var max_enemies = 7
export var probability = 0.3

onready var EnemyJ = load("res://Scenes/EnemyJ.tscn")
onready var EnemyR = load("res://Scenes/EnemyR.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	if get_child_count() < max_enemies + 1:
		if randf() < probability or get_child_count() == 1:
			if randf() < 0.5:
				var e = EnemyJ.instance()
				add_child(e)
			else:
				var o = EnemyR.instance()
				add_child(o)
	
