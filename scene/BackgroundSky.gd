extends ParallaxBackground


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	$ParallaxLayer.motion_offset.x -= 200 * delta
	$ParallaxLayer.motion_offset.x -= 200 * delta
