class_name GiftIdle
extends State

## Variable exports to refrence different morphs (state)
@export var gift_move: State

# State functions

func enter() -> void:
	print("Gift: Idle")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left", "move_right", "move_forward", "move_back"):
		return gift_move
	return null

func process_physics(delta: float) -> State:
	return null
