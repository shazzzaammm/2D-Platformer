extends State
class_name PlayerGroundedMovement

@export var speed : float

func Enter():
	pass

func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash")):
		pass # -> dash state

	if Input.is_action_just_pressed("Jump"):
		pass # -> air movement
	
	var movement_vector = Input.get_axis("Move_Left", "Move_Right")
	# Do ground movement

func Exit():
	pass
