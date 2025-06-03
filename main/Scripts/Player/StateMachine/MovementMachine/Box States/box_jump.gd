class_name BoxJump
extends State

@export var box_move: State
@export var box_idle: State
@onready var jump_cd: Timer = %JumpCd

var jump_amount := 2
var can_jump := true

func enter() -> void:
	print("Box: Jump")
	
	if can_jump and jump_amount > 0:
		parent.apply_impulse(parent.basis.y * 5)
		parent.angular_velocity = Vector3.ZERO
		jump_amount -= 1
		print("Jumped. Remaining:", jump_amount)

		if jump_amount == 0:
			can_jump = false
			jump_cd.start()
	else:
		print("Jump on cooldown.")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left", "move_right", "move_forward", "move_back"):
		return box_move
	return box_idle

func process_physics(delta: float) -> State:
	return null

func _on_jump_cd_timeout() -> void:
	jump_amount = 2
	can_jump = true
	print("Jump reset.")
