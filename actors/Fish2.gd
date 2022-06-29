extends KinematicBody2D


var _velocity:Vector2 = Vector2.ZERO
var speed:Vector2 = Vector2(100, 400)

const GRAVITY = 10
var gravity = 700
var jump = 500
const FLOOR_NORMAL: = Vector2.UP
var OUT_WATER: bool = false;
onready var ray_cast := $RayCastCheckInWater
var life_player = 30;

var TIME_NEED_WATER = 20
var NEED_WATER = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	
	#print("CURRENT ANIMATION: " + $AnimationPlayer.current_animation)
	var screen_size = get_viewport_rect().size
	
	position.y = clamp(position.y, 0, screen_size.y - 32)
	
	if (NEED_WATER and $AnimationPlayer.current_animation != "without_breath"):
		$AnimationPlayer.play("without_breath")
		$TimerDying.start(3)
	elif (ray_cast.is_colliding() and ray_cast.get_collider().name == "Sia"):
		$TimerDying.stop()
		$AnimationPlayer.play("run")
		NEED_WATER = false
		$TimerNeedWater.start(TIME_NEED_WATER)
		
	if (Input.is_action_just_pressed("jump")):
		_velocity.y = -speed.y
	else:	
		_velocity.y += gravity * delta

		
	move_and_slide(_velocity)

func in_water():
	pass
	
func out_water():
	pass

func take_damage(value: float):
	life_player -= value
	
	if (life_player == 0):
		set_physics_process(false)
		$AnimationPlayer.play("death")
	else:
		$AnimationPlayer.play("damage")
	

func _on_AreaEnemy_area_entered(area: Area2D) -> void:
	if (area.is_in_group("Enemy")):
		take_damage(1)


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if (anim_name == "damage"):
		$AnimationPlayer.stop(true)
		$AnimationPlayer.play("run")
	#elif (anim_name == "death"):
	#	pass


func _on_TimerNeedWater_timeout() -> void:
	$TimerNeedWater.stop()
	NEED_WATER = true
	#$AnimationPlayer.play("without_breath")


func _on_TimerDying_timeout() -> void:
	
	set_physics_process(false)
	$AnimationPlayer.play("death")
	
