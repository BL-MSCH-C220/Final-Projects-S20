extends RigidBody2D

export var speed = 500
export var damage = 10
onready var Splash = load("res://Scenes/Splash.tscn")
onready var Player = get_node("/root/Game/Player")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		var splash = Splash.instance()
		splash.position = position
		splash.get_node("Sprite").playing = true
		get_node("/root/Game/Splash").add_child(splash)
		if c.name == "Player":
			Player.change_health(-damage)
		queue_free()

	if position.y > get_viewport_rect().size.y + 10:
		queue_free()

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,speed))
	state.set_angular_velocity(0)
