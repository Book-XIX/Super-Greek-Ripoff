extends KinematicBody2D

const UP_DIRECTION := Vector2.UP

export var speed := 600.0
export var max_jumps := 1
export var gravity := 4500.0
export var jump_strength := 1500.0

var _jumps_made := 0
var _velocity := Vector2.ZERO

var _is_alive := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _process(delta):

func _physics_process(delta) -> void:
	var _horizon_dir = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)

	_velocity.x = _horizon_dir * speed
	_velocity.y += gravity * delta

	var is_jumping := Input.is_action_just_pressed("jump") and is_on_floor()
	var is_jump_cancelled := Input.is_action_just_released("jump") and _velocity.y < 0.0
	var is_idling:= is_on_floor() and is_zero_approx(_velocity.x)
	var is_running := is_on_floor() and not is_zero_approx(_velocity.x)

	if is_jumping:
		_jumps_made += 1
		_velocity.y = -jump_strength
	elif is_jump_cancelled:
		_velocity.y = 0.0
	elif is_idling or is_running:
		_jumps_made = 0

	_velocity = move_and_slide(_velocity, UP_DIRECTION)

	pass
