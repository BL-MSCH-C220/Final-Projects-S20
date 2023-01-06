extends Label

export var score = 0

func _ready():
	pass

func update_score(s):
	text = 'Score: ' + str(s)
	if score == 150:
		get_tree().change_scene("res://Scenes/Win.tscn")
