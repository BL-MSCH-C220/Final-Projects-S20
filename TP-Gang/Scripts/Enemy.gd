# Game Jam 2020
# Programmer: Murun T
# Team: TP Gang

extends KinematicBody2D

const GRAVITY = 5
export var SPEED = 60
const FLOOR = Vector2(0, -1)
# 1 is right, 0 is left
var direction = 1
var velocity = Vector2()
export var rotationSpeed = 1
func _ready():
	pass

func _physics_process(delta):
	# control the direction of movement
	velocity.x = SPEED * direction
	
	# rotate the virus accordingly to make it look like it's rolling
	if	direction == 1:
		#$Sprite.flip_h = false
		rotate(delta * rotationSpeed)
	else:
		rotate(-delta * rotationSpeed)
		#$Sprite.flip_h = true
	
	# apply gravity
	velocity.y += GRAVITY
	
	
	velocity = move_and_slide(velocity, FLOOR)
	
	# flip the direction on wall detection
	if is_on_wall():
		direction *= -1
	
	# get collision objects
	# kills a standing player
	if get_slide_count() > 0:
		# check what the collisions are
		for i in range(get_slide_count()):
			# if the collision object is Enemey, kill player
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()
		
	
