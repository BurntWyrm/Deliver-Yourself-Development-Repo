class_name MovementMachine
extends Node

## Movement Machine to manage each morph's movement (states)

# Modifiable state variables containing initialized and starting states (movement)
@export var starting_state: State
@export var current_state: State

# Intializes the state machine to give each movement states a reference to the player,
# which enables the ability to enter the default starting_state.
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent
	change_state(starting_state)

func deinit() -> void:
	for child in get_children():
		child.parent = null
	if current_state:
		current_state.exit()
		current_state = null

# Change to the new state by first calling any exit logic on the current state.
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()

# Functions that pass through for the Player to call.
# Handles state changes as needed.
func process_physics(delta: float) -> void:
	if current_state == null:
		return
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	if current_state == null:
		return
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	if current_state == null:
		return
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
