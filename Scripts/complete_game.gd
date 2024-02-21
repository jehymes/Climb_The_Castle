extends Node2D

func on_area_2d_body_entered(body):
	#Complete Game
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Props/end_game.tscn")

func on_restart_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/climb_the_castle.tscn")

func on_quit_btn_pressed():
	get_tree().quit()

