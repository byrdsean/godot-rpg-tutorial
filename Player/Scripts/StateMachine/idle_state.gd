class_name Idle_State extends State

@onready var walk: WalkState = $"../Walk"

func enter() -> void:
	set_idle_movement()
	
func exit() -> void:
	super.exit()

@warning_ignore("unused_parameter")
func process(delta: float) -> State:
	set_idle_movement()
	return null

@warning_ignore("unused_parameter")
func physics_process(delta: float) -> State:
	return null

func handle_input(event: InputEvent) -> State:
	if 0 < event.get_action_strength(InputConstants.DOWN):
		return walk
	elif 0 < event.get_action_strength(InputConstants.UP):
		return walk
	elif 0 < event.get_action_strength(InputConstants.LEFT):
		return walk
	elif 0 < event.get_action_strength(InputConstants.RIGHT):
		return walk
	else:
		return null
		
func set_idle_movement() -> void:
	set_player_velocity(Vector2.ZERO)

	match player.facing_direction:
		Vector2.UP:
			set_player_animation(PlayerAnimationConstants.IDLE_UP)
		Vector2.LEFT, Vector2.RIGHT:
			set_player_animation(PlayerAnimationConstants.IDLE_SIDE)
		_:
			set_player_animation(PlayerAnimationConstants.IDLE_DOWN)
