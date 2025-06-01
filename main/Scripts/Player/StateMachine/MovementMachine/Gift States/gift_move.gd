class_name GiftMove
extends State

## Variable exports to refrence different morphs (state)
@export var gift_idle: State

# State functions

func enter() -> void:
	print("Gift: Move")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return gift_idle

func process_physics(delta: float) -> State:
	return null
