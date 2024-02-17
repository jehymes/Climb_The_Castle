extends Node

#Block_Level_Height
var block_level_height = 96

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
var movement_speed: float = -0.5
var jump_force: float = 70.0
var climb_ladder: float = 40
var on_ladder: bool = false

func StackTrace(text: String, args: Array) -> void:
	var trace = text
	print(trace % args)
