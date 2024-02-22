extends Node2D
@onready var root = get_node(".")
@onready var caixote = $Caixote
var dice_10: int = 0

func _ready() -> void:
	randomize()

func on_area_2d_body_entered(body):
	var coin: Node2D = load("res://Props/Collectibles/Coin.tscn").instantiate()
	dice_10 = randi_range(1,10)
	
	if body.is_in_group("player"):
		body.invert_position_movement()

		if dice_10 > 6:
			coin.position.y = coin.position.y - 3
			root.add_child(coin)
			caixote.queue_free()
		else:
			self.queue_free()
