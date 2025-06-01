class_name EnvelopeMove
extends State

## Variable exports to refrence different morphs (state)
@export var envelope_idle: State
@export var envelope_glide: State

# State functions

func enter() -> void:
	print("Envelope: Move")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return envelope_idle

func process_physics(delta: float) -> State:
	return null
