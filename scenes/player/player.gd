extends CharacterBody2D

signal laser_input(pos, player_direction)
signal grenade_input(pos, player_direction)

var can_shoot: bool = true
var can_throw_grenade: bool = true

@export var max_speed: int = 500
@export var speed: int = max_speed

func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if (Input.is_action_pressed("primary action") and can_shoot and Globals.laser_amount > 0):
		Globals.laser_amount -= 1
		$GunParticles.emitting = true
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_shoot = false
		$LaserTimer.start()
		var player_direction = (get_global_mouse_position() - position).normalized()
		laser_input.emit(selected_laser.global_position, player_direction)
		
	if (Input.is_action_pressed("secondary action") and can_throw_grenade and Globals.grenade_amount > 0):
		Globals.grenade_amount -= 1
		var grenade_markers = $GrenadeStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		can_throw_grenade = false
		$GrenadeTimer.start()
		var player_direction = (get_global_mouse_position() - position).normalized()
		grenade_input.emit(selected_grenade.global_position, player_direction)

func _on_grenade_timer_timeout():
	can_throw_grenade = true # Replace with function body.


func _on_laser_timer_timeout():
	can_shoot = true # Replace with function body.
	

