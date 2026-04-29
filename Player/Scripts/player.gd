class_name Player extends CharacterBody2D

var move_speed : float = 100.0
#var movement_direction: Vector2 = Vector2.ZERO
#var facing_direction: Vector2 = Vector2.DOWN
#var movement_state = "idle"
#
#@onready var sprite: Sprite2D = $Sprite2D

@onready var state_machine: State_Machine = $StateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.initialize(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	state_machine.process(delta)
	move_and_slide()

func _physics_process(delta: float) -> void:
	state_machine.physics_process(delta)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.handle_input(event)

func update_velocity(movement_direction: Vector2) -> void:
	if !movement_direction:
		return

	velocity = movement_direction * move_speed
