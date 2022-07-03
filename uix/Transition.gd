extends Control

export var to_scene:String;

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#play(to_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play(to_scene:String):
	visible = true
	self.to_scene = to_scene
	$AnimationPlayer.play("fade_in")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if (anim_name == "fade_in"):
		$AnimationPlayer.play_backwards("fade_in")
		#yield($AnimationPlayer,"animation_finished")
		get_tree().call_deferred("change_scene",to_scene)
		
func change():
	
	get_tree().call_deferred("change_scene",to_scene)

		
