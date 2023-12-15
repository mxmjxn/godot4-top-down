extends CharacterBody2D

signal laser_input(pos)
signal grenade_input(pos, player_direction)

var move_speed: float = 500
var can_shoot: bool = true
var can_throw_grenade: bool = true

func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * move_speed
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if (Input.is_action_pressed("primary action") and can_shoot):
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_shoot = false
		$LaserTimer.start()
		laser_input.emit(selected_laser.global_position)
		
	if (Input.is_action_pressed("secondary action") and can_throw_grenade):
		var grenade_markers = $GrenadeStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		can_throw_grenade = false
		$GrenadeTimer.start()
		var player_direction = get_global_mouse_position() - position
		grenade_input.emit(selected_grenade.global_position, player_direction)

func _on_grenade_timer_timeout():
	can_throw_grenade = true # Replace with function body.


func _on_laser_timer_timeout():
	can_shoot = true # Replace with function body.

