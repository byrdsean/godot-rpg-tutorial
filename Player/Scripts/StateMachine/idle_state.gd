class_name Idle_State extends State

func enter() -> void:
	self.animation_name = PlayerAnimationConstants.IDLE_DOWN
	
func exit() -> void:
	pass

func process(delta: float) -> State:
	return null

func physics_process(delta: float) -> State:
	return null

func handle_input(event: InputEvent) -> void:
	if 0 < event.get_action_strength(InputConstants.UP):
		self.animation_name = PlayerAnimationConstants.IDLE_UP
