extends Sprite






func _ready():
	pass 

func _process(_delta):
	#var move = Vector2(0,0)
	if Input.is_action_pressed("left"):
		if position.x >= 0:
			position.x = position.x -1
		
	if Input.is_action_pressed("right"):
		position.x = position.x +1
