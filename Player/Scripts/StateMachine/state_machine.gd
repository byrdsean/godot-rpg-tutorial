class_name State_Machine extends Node

var current_state: State = null
var previous_state: State = null
static var player: Player = null

@onready var idle: Node = $Idle

func initialize(_player: Player) -> void:
	assert(_player != null, "Initializing player in Player state machine can not be null.")
	player = _player
	change_state(idle)

func change_state(new_state: State) -> void:
	if new_state == null || new_state == current_state:
		return
		
	if current_state:
		current_state.exit()
		
	previous_state = current_state
	current_state = new_state
	current_state.enter()

func process(delta: float) -> void:
	var new_state = current_state.process(delta)
	change_state(new_state)
	play_current_animation()
	player.update_velocity(current_state.movement_direction)

func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	change_state(new_state)

func handle_input(event: InputEvent) -> void:
	var new_state = current_state.handle_input(event)
	change_state(new_state)

func play_current_animation() -> void:
	if !current_state:
		return
		
	var player_animation = player.animation_player.current_animation
	var current_state_animation = current_state.current_animation
	
	if current_state_animation != player_animation:
		player.animation_player.play(current_state_animation)
