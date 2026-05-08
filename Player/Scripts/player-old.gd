class_name PlayerOld extends CharacterBody2D

var move_speed : float = 100.0
var movement_direction: Vector2 = Vector2.ZERO
var facing_direction: Vector2 = Vector2.DOWN
var movement_state = "idle"

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("idle_down")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	SetMovementDirection()
	velocity = movement_direction * move_speed
	
	# if the player is not moving at all, then don't need to determine their new facing direction
	# and animation to play
	if movement_direction == Vector2.ZERO:
		pass
		
	SetFacingDirection()
	SetAnimation()

func _physics_process(delta: float) -> void:
	move_and_slide()
	pass
#
func SetAnimation() -> void:
	var updated_movement_state = "idle" if movement_direction == Vector2.ZERO else "walk"
	if updated_movement_state == movement_state:
		return
	else:
		movement_state = updated_movement_state
		
	var animation_direction: String = "down"
	if facing_direction == Vector2.UP:
		animation_direction = "up"
	elif facing_direction == Vector2.DOWN:
		animation_direction = "down"
	else:
		animation_direction = "side"
		
	var animation_to_play: String = movement_state + "_" + animation_direction
	animation_player.play(animation_to_play)
	
func SetMovementDirection() -> void:
	movement_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	movement_direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")

func SetFacingDirection() -> void:	
	if movement_direction.y > 0:
		facing_direction = Vector2.DOWN
		sprite.flip_h = movement_direction.x != 0 if sprite.flip_h else sprite.flip_h
	elif movement_direction.y < 0:
		facing_direction = Vector2.UP
		sprite.flip_h = movement_direction.x != 0 if sprite.flip_h else sprite.flip_h
	elif movement_direction.x > 0:
		facing_direction = Vector2.RIGHT	
		sprite.flip_h = false
	elif movement_direction.x < 0:
		facing_direction = Vector2.LEFT
		sprite.flip_h = true
