extends Node2D

func _ready() -> void:
	await get_tree().create_timer(g.t_generate).timeout
	generate_ladder()
	
func generate_ladder() -> void:
	randomize()
	var id = randi_range(1,2)
	
	if g.total_ladder > 1:
		var new_ladder = load("res://Props/Castle/Ladder/ladder_"+str(id)+".tscn").instantiate()
		new_ladder.position = $Exit.position
		new_ladder.scale.x *= -1
		
		add_child(new_ladder)
		g.total_ladder += -1

func on_area_body_entered(body):
	if body.is_in_group("player"):
		if g.on_ladder == false:
			g.on_ladder = true

func on_area_body_exited(body):
	if body.is_in_group("player"):
		if g.on_ladder == true:
			g.score_in_game += 1
			g.level += 1
			g.on_ladder = false
			body.invert_position_movement()
