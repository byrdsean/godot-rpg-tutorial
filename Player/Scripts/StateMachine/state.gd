@abstract
class_name State extends Node

var player: CharacterBody2D

func enter() -> void:
	pass
	
func exit() -> void:
	player.animation_player.stop()
	player.velocity = Vector2.ZERO

@warning_ignore("unused_parameter")
func process(delta: float) -> State:
	return null

@warning_ignore("unused_parameter")
func physics_process(delta: float) -> State:
	return null

@warning_ignore("unused_parameter")
func handle_input(event: InputEvent) -> State:
	return null

func set_player_animation(new_animation: String) -> void:
	if (player.animation_player.current_animation == new_animation):
		return
		
	player.animation_player.stop()
	player.animation_player.play(new_animation)

func set_player_velocity(movement_vector: Vector2) -> void:
	player.velocity = movement_vector
