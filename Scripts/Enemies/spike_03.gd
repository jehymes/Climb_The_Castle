extends Node2D



func on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		#Matar o player - Game Over
		print("Player Morreu")
