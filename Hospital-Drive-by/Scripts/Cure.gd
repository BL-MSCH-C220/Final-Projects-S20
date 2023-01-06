extends RigidBody2D

export var speed = 500
onready var Player = get_node("/root/Game/Ship")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		print(c.get_parent().name)
		if c.name == "Zombie":
			Player.change_score(c.score)
			c.die()
			queue_free()

		queue_free()

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,-speed))
	state.set_angular_velocity(0)
