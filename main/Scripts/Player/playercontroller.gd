class_name Player
extends RigidBody3D

# References the state machine
@onready var state_machine: Node = $StateMachine

func _ready() -> void:
# Initializes the state machine- with a reference of the player to the different states
	state_machine.init(self) 

# Calls state machine's various functions
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
