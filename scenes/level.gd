extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate():
	print('player had entered the gate')


func _on_gate_player_exited_gate():
	print('player has exited the gate')


func _on_player_laser_input(pos, direction):
	print('laser has been fired')
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$Projectiles.add_child(laser)


func _on_player_grenade_input(pos, direction):
	print('grenade has been thrown')
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	
	

