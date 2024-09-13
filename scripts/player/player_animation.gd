extends Node

var player:Player
var tween:Tween
var sprite:Sprite2D
var initial_scale:Vector2
var dash_particle_system:CPUParticles2D

func _ready():
	player = get_parent()
	tween = player.create_tween()
	sprite = player.get_node("Sprite2D")
	initial_scale = sprite.scale
	dash_particle_system = player.get_node("DashTrail")
	dash_particle_system.lifetime = player.dash_time * 2
	
func on_jump():
	if tween:
		tween.kill()
	tween = player.create_tween()
	tween.tween_property(sprite, "scale", Vector2(initial_scale.x * .5, initial_scale.y * 2), .1)
	tween.tween_property(sprite, "scale", initial_scale, .1)

func on_land():
	if tween:
		tween.kill()
	tween = player.create_tween()
	tween.tween_property(sprite, "scale", Vector2(initial_scale.x * 2, initial_scale.y * .5), .1)
	tween.tween_property(sprite, "scale", initial_scale, .1)
	
func on_idle():
	# i dont know how to not have this here D:
	if not player:
		player = get_parent()
	if tween:
		tween.kill()
	tween = player.create_tween()
	tween.set_loops()
	tween.tween_property(sprite, "scale", Vector2(initial_scale.x * 1.1, initial_scale.y * 1.1), .25)
	tween.tween_property(sprite, "scale", initial_scale, .25)

func on_dash():
	dash_particle_system.restart()
	dash_particle_system.emitting = true

	
