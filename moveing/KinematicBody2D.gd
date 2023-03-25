extends KinematicBody2D
const UP_DIRECTION = Vector2.UP
var speed := 0
var gravity := 1400
var jump_made := 0
var jump_strength := 100
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
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var _horizontal_direction = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	
	velocity.x = _horizontal_direction * speed
	velocity.y += gravity * delta
	var jump := Input.is_action_just_pressed("ui_up") and is_on_floor()
	
	
	velocity = move_and_slide(velocity, UP_DIRECTION)
	
	if Input.get_action_strength("run"):
		speed = 700

	if Input.get_action_strength("ui_right"):
		speed = 400
	if jump:
		jump_made += 1
		velocity.y = jump_strength
		
		

	
	 
	


