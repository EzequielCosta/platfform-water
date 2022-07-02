extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	"""
	for i in range (1,15):
		print(get_node("Deep"+str(i)))
		get_node("Deep"+str(i)).rect_pivot_offset = rect_size / 2
		#$Deep1.rect_pivot_offset = rect_size / 2
	"""
	$Deep1.rect_pivot_offset = rect_size / 2
	$Deep2.rect_pivot_offset = rect_size / 2
	$Deep3.rect_pivot_offset = rect_size / 2
	$Deep4.rect_pivot_offset = rect_size / 2
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	get_tree().change_scene("res://scene/World2.tscn")


