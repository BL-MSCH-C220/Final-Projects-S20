extends Control


func _ready():
	# display the final score on endscreen
	var score = get_node("/root/Global").getScore()
	$Score.text = "TP Collected: " + str(score)

