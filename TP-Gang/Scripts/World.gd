# Game Jam 2020
# Programmer: Murun T
# Team: TP Gang

extends Node2D
var ENEMY = preload("res://Scenes/Enemy.tscn")

func _ready():
	pass


# create a new enemy every few seconds
func _on_EnemyTimer_timeout():
	# play sneeze sound
	$Sounds/Sneeze.play()
	var enemy = ENEMY.instance()
	# instance the enemy above the player
	enemy.position.x = $Player.position.x
	enemy.position.y = $Player.position.y - 550
	add_child(enemy)
