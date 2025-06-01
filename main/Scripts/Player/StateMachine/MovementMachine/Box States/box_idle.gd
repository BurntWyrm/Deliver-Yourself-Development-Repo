class_name BoxIdle
extends State

## Variable exports to refrence different morphs (state)
@export var box_move: State
@export var box_jump: State

# State functions

func enter() -> void:
	print("Box: Idle")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return box_jump
	if Input.get_vector("move_left", "move_right", "move_forward", "move_back"):
		return box_move
	return null

func process_physics(delta: float) -> State:
	return null
