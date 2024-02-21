extends Node2D

func on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Props/Others/game_over.tscn")
