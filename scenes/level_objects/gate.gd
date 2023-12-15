extends StaticBody2D

signal player_entered_gate
signal player_exited_gate


func _on_area_2d_2_body_entered(body):
	player_entered_gate.emit()


func _on_area_2d_2_body_exited(body):
	player_exited_gate.emit()
