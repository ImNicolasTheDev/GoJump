extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func game_over() -> void:
	get_tree().paused = true
	self.show()
