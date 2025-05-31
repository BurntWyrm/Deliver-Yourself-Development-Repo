class_name Player
extends RigidBody3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_state_machine: Node = $PlayerStateMachine

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the different states
	# That way they can react and function accordingly
	player_state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	player_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	player_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	player_state_machine.process_frame(delta)
