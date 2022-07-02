extends KinematicBody2D


var _velocity:Vector2 = Vector2.ZERO
var speed:Vector2 = Vector2(400, 300)


const FLOOR_NORMAL: = Vector2.UP


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#gravity = GRAVITY


func _physics_process(delta: float) -> void:
	
	_velocity.x = -speed.x	
	move_and_slide(_velocity)





func _on_VisibilityEnabler2D_screen_exited() -> void:
	pass
	#queue_free()
