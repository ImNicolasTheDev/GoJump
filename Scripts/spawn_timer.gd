extends Timer

var enemy_red = preload("res://Scenes/enemy_red.tscn")

func _on_timeout() -> void:
	randomize()
	var enemy = enemy_red.instantiate()
	enemy.position = Vector2(1000, 500)
	var scale_var = randi_range(1,3)
	enemy.scale = Vector2(scale_var, scale_var)
	get_tree().root.get_node("Node/Level").add_child(enemy)
	wait_time = randi_range(1,5)
