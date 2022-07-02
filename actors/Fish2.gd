extends KinematicBody2D


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
var TIME_NEED_WATER = 30
var NEED_WATER = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	
	#print("Time remaning: ", $TimerDying.time_left)
	#print("NEED_WATER: ", NEED_WATER )
	#print("CURRENT ANIMATION: " + $AnimationPlayer.current_animation)
	
	if (!die):
	
		var screen_size = get_viewport_rect().size
		
		position.y = clamp(position.y, 0, screen_size.y - 32)
		
		if (NEED_WATER and $AnimationPlayer.current_animation != "without_breath"):
			$AnimationPlayer.play("without_breath")
			$TimerDying.start()
		elif (ray_cast.is_colliding() and ray_cast.get_collider().name == "Sia"):
			$TimerDying.stop()
			$AnimationPlayer.play("run")
			$TimerNeedWater.start(TIME_NEED_WATER)
			NEED_WATER = false
			into_water = true
			
			
		if (Input.is_action_just_pressed("jump")):
			_velocity.y = -speed.y
		else:	
			_velocity.y += gravity * delta
		
			
		move_and_slide(_velocity)
	else:
		
		_velocity.y += gravity * delta
		move_and_slide(_velocity)
		
func in_water():
	pass
	
func out_water():
	into_water = false

func take_damage(value: float):
	life_player -= value
	
	if (life_player == 0):
		_die()
		#die = true
		#$AnimationPlayer.play("death")

	else:
		print("Damage")
		$AnimationPlayer.call_deferred("play","damage" )
		#$AnimationPlayer.play("damage")
	

func _on_AreaEnemy_area_entered(area: Area2D) -> void:
	if (area.is_in_group("Enemy")):
		print("take damage")
		take_damage(1)


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if (anim_name == "damage"):
		$AnimationPlayer.stop()
		$AnimationPlayer.play("run")
	elif(anim_name == "death"):
		get_tree().call_deferred('change_scene_to', game_over_scene )



func _on_TimerNeedWater_timeout() -> void:
	if (!into_water):
		$TimerNeedWater.stop()
		NEED_WATER = true


func _on_TimerDying_timeout() -> void:
	_die()
	#$AnimationPlayer.play("death")
	#die = true

func gravity_die() -> void:
	gravity = 3000
	
func _die():
	$AreaEnemy.monitorable = false
	$AreaEnemy.monitoring = false
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("death")
	die = true
	
