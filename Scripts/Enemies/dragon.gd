extends Node2D

@onready var animation = get_node("Animation")
@onready var timer: Timer = $Shoot

var shoot: Node2D = preload("res://Props/Others/boll_attack.tscn").instantiate()

func on_wake_up_body_exited(body):
	if body.is_in_group("player"):
		timer.start()
		animation.play("Attack")

func on_sleep_body_entered(body):
	if body.is_in_group("player"):
		timer.stop()
		animation.play("Sleep")

func on_shoot_timeout():
	shoot.position = $Pos_Attack.position
	shoot.z_index = 1
	add_child(shoot)
