extends KinematicBody2D

var direction = Vector2.LEFT
var velocity = Vector2.ZERO
var dircheck = 0
signal die

onready var Check_Ledge: = $Check_Ledge

func _physics_process(delta):
	
	var found_wall = is_on_wall()
	# var found_ledge = not Check_Ledge.is_colliding()
	
	if found_wall: 
		direction *= -1
		dircheck = 1
		if dircheck == 1:
			$AnimatedSprite.flip_h = false
		
		else:
			$AnimatedSprite.flip_h = true
			dircheck = 0
			
	#elif _on_player_hit:
		#die.emit()
		
	velocity = direction * 150
	move_and_slide(velocity, Vector2.UP)

	
	