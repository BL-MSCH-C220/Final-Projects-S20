# Game Jam 2020
# Programmer: Murun T
# Team: TP Gang

extends KinematicBody2D

var velocity = Vector2()
const SPEED = 250
const GRAVITY = 30
const JUMP = -900
const FLOOR = Vector2(0, -1)
var onGround = false
var isDead = false
signal scoreUpdate

func _ready():
	# is anyone actually going to read this?
	pass


func _physics_process(delta):
	
	if not isDead:
		
		# horizontal movement
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
			# TODO fix awkward reverse
			$AnimatedSprite.play("run")
			#$AnimatedSprite.flip_h = true
		else:
			velocity.x = 0
			$AnimatedSprite.play("idle")
		
		# vertical movement
		if Input.is_action_pressed("ui_up"):
			if onGround:
				velocity.y = JUMP
				onGround = false
				$AnimatedSprite.play("jump")
		
		# apply gravity
		velocity.y += GRAVITY
		
		if is_on_floor():
			onGround = true
		else:
			onGround = false
		
		
		# apply movement
		velocity = move_and_slide(velocity, FLOOR)
		
		# get collision objects
		# only kills player if player is moving
		# to kill a standing player, implement in Enemy node
		if get_slide_count() > 0:
			# check what the collisions are
			for i in range(get_slide_count()):
				# if the collision object is Enemey, kill player
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()
				if "ToiletPaper" in get_slide_collision(i).collider.name:
					emit_signal("scoreUpdate")
					#get_node("/root/Global").increaseScore()
					get_slide_collision(i).collider.queue_free()
					
# kills the player
func dead():
	$Death.play()
	isDead = true
	# stop player motion
	velocity = Vector2(0,0)
	# play death sprite
	$AnimatedSprite.play("dead")
	# disable collision
	$CollisionShape2D.set_deferred("disabled", true)
	# wait 1 second before changing to death scene
	$Timer.start()
		

# calls death screen on timeout
func _on_Timer_timeout():
	# call death screen
	get_tree().change_scene("res://Scenes/EndScreen.tscn")

	

# Change to the Win screen if the player makes it to the door
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/EndScreen.tscn")
		
