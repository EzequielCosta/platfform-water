extends Node2D


var shark = load("res://actors/Shark.tscn")
var bird = load("res://actors/Bird.tscn")
var positions_shark: Array;
var positions_bird: Array;
var rand;
const count_shark_for_time = 3
const count_bird_for_time = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	positions_shark = range(500, 700, 10)
	positions_bird = range(0, 400, 10)
	rand = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
	

func spwan_shark():
	for item in count_shark_for_time:
		var shark_instance = shark.instance()
		rand.randomize()
		shark_instance.position.y = positions_shark[rand.randf_range(0,len(positions_shark) -1)]
		rand.randomize()
		shark_instance.position.x = rand.randf_range(1000,2000) 
		add_child(shark_instance)
	


func _on_TimerSpwan_timeout() -> void:
	spwan_shark()
	
	
func spwan_bird():
	for item in count_shark_for_time:
		var bird_instance = bird.instance()
		rand.randomize()
		bird_instance.position.y = positions_bird[rand.randf_range(0,len(positions_bird) -1)]
		rand.randomize()
		bird_instance.position.x = rand.randf_range(1000,2000) 
		add_child(bird_instance)
	


func _on_TimerSpwanBird_timeout() -> void:
	spwan_bird()


func _on_Sia_body_exited(body):
	if (body.name == "Fish"):
		body.out_water()
