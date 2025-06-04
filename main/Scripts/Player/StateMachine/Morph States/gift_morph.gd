class_name GiftMorph
extends State

## Variable exports to refrence different morphs (state)
@export var box_morph: State
@export var envelope_morph: State
@onready var movement_machine: MovementMachine = $MovementMachine

# State functions

func enter() -> void:
	parent.animation.play("gift_morph")
	movement_machine.init(parent)

func exit() -> void:
	movement_machine.deinit()

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("envelope_morph_swap"):
		return envelope_morph
	if Input.is_action_just_pressed("box_morph_swap"):
		return box_morph
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
