extends Area2D

var rotation_speed: int = 3
var available_options = ['laser','laser','laser','laser','laser', 'grenade', 'health']
var type = available_options[randi()%len(available_options)]

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1, 0.25, .87, 0.7)
	if type == 'grenade':
		$Sprite2D.modulate = Color(.87, 0.1, 0.25, 0.7)
	if type == 'health':
		$Sprite2D.modulate = Color( 0.1, .87, 0.25, 0.7)

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	if type == 'health':
		Globals.health += 10
	if type == 'laser':
		Globals.laser_amount += 5
	if type == 'grenade':
		Globals.grenade_amount += 1
	queue_free()
