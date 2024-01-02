extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")


func _on_player_laser_input(pos, direction): 
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$Projectiles.add_child(laser)


func _on_player_grenade_input(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	
	

func _on_house_player_entered():
	var camera_zoom_tween = get_tree().create_tween()
	camera_zoom_tween.tween_property($player/Camera2D, "zoom", Vector2(0.7, 0.7), 0.7)


func _on_house_player_exited():
	var camera_zoom_tween = get_tree().create_tween()
	camera_zoom_tween.tween_property($player/Camera2D, "zoom", Vector2(0.4, 0.4), 0.7)