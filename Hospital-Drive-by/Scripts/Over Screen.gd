extends Node2D

func _ready():
	pass


func _on_Button_pressed():
	queue_free()
	get_tree().change_scene("res://Scenes/Game.tscn")
