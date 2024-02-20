extends Area2D

var speed: float = 80

func _ready():
	get_tree().create_timer(g.t_generate).timeout

func _process(delta) -> void:
	g.on_shoot = true
	position.x += speed * delta
