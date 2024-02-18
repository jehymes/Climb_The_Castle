extends Node2D

func _ready() -> void:
	await get_tree().create_timer(g.t_generate).timeout
	generate_block_collumns()
	
func generate_block_collumns() -> void:
	randomize()
	var id = 0
	
	if g.total_collumns > 1:
		#Calcula posição do bloco para saber se o dragão vai estar presente
		var impar = g.total_collumns % g.blocks_collumn_for_level-1
		if impar == 0:
			var D_10 = randi_range(1,10)
			if D_10 > 5:
				id = randi_range(2,3)
			else:
				id = 1
		else:
			id = 1
		
		if id != 1 && (g.pos_drag == 3):
			var new_collumn = load("res://Props/Castle/Collumns/collumns_"+str(id)+".tscn").instantiate()
			new_collumn.position = $Exit.position
			add_child(new_collumn)
			g.total_collumns += -1
			g.pos_drag += 1
		else:
			var new_collumn = load("res://Props/Castle/Collumns/collumns_1.tscn").instantiate()
			new_collumn.position = $Exit.position
			add_child(new_collumn)
			g.total_collumns += -1
			g.pos_drag += 1
		
	else:
		var top = load("res://Props/Castle/Top/top.tscn").instantiate()
		top.position = $Exit.position
		add_child(top)
		g.total_collumns += -1
		g.pos_drag += 1
	
	if g.pos_drag == 4:
		g.pos_drag = 0

func on_area_body_entered(body):
	if body.is_in_group("player"):
		body.velocity = Vector2.ZERO
		body.invert_position_movement()
	
	if body.is_in_group("boll"):
		body.queue_free()
