extends RigidBody2D

var velocity = Vector2(0,0)
export var min_speed = 100
export var score = 500




func _ready():
	randomize()
	position.x = randi() % int(get_viewport_rect().size.x + 10000)
	velocity.y = min_speed
	contact_monitor = true
	set_max_contacts_reported(4)
	linear_velocity = velocity

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name == "Ship":
			c.change_score(score)
			queue_free()
		if c.name =="Zombie":
			queue_free()
		
	if position.y > get_viewport_rect().size.y + 10000:
		queue_free()

func _integrate_forces(state):
	#state.set_linear_velocity(velocity)
	pass
