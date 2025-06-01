class_name EnvelopeIdle
extends State

## Variable exports to refrence different morphs (state)
@export var envelope_move: State
@export var envelope_glide: State

# State functions

func enter() -> void:
	print("Envelope: Idle")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return envelope_glide
	if Input.get_vector("move_left", "move_right", "move_forward", "move_back"):
		return envelope_move
	return null

func process_physics(delta: float) -> State:
	return null
