extends Area2D

var speed: float = 80

func _ready():
	var _time = get_tree().create_timer(g.t_generate).timeout
	$SoundFX.play()

func _process(delta) -> void:
	g.on_shoot = true
	position.x += speed * delta
