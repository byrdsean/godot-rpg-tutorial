@abstract
class_name State extends Node

var current_animation: String
var movement_direction: Vector2

func enter() -> void:
	pass
	
func exit() -> void:
	pass

@warning_ignore("unused_parameter")
func process(delta: float) -> State:
	return null

@warning_ignore("unused_parameter")
func physics_process(delta: float) -> State:
	return null

@warning_ignore("unused_parameter")
func handle_input(event: InputEvent) -> State:
	return null
