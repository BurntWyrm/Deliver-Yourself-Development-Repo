extends RayCast3D

@onready var player: Player
var is_on_floor: bool

func _ready() -> void:
	player = owner.get_node("%Player3D")

func _physics_process(delta: float) -> void:
	position = player.position
	if is_colliding():
		is_on_floor = true
	else:
		is_on_floor = false
