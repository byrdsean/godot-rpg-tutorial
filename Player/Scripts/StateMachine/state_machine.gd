class_name State_Machine extends Node

var current_state: State = null
@export var initial_state: State

func initialize(player: CharacterBody2D) -> void:
	assert(initial_state != null, "Initial Player state is required.")
	
	for child in get_children():
		child.player = player
		
	change_state(initial_state)

func change_state(new_state: State) -> void:
	if new_state == null || new_state == current_state:
		return
		
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()

func process(delta: float) -> void:
	var new_state = current_state.process(delta)
	change_state(new_state)

func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	change_state(new_state)

func handle_input(event: InputEvent) -> void:
	var new_state = current_state.handle_input(event)
	change_state(new_state)
