extends RigidBody2D

onready var Shield = load("res://Scenes/Shield.tscn")
var velocity = Vector2(0,0)
export var speed = 60
onready var collect = get_node("collect")

func _ready():
	velocity.y = speed
	contact_monitor = true
	set_max_contacts_reported(4)
	linear_velocity = velocity

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		var shield = Shield.instance()
		shield.position = position
		if c.name == "Player":
			get_node("/root/Game/Shield").add_child(shield)
			#collect.play(0)
			#$Timer.start()
		queue_free()
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _integrate_forces(state):
	#state.set_linear_velocity(velocity)
	pass

#func _on_Timer_timeout():
#	queue_free()
