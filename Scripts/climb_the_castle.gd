extends Node2D

# Load de objetos para inicio do jogo
var background = preload("res://Props/Others/background.tscn").instantiate()
var grass_stats = preload("res://Props/Stats/stats.tscn").instantiate()
var door = preload("res://Props/Castle/Door/door.tscn").instantiate()
var collumns = preload("res://Props/Castle/Collumns/collumns_1.tscn").instantiate()
var bricks = preload("res://Props/Castle/Bricks/bricks.tscn").instantiate()
var ground = preload("res://Props/Castle/Ground/ground_1.tscn").instantiate()
var ladder = preload("res://Props/Castle/Ladder/ladder_1.tscn").instantiate()
var player = preload("res://Props/Player/anny.tscn").instantiate()
var hud = preload("res://Props/hud.tscn").instantiate()

func _ready() -> void:
	#HUD
	add_child(hud)
	
	#Background
	add_child(background)
	
	#Bricks
	set_position_obj(bricks, $Start_Bricks.position)
	
	#Collumns
	set_position_obj(collumns, $Start_Collumns.position)
	
	#Ground
	set_position_obj(ground, $Start_Ground.position)
	
	#Ladder
	set_position_obj(ladder, $Start_Ladder.position)
	
	#Stats
	set_position_obj(grass_stats, $Start_Grass_Out_Castle.position)
	
	#Door
	set_position_obj(door, $Start_Door.position)
	
	#Player
	set_position_obj(player, $Start_Player.position)
	
	g.restart_variables()

func _physics_process(_delta) -> void:
	check_point()

func set_position_obj(obj: Node2D, pos: Vector2) -> void:
	if pos != null:
		obj.position = pos
		add_child(obj)
	else:
		add_child(obj)

func check_point() -> void:
	if g.score_in_game > g.SCORE:
		g.SCORE = g.score_in_game
