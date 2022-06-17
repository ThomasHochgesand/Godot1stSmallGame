extends KinematicBody2D

const GRAVITY = 400
const SPEED = 60
const JUMP_POWER = 150
const UP_VECTOR = Vector2(0, -1)
var jumpcount = 0
var movement = Vector2()

func _ready():
	pass
	
func _process(delta):
	movement.x = 0
	
	
	#if is_on_ceiling() or is_on_floor():
	#	movement.y = 0
		
		
	movement.y += GRAVITY * delta
	
	check_key_input()
	
	movement = move_and_slide(movement, UP_VECTOR)
	
	set_animation()
	
func check_key_input():
	
	
	if Input.is_action_pressed("left"):
		movement.x = - 1 * SPEED
		
	if Input.is_action_pressed("right"):
		movement.x = 1 * SPEED
		
	if Input.is_action_just_pressed("jump"):
		
		if is_on_floor() and is_on_wall():
			movement.y = UP_VECTOR.y * JUMP_POWER
			jumpcount = -1
		if is_on_wall():
			jumpcount += 1
			if jumpcount <= 1:
				movement.y = UP_VECTOR.y * JUMP_POWER *0.95
			
		if is_on_floor():
			movement.y = UP_VECTOR.y * JUMP_POWER
	
	if is_in_air() and is_on_wall() == false:
		jumpcount =0
	
	
func set_animation():
	if movement.x < 0:
		$Sprite.flip_h = true
		$AnimationPlayer.play("walk")
		
	if movement.x > 0:
		$Sprite.flip_h = false
		$AnimationPlayer.play("walk")
		
	if movement.x == 0:
		$AnimationPlayer.play("idle")
	
	if is_in_air():
		$AnimationPlayer.play("air")
		
func is_in_air():
	return is_on_floor() == false and is_on_wall() == false

