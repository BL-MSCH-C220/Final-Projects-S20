extends CanvasLayer


func _ready():
	# initialize the HUD with score of 0
	var score = get_node("/root/Global").getScore()
	$Label.text = "Toilet Paper: " + str(score)

# update the HUD score 
func _on_Player_scoreUpdate():
	get_node("/root/Global").increaseScore()
	
	
	var score = get_node("/root/Global").getScore()
	$Label.text = "Toilet Paper: " + str(score)
