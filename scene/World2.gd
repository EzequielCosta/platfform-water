extends Node2D


var shark = load("res://actors/Shark.tscn")
var positions: Array;
var rand;
const count_shark_for_time = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	positions = range(500, 600, 10)
	rand = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
	

func spwan_shark():
	for item in count_shark_for_time:
		var shark_instance = shark.instance()
		rand.randomize()
		shark_instance.position.y = positions[rand.randf_range(0,len(positions) -1)]
		rand.randomize()
		shark_instance.position.x = rand.randf_range(1000,2000) 
		add_child(shark_instance)
	


func _on_TimerSpwan_timeout() -> void:
	spwan_shark()
