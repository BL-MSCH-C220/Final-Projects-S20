extends RigidBody2D


export var score = 100
export var damage = 25
export var speed = 25
export var move_probability = 0.10

var ready = false
onready var Player = get_node("/root/Game/Ship")
var new_position = Vector2(0,0)

#func get_new_position():
	#var VP = get_viewport_rect().size
	#new_position.x = randi() % int(VP.x)
	#new_position.y = min(randi() % int(VP.y), int(VP.y))
	#$Tween.interpolate_property(self, "position", position, new_position, speed, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	#ready = true

func die():
	get_parent().queue_free()

func _ready():
	randomize()
	var VP = get_viewport_rect().size
	position.x = randi() % int(VP.x)
	position.y = -10
	#get_new_position()


func _physics_process(delta):
	if ready:
		$Tween.start()
		ready = false
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name == "Ship":
			Player.change_health(-damage)
			get_parent().queue_free()

	if position.y > get_viewport_rect().size.y + 10:
		queue_free()

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,speed))
	state.set_angular_velocity(0)


#func _on_Timer_timeout():
	#if randf() < move_probability:
		#get_new_position()
