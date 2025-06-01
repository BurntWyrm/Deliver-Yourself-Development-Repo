class_name PlayerStateMachine
extends Node

# Modifiable state variables containing initialized and starting morph
@export var starting_morph: State
@export var current_morph: State

# Intializes the state machine to give each child (morphs) a reference to the player,
# which enables the ability to enter the default starting_morph.
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent
	change_morph(starting_morph)

# Change to the new morph by first alling any exit logic on teh current state.
func change_morph(new_morph: State) -> void:
	if current_morph:
		current_morph.exit()
	current_morph = new_morph
	current_morph.enter()

# Functions that pass through for the Player to call.
# Handles state changes as needed.
func process_physics(delta: float) -> void:
	var new_morph = current_morph.process_physics(delta)
	if new_morph:
		change_morph(new_morph)

func process_input(event: InputEvent) -> void:
	var new_morph = current_morph.process_input(event)
	if new_morph:
		change_morph(new_morph)

func process_frame(delta: float) -> void:
	var new_morph = current_morph.process_frame(delta)
	if new_morph:
		change_morph(new_morph)
