extends Area2D

var speed: float = 80

func _ready():
	get_tree().create_timer(g.t_generate).timeout

func _process(delta) -> void:
	position.x += speed * delta

func on_area_body_entered(body):
	if body.is_in_group("player"):
		print("Player Morreu")
		self.queue_free()
