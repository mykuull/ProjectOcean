extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit() # Quit the game.


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/settings.tscn") # Change scenes to settings


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/credits.tscn") # Change scenes to credits


func _on_chronometer_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/chronometer.tscn") # Change scenes to chronometer
