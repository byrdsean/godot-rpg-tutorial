class_name WalkDownState extends State

@onready var walk_up: WalkUpState = $"../WalkUp"
@onready var idle: Idle_State = $"../Idle"

func enter() -> void:
	self.current_animation = PlayerAnimationConstants.WALK_DOWN
	self.movement_direction.y = 1
	
func exit() -> void:
	pass

func process(delta: float) -> State:
	return null

func physics_process(delta: float) -> State:
	return null

func handle_input(event: InputEvent) -> State:
	if 0 < event.get_action_strength(InputConstants.UP):
		return walk_up
	else:
		return idle
