extends Node2D

var final_game = load("res://Props/complete_game.tscn").instantiate()
var total_grounds = 15

func _ready() -> void:
	await get_tree().create_timer(g.t_generate).timeout
	generate_ground()

func generate_ground() -> void:
	randomize()
	var id = randi_range(1,total_grounds)
	var final_block = g.total_ground - 1
	var complete_game_block = g.total_ground - 2
	
	if g.total_ground > 3:
			var new_ground = load("res://Props/Castle/Ground/ground_"+str(id)+".tscn").instantiate()
			new_ground.position = $Exit.position
			add_child(new_ground)
			g.total_ground += -1
	
	if complete_game_block == 1:
		var new_ground = load("res://Props/Castle/Ground/ground_final.tscn").instantiate()
		new_ground.position = $Exit.position
		add_child(new_ground)
		g.total_ground += -1
	
	if final_block == 1:
		var new_ground = load("res://Props/Castle/Ground/ground_1.tscn").instantiate()
		new_ground.position = $Exit.position
		add_child(new_ground)
		g.total_ground += -1
