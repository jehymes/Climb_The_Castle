extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite
var speed_goomy = 0.4
var limit_dir = 160
var limit_esq = 64

func _physics_process(delta) -> void:
	move(delta)

func on_area_2d_area_entered(area):
	if !area.is_in_group("player") || !area.is_in_group("spike"):
		invert_position_movement()

func move(delta) -> void:
	if $Ray_Wall.is_colliding():
		invert_position_movement()
	
	velocity.x = delta * speed_goomy
	move_and_collide(Vector2(speed_goomy, 0))

func invert_position_movement() -> void:
	if sprite.flip_h:
		sprite.flip_h =  false
		speed_goomy = speed_goomy * -1
		$Ray_Wall.scale.x *= -1
		return
	else:
		sprite.flip_h = true
		speed_goomy = speed_goomy * -1
		$Ray_Wall.scale.x *= -1
		return
