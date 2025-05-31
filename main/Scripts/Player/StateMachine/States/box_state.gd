extends State

@export var envelope_morph: State
@export var gift_morph: State

func enter() -> void:
	print("box morph")

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("envelope_morph_swap"):
		return envelope_morph
	if Input.is_action_just_pressed("gift_morph_swap"):
		return gift_morph
	return null
