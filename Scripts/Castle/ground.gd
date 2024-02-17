extends Node2D

func _ready() -> void:
	await get_tree().create_timer(g.t_generate).timeout
	generate_ground()

func generate_ground() -> void:
	randomize()
	var id = randi_range(1,3)
	
	if g.total_ground > 1:
		var new_ground = load("res://Props/Castle/Ground/ground_"+str(id)+".tscn").instantiate()
		new_ground.position = $Exit.position
		add_child(new_ground)
		g.total_ground += -1
