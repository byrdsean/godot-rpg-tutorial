class_name WalkState extends State

@export var move_speed : float = 100.0
@onready var idle: Idle_State = $"../Idle"

func enter() -> void:
	set_walk_movement()
	
func exit() -> void:
	super.exit()

@warning_ignore("unused_parameter")
func process(delta: float) -> State:
	set_walk_movement()
	return null

@warning_ignore("unused_parameter")
func physics_process(delta: float) -> State:
	return null

func handle_input(event: InputEvent) -> State:
	if 0 < event.get_action_strength(InputConstants.DOWN):
		return self
	elif 0 < event.get_action_strength(InputConstants.UP):
		return self
	elif 0 < event.get_action_strength(InputConstants.LEFT):
		return self
	elif 0 < event.get_action_strength(InputConstants.RIGHT):
		return self
	else:
		return idle
		
func set_walk_movement() -> void:
	match player.facing_direction:
		Vector2.UP:
			set_player_animation(PlayerAnimationConstants.WALK_UP)
			set_player_velocity(Vector2.UP * move_speed)
		Vector2.LEFT:
			set_player_animation(PlayerAnimationConstants.WALK_SIDE)
			set_player_velocity(Vector2.LEFT * move_speed)
		Vector2.RIGHT:
			set_player_animation(PlayerAnimationConstants.WALK_SIDE)
			set_player_velocity(Vector2.RIGHT * move_speed)
		_:
			set_player_animation(PlayerAnimationConstants.WALK_DOWN)
			set_player_velocity(Vector2.DOWN * move_speed)
