extends KinematicBody2D
const UP_DIRECTION = Vector2.UP
var speed := 400
var jump  := 100
var gravity := 1400
var running := 700

var velocity = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Speed is:")
	print(speed)
	print("Gravity is")
	print(gravity)
	print("jump is")
	print(jump)
	print(" running is")
	print(running)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var _horizontal_direction = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	if Input.get_action_strength("ui_up"):
		velocity.x = _horizontal_direction * speed
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, UP_DIRECTION)
	
	if Input.get_action_strength("run"):
		velocity.x = _horizontal_direction * running
#	pass


