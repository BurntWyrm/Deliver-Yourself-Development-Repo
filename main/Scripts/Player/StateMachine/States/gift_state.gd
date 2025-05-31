extends State


@export var envelope_morph: State
@export var box_morph: State

func enter() -> void:
	print("gift morph")

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("envelope_morph_swap"):
		return envelope_morph
	if Input.is_action_just_pressed("box_morph_swap"):
		return box_morph
	return null
