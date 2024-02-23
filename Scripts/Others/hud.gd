extends ParallaxBackground

func _process(_delta:float) -> void:
	if g.score_in_game <= 9:
		$VBoxContainer/Level.text = "Level: 0" + str(g.level)
		$VBoxContainer/Score.text = "Score: 0" + str(g.score_in_game)
	else:
		$VBoxContainer/Level.text = "Level: " + str(g.level)
		$VBoxContainer/Score.text = "Score: " + str(g.score_in_game)
