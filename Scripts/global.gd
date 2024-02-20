extends Node

# Timer Generate Blocks
var t_generate = 0.0

# Total Levels
var total_levels = 10

#Total Generate Collumns
var blocks_collumn_for_level = 4
var total_collumns = total_levels * blocks_collumn_for_level

#Total Generate Bricks
var blocks_brick_for_level = 1
var total_bricks = total_levels * blocks_brick_for_level

#Total Generate Ladder
var total_ladder = total_levels - 1

#Total Generate Ground
var total_ground = total_levels

#Player Globals
var GRAVITY: float = 200
var movement_speed: float = -0.7
var jump_force: float = 70.0
var climb_ladder: float = 40
var on_ladder: bool = false

#Dragon
var pos_drag = 0

#Shoot
var on_shoot: bool = false

func StackTrace(text: String, args: Array) -> void:
	var trace = text
	print(trace % args)

func game_over() -> void:
	get_tree().change_scene_to_file("res://Props/Others/game_over.tscn")

func restart_variables() -> void:
	#Total Generate Collumns
	total_collumns = total_levels * blocks_collumn_for_level
	#Total Generate Bricks
	total_bricks = total_levels * blocks_brick_for_level
	#Total Generate Ladder
	total_ladder = total_levels - 1
	#Total Generate Ground
	total_ground = total_levels
	#Player Globals
	on_ladder = false
	movement_speed = -0.7
	#Dragon
	pos_drag = 0
	#Shoot
	on_shoot = false
