class_name BoxMorph
extends State

## Variable exports to refrence different morphs (state)
@export var gift_morph: State
@export var envelope_morph: State
@onready var movement_machine: MovementMachine = $MovementMachine

# State functions

func enter() -> void:
	parent.animation.play("box_morph")
	movement_machine.init(parent)

func exit() -> void:
	movement_machine.deinit()
	if parent.floor_checker.is_on_floor == true:
		parent.apply_impulse(Vector3.UP * 2)
		parent.angular_velocity = Vector3.ZERO
	else:
		return

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("envelope_morph_swap"):
		return envelope_morph
	if Input.is_action_just_pressed("gift_morph_swap"):
		return gift_morph
	return null

func process_physics(delta: float) -> State:
	return null

# Calls Movement Machine's functions
func _unhandled_input(event: InputEvent) -> void:
	movement_machine.process_input(event)

func _physics_process(delta: float) -> void:
	print(parent.floor_checker.is_on_floor)
	movement_machine.process_physics(delta)

func _process(delta: float) -> void:
	movement_machine.process_frame(delta)
