extends KinematicBody2D


const _speed = Vector2(500,100)
var _velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#_velocity.x = -_speed.x


func _physics_process(delta: float) -> void:
	
	_velocity.x = -_speed.x
	
	move_and_slide(_velocity)
