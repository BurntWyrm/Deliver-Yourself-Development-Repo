class_name Player
extends RigidBody3D

# References the state machine
@onready var state_machine: Node = $StateMachine
@onready var _camera: Camera3D

func _ready() -> void:
# Initializes the state machine- with a reference of the player to the different states
	state_machine.init(self) 
# References the camera with the unique name MainCamera3D in the scene the player is in
	_camera = owner.get_node("%MainCamera3D")

# Calls state machine's various functions
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	position.z += 1 * delta
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
