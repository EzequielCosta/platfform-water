extends Control

var fish_demo = load("res://uix/FishDemo.tscn")

func _ready():
	$PauseButton.rect_pivot_offset = $PauseButton.rect_size / 2
	$ExitButton.rect_pivot_offset = $ExitButton.rect_size / 2


func _on_ExitBUtton_pressed():
	get_tree().quit()


func _on_TimerSpawnFish_timeout() -> void:
	pass
	

func _on_ExitButton_pressed() -> void:
	get_tree().quit()


func _on_PauseButton_pressed() -> void:
	$Transition.play("res://scene/World2.tscn")
