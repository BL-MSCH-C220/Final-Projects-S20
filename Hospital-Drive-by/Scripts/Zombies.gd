extends Node2D

export var max_enemies = 10
export var probability = 0.5

onready var Enemy1 = load("res://Scenes/Zombie.tscn")


func _ready():
	randomize()


func _on_Timer_timeout():
	print(get_child_count())
	if get_child_count() < max_enemies:
		if randf() < probability or get_child_count() == 1:
				var e = Enemy1.instance()
				add_child(e)
	
