class_name Player
extends RigidBody3D

# References the state machine
@onready var state_machine: Node = $StateMachine
@onready var _camera: Camera3D
@onready var _player_camera: PhantomCamera3D
@onready var animation: AnimationPlayer = %AnimationPlayer
@onready var floor_checker: RayCast3D

func _ready() -> void:
# Initializes the state machine- with a reference of the player to the different states
	state_machine.init(self) 
# References the camera with the unique name MainCamera3D in the scene the player is in
	_camera = owner.get_node("%MainCamera3D")
	_player_camera = owner.get_node("%PlayerCamera")
	floor_checker = owner.get_node("%player_floor_checker")

# Calls state machine's various functions
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif Input.is_action_just_released("right_click"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	state_machine.process_physics(delta)
	print(floor_checker.is_on_floor)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
