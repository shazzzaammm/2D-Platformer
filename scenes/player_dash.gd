extends State
class_name PlayerDash
var player:Player
var input_vector:Vector2
var timer:float

func Enter():
	player = get_parent().get_parent()
	input_vector = Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down")
	if input_vector == Vector2.ZERO:
		get_parent().change_state(self, "PlayerAirMovement")
	timer = player.dash_time
	
func Update(_delta:float):
	player.velocity = input_vector.normalized() * player.dash_speed	
	timer -= _delta
	if timer <= 0:
		get_parent().change_state(self, "PlayerAirMovement")
	
func Exit():
	pass
