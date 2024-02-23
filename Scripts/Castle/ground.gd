extends Node2D

var goomy: CharacterBody2D = load("res://Props/Enemies/Goomy/goomy.tscn").instantiate()
var final_game = load("res://Props/Level/complete_game.tscn").instantiate()
var total_grounds = 16

func _ready() -> void:
	await get_tree().create_timer(g.t_generate).timeout
	generate_ground()

func generate_ground() -> void:
	randomize()
	var id = randi_range(1,total_grounds)
	var final_block = g.total_ground - 1
	var complete_game_block = g.total_ground - 2
	
	#Gounds gerados aleatóriamente no jogo
	if g.total_ground > 3:
		if g.pos_drag+1 == 4:
			var new_ground = load("res://Props/Castle/Ground/ground_16.tscn").instantiate()
			new_ground.position = $Exit.position
			add_child(new_ground)
			goomy.position = $Enemie_Spawn.position
			new_ground.add_child(goomy)
			g.total_ground += -1
		else:
			var new_ground = load("res://Props/Castle/Ground/ground_"+str(id)+".tscn").instantiate()
			new_ground.position = $Exit.position
			add_child(new_ground)
			g.total_ground += -1
	
	#Último ground acessível do game.
	if complete_game_block == 1:
		var new_ground = load("res://Props/Castle/Ground/ground_final.tscn").instantiate()
		new_ground.position = $Exit.position
		add_child(new_ground)
		g.total_ground += -1
	
	#Ground de topo para fechar o castelo
	if final_block == 1:
		var new_ground = load("res://Props/Castle/Ground/ground_1.tscn").instantiate()
		new_ground.position = $Exit.position
		add_child(new_ground)
		g.total_ground += -1
