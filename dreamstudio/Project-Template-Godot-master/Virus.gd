extends RigidBody2D

export (int) var min_speed
export (int) var max_speed
var mob_types = ["walk", "swim", "fly"]


func _ready():
	$Sprite.animation = mob_types[randi() % mob_types.size()]
	$Sprite.play()

func _on_Visibility_screen_exited():
	queue_free()
