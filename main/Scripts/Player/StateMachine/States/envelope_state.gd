extends State


@export var box_morph: State
@export var gift_morph: State

func enter() -> void:
	parent.animation_player.play("envelope_state")
	print("envelope morph")

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("box_morph_swap"):
		return box_morph
	if Input.is_action_just_pressed("gift_morph_swap"):
		return gift_morph
	return null
