extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate():
	print('player had entered the gate')


func _on_gate_player_exited_gate():
	print('player has exited the gate')


func _on_player_laser_input(pos):
	print('laser has been fired')
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)


func _on_player_grenade_input(pos):
	print('grenade has been thrown')
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = Vector2.UP * 100
	$Projectiles.add_child(grenade)
	
	

