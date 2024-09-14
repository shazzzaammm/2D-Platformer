extends State
class_name PlayerWallJump

var player:Player
var timer:float
var gravity:float

func Enter():
	state_transition.emit()
	player=get_parent().get_parent()
	gravity = player.jump_gravity
	player.velocity = Vector2(player.get_wall_normal().x * player.wall_jump_power, -player.jump_power)
	timer = player.wall_jump_time

func Update(_delta:float):
	if timer <= 0:
		get_parent().change_state(self, "PlayerAirMovement")
	if Input.is_action_just_released("Jump"):
		gravity = player.fall_gravity
	if (Input.is_action_just_pressed("Dash") and player.can_dash 
	and Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down") != Vector2.ZERO):
		get_parent().change_state(self, "PlayerDash")
	player.velocity.y -= gravity * _delta
	player.velocity.x = player.get_wall_normal().x * player.wall_jump_power
	timer -= _delta


func Exit():
	player.velocity.x = 0
