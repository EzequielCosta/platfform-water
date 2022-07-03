extends CanvasLayer

onready var label_timer = $LabelTimer
var time = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.score = 0




func _on_Timer_timeout() -> void:
	time += 1
	Globals.score = time
	label_timer.text = str(time)
