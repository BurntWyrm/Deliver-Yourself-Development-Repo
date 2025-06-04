class_name EnvelopeMorph
extends State

## Variable exports to refrence different morphs (state)
@export var gift_morph: State
@export var box_morph: State
@onready var movement_machine: MovementMachine = $MovementMachine

@export var movement_torque := 3
@export var turning_torque := 5
@export var max_angular_speed := 5

# State functions

func enter() -> void:
	parent.animation.play("envelope_morph")
	movement_machine.init(parent)

func exit() -> void:
	movement_machine.deinit()

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("box_morph_swap"):
		return box_morph
	if Input.is_action_just_pressed("gift_morph_swap"):
		return gift_morph
	return null

func process_physics(delta: float) -> State:
	return null

# Calls Movement Machine's functions
func _unhandled_input(event: InputEvent) -> void:
	movement_machine.process_input(event)

func _physics_process(delta: float) -> void:
	movement_machine.process_physics(delta)

func _process(delta: float) -> void:
	movement_machine.process_frame(delta)
