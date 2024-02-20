extends Node2D

func _ready() -> void:
	await get_tree().create_timer(g.t_generate).timeout
	generate_block_bricks()
	
func generate_block_bricks() -> void:
	if g.total_bricks > 1:
		var new_brick = load("res://Props/Castle/Bricks/bricks.tscn").instantiate()
		new_brick.position = $Exit.position
		new_brick.z_index = -2
		add_child(new_brick)
		g.total_bricks += -1
