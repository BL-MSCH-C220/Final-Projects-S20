# Game Jam 2020
# Programmer: Murun T
# Team: TP Gang

extends KinematicBody2D


const FLOOR = Vector2(0, -1)
const SPEED = 30
var velocity = Vector2(0,0)

func _ready():
	velocity = Vector2(0,SPEED)


# creates a bobbing, cartoony effect
func _physics_process(delta):
	
	# bob the TP up and down
	if(is_on_floor()):
		velocity.y = -SPEED
		$Timer.start()
		#print("Reversing")
	
	velocity = move_and_slide(velocity, FLOOR)

# reverse the TP down
func _on_Timer_timeout():
	velocity.y = SPEED
