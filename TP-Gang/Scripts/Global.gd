# Game Jam 2020
# Programmer: Murun T
# Team: TP Gang

extends Node2D

var score = 0

func _ready():
	score = 0

# increase the TP score
func increaseScore():
	score += 1

# getter function for the score
func getScore():
	return score
