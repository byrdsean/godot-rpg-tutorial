class_name Player extends CharacterBody2D

var facing_direction: Vector2 = Vector2.DOWN
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
	set_facing_direction(event)
	state_machine.handle_input(event)

func set_facing_direction(event: InputEvent) -> void:
	if 0 < event.get_action_strength(InputConstants.LEFT):
		facing_direction = Vector2.LEFT
	elif 0 < event.get_action_strength(InputConstants.RIGHT):
		facing_direction = Vector2.RIGHT
	elif 0 < event.get_action_strength(InputConstants.UP):
		facing_direction = Vector2.UP
	elif 0 < event.get_action_strength(InputConstants.DOWN):
		facing_direction = Vector2.DOWN
