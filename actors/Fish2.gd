extends KinematicBody2D

signal take_damage(life_remaing)
signal die(life_remain)

var _velocity:Vector2 = Vector2.ZERO
var speed:Vector2 = Vector2(100, 400)
onready var game_over_scene = load("res://uix/GameOver.tscn")
const GRAVITY = 10
var gravity = 700
var jump = 500
const FLOOR_NORMAL: = Vector2.UP
var OUT_WATER: bool = false;
onready var ray_cast := $RayCastCheckInWater
var life_player = 10;
var die = false
var into_water = false
var enter_in_water = false
var TIME_NEED_WATER = 20
var NEED_WATER = false

func _ready() -> void:
	pass
	#$AudioDamage.play()


func _physics_process(delta: float) -> void:
	
	if (!die):
	
		var screen_size = get_viewport_rect().size
		
		position.y = clamp(position.y, 0, screen_size.y - 32)
		
		if (NEED_WATER and $AnimationPlayer.current_animation != "without_breath"):
			$AnimationPlayer.play("without_breath")
			$TimerDying.start()
		elif (enter_in_water):	
		#elif (ray_cast.is_colliding() and ray_cast.get_collider().name == "Sia"):
			
			$TimerDying.stop()
			$AnimationPlayer.play("run")
			$TimerNeedWater.start(TIME_NEED_WATER)
			NEED_WATER = false
			#into_water = true
			enter_in_water = false
			
			
			
		if (Input.is_action_just_pressed("jump")):
			_velocity.y = -speed.y
			$AudioJump.play()
		else:	
			_velocity.y += gravity * delta
		
			
		move_and_slide(_velocity)
	else:
		
		_velocity.y += gravity * delta
		move_and_slide(_velocity)
		
func in_water():
	into_water = true
	enter_in_water = true
	
func out_water():
	into_water = false
	enter_in_water = false

func take_damage(value: float):
	if (die):
		return
	print(life_player)	
	life_player -= value
	
	if (life_player == 0):
		emit_signal("die", life_player)
		_die()
	else:
		$AudioDamage.play()
		emit_signal("take_damage", life_player)
		$AnimationPlayer.call_deferred("play","damage" )
	

func _on_AreaEnemy_area_entered(area: Area2D) -> void:
	if (area.is_in_group("Enemy")):
		take_damage(1)


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if (anim_name == "damage"):
		$AnimationPlayer.stop()
		$AnimationPlayer.play("run")
	elif(anim_name == "death"):
		pass
		#emit_signal("die", life_player)
		#get_tree().call_deferred('change_scene_to', a )



func _on_TimerNeedWater_timeout() -> void:
	if (!into_water):
		$TimerNeedWater.stop()
		NEED_WATER = true


func _on_TimerDying_timeout() -> void:
	_die()

func gravity_die() -> void:
	gravity = 3000
	
func _die():
	die = true
	$AnimationPlayer.call_deferred("play","death")
	
	
