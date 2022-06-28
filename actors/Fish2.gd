extends KinematicBody2D


var _velocity:Vector2 = Vector2.ZERO
var speed:Vector2 = Vector2(100, 400)

const GRAVITY = 10
var gravity = 500
var jump = 500
const FLOOR_NORMAL: = Vector2.UP
var OUT_WATER: bool = false;
onready var ray_cast := $RayCast2D
var life_player = 5;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#gravity = GRAVITY


func _physics_process(delta: float) -> void:
	
	
	var position_player = global_position
	var screen_size = get_viewport_rect().size
	
	position.y = clamp(position.y, 0, screen_size.y - 32)
	
	if(ray_cast.is_colliding()):
		pass
		#print("Collsion cast")
	
		
	if (Input.is_action_just_pressed("jump")):
		_velocity.y = -speed.y
	#elif (position_player.y > (screen_size.y - 32)):
	#	gravity = 0
	else:	
		_velocity.y += gravity * delta
	
	"""
	if (Input.is_action_pressed("ui_right")):
		$FishSprite.flip_h = true
		_velocity.x = speed.x
	elif (Input.is_action_pressed("ui_left")):
		$FishSprite.flip_h = false
		_velocity.x = -speed.x
	else:
		_velocity.x = 0
	"""
	#_velocity.x = speed.x
	#position.x += _velocity.x * delta
	#position.y += _velocity.y * delta
		
	move_and_slide(_velocity)

func in_water():
	pass
	#OUT_WATER = false
	
func out_water():
	pass
	#OUT_WATER = true
	#gravity = GRAVITY

func take_damage(value: float):
	life_player -= value
	
	if (life_player == 0):
		queue_free()

func _on_AreaEnemy_area_entered(area: Area2D) -> void:
	if (area.is_in_group("Enemy")):
		take_damage(1)
		print("Take damage")
