extends CharacterBody2D
class_name Player
@export_group("Ground")
@export var grounded_movement_speed:float
@export var grounded_friction_percentage:float
@export var grounded_acceleration_percentage:float
@onready var ground_check_ray:RayCast2D = $GroundCheck

@export_group("Air")
@export var air_movement_speed:float
@export var air_friction_percentage:float
@export var air_acceleration_percentage:float
@export var max_fall_speed:float

@export_group("Jump")
@export var jump_height:float
@export var jump_rising_time:float
@export var jump_falling_time:float
@export var coyote_time:float
@onready var coyote_timer:Timer = $CoyoteTimer 

var jump_queued:bool= false
var coyote_ready:bool = false

@onready var jump_power:float = (2.0 * jump_height) / jump_rising_time
@onready var jump_gravity:float = (-2.0 * jump_height) / (jump_rising_time * jump_rising_time)
@onready var fall_gravity:float = (-2.0 * jump_height) / (jump_falling_time * jump_falling_time)

@export_group("Wall Jump")
@export var wall_jump_length:float
@export var wall_jump_time:float

@onready var wall_jump_power:float = (2.0 * wall_jump_length) / wall_jump_time

@export_group("Dash")
@export var dash_distance:float
@export var dash_time:float

@onready var dash_speed = dash_distance / dash_time
var can_dash = true

func _ready():
	coyote_timer.wait_time = coyote_time

func _physics_process(_delta):
	move_and_slide()
	
func on_touch_ground():
	can_dash = true


func _on_coyote_timer_timeout():
	coyote_ready = false
