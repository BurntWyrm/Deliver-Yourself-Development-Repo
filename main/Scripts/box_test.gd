extends RigidBody3D

var movement_torque = 2
var max_angular_speed = 5

func _physics_process(delta: float) -> void:

	
	# Handles Jump
	if Input.is_action_just_pressed('jump'):
		rotation.z = 0
		apply_impulse(Vector3.UP * 5)
		angular_velocity = Vector3.ZERO
	
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y).normalized())

	if Input.is_action_pressed("move_forward"):
		apply_torque(Vector3(1,0,0) * movement_torque) 

	if angular_velocity.length() > max_angular_speed:
		angular_velocity = angular_velocity.normalized() * max_angular_speed

	print(direction)
