extends Node2D



func on_area_2d_body_entered(body):
	#Complete Game
	if body.is_in_group("player"):
		print("Você finalizou o jogo!")
		get_tree().paused = true
