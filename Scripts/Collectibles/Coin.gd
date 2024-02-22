extends Node2D

@onready var anim: AnimationPlayer = get_node("Animation")
var anim_finished: bool = false

func on_area_body_entered(body):
	if body.is_in_group("player"):
		anim.play("Collect")
		if anim_finished:
			self.queue_free()

func on_animation_animation_finished(anim_name):
	if anim_name == "Collect":
		g.score_in_game += 1
		anim_finished = true
