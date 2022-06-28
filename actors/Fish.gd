extends KinematicBody2D


var _velocity:Vector2 = Vector2.ZERO
var speed:Vector2 = Vector2(300, 330)

const GRAVITY = 10
var gravity = 305
var jump = 500
const FLOOR_NORMAL: = Vector2.UP
var OUT_WATER: bool = false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#gravity = GRAVITY


func _physics_process(delta: float) -> void:
	
	
	var position_player = global_position
	var screen_size = get_viewport_rect().size
	
	position.y = clamp(position.y, 0, screen_size.y - 32)
	
	if ($RayCast2D.is_colliding()):
		print("Co")
	"""
	if (position.y > (screen_size / 2).y) :
		print("Water")
	else:
		print("out water")
	"""
	
		
	if (Input.is_action_just_pressed("jump")):
		_velocity.y = -speed.y
	#elif (position_player.y > (screen_size.y - 32)):
	#	gravity = 0
	else:	
		_velocity.y += gravity * delta
	
	if (Input.is_action_pressed("ui_right")):
		$FishSprite.flip_h = true
		_velocity.x = speed.x
	elif (Input.is_action_pressed("ui_left")):
		$FishSprite.flip_h = false
		_velocity.x = -speed.x
	else:
		_velocity.x = 0
	
	
		
	move_and_slide(_velocity)

func in_water():
	pass
	#OUT_WATER = false
	
func out_water():
	pass
	#OUT_WATER = true
	#gravity = GRAVITY

