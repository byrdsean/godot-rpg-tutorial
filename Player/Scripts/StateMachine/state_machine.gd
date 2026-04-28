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
	
	var current_animation = player.animation_player.current_animation
	if current_animation != current_state.animation_name:
		player.animation_player.play(current_state.animation_name)

func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	change_state(new_state)

func handle_input(event: InputEvent) -> void:
	current_state.handle_input(event)
