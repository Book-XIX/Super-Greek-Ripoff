extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	
func _on_Startbutton_pressed():
	get_tree().change_scene("res://scene/GameLevel1/Level1.tscn")


func _on_Quitbutton_pressed():
	get_tree().quit()