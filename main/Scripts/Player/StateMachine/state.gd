# Virtual base class for all states
class_name State
extends Node

## Variable exports

# Variable that references to the parent so that it can be controlled by the state
var parent: Player

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
