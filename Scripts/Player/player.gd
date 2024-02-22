extends CharacterBody2D

@onready var sprite: Sprite2D = get_node("Sprite")
@onready var animation: AnimationPlayer = get_node("Animation")
var is_dead: bool = false

var jump_count: int = 0

func _physics_process(delta):
	if !is_dead:
		move_player()
		gravity(delta)

func gravity(delta: float) -> void:
	if g.on_ladder:
		velocity.y = 0
	else:
		velocity.y += delta * g.GRAVITY

func move_player() -> void:
	if !g.on_ladder:
		animation.play("Walk")
		move_and_collide(Vector2(g.movement_speed, 0))
	
		if is_on_floor():		
			jump_count = 0
			
		if Input.is_action_just_pressed("jump") and jump_count < 1:
			velocity.y += -g.jump_force
			jump_count += 1
			
	move_and_slide()
	
	if g.on_ladder:
		animation.play("Climb")
		velocity.x = 0
		velocity.y += -g.climb_ladder
		
	move_and_slide()

func invert_position_movement() -> void:
	if sprite.flip_h:
		sprite.flip_h =  false
	else:
		sprite.flip_h = true
	
	g.movement_speed = g.movement_speed * -1
	return

func on_hit_box_area_entered(area):	
	animation.stop(true)
	if area.is_in_group("shoot"):
		is_dead = true
		velocity = Vector2.ZERO
		animation.play("Death")
		area.queue_free()
	
	if area.is_in_group("spikes"):
		is_dead = true
		velocity = Vector2.ZERO
		animation.play("Death")

func on_animation_animation_finished(anim_name):	
	if anim_name == "Death":
		g.on_shoot = false
		g.restart_variables()
		g.DEATHS += 1
		g.game_over()
