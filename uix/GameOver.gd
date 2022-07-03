extends Control

onready var label = $CenterContainer/Label
#export var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(Globals.score)
	var content = label.text
	label.text = content.replace("$ponto",  str(Globals.score))



func _on_Button2_pressed() -> void:
	$Transition.play("res://scene/World2.tscn")


func _on_ExitButton_pressed() -> void:
	get_tree().quit()
