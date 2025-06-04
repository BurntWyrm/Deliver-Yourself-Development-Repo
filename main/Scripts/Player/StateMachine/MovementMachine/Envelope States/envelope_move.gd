class_name EnvelopeMove
extends State

## Variable exports to refrence different morphs (state)
@export var envelope_idle: State
@export var envelope_glide: State

@export var movement_torque := 1
@export var turning_torque := 2
@export var max_angular_speed := 2

# State functions

func enter() -> void:
	print("Envelope: Move")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var forward := parent._camera.global_basis.z
	var right := parent._camera.global_basis.x
	
	var move_direction = forward * input_dir.y + right * input_dir.x
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	
	if Input.is_action_pressed("move_forward"):
		parent.apply_torque(parent.basis.x * movement_torque) 

	if Input.is_action_pressed("move_back"):
		parent.apply_torque(-parent.basis.x * movement_torque)

	if Input.is_action_pressed("move_left"):
		parent.apply_torque(Vector3(0,1,0) * turning_torque) 

	if Input.is_action_pressed("move_right"):
		parent.apply_torque(Vector3(0,-1,0) * turning_torque) 

	if parent.angular_velocity.length() > max_angular_speed:
		parent.angular_velocity = parent.angular_velocity.normalized() * max_angular_speed

	if move_direction == Vector3.ZERO:
		return envelope_idle
	return null
