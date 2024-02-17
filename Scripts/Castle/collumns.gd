extends Node2D

func _ready() -> void:
	await get_tree().create_timer(g.t_generate).timeout
	generate_block_collumns()
	
func generate_block_collumns() -> void:
	if g.total_collumns > 1:
		var new_collumn = load("res://Props/Castle/Collumns/collumns.tscn").instantiate()
		new_collumn.position = $Exit.position
		add_child(new_collumn)
		g.total_collumns += -1
	else:
		var top = load("res://Props/Castle/Top/top.tscn").instantiate()
		top.position = $Exit.position
		add_child(top)
		g.total_collumns += -1

func on_area_body_entered(body):
	if body.is_in_group("player"):
		body.velocity = Vector2.ZERO
		body.invert_position_movement()
