extends Node2D

func _ready() -> void:
	if g.SCORE > 9:
		$Score.text = str(g.SCORE)
	else:
		$Score.text = "0"+str(g.SCORE)
	
	if g.DEATHS > 9:
		$Deaths.text = str(g.DEATHS)
	else:
		$Deaths.text = "0"+str(g.DEATHS)
