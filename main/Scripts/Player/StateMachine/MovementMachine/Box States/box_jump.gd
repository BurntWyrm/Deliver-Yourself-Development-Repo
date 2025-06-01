class_name BoxJump
extends State

## Variable exports to refrence different morphs (state)
@export var box_move: State
@export var box_idle: State

# State functions

func enter() -> void:
	print("Box: Jump")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return box_idle

func process_physics(delta: float) -> State:
	return null
