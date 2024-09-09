extends State
class_name PlayerIdle

func Enter():
	pass
	
func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash")):
		pass # -> dash state
	
	if (Input.get_axis("Move_Left", "Move_Right")):
		pass # -> ground move state
	
	if (Input.is_action_just_pressed("Jump")):
		pass # -> air move state
	
func Exit():
	pass
