extends Node2D

func on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.velocity = Vector2.ZERO
		body.invert_position_movement()
		self.queue_free()
