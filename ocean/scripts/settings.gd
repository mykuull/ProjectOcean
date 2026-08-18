extends Control

@onready var volume_selector = %Volume

func _ready() -> void:

	volume_selector.set_valor_numerico(SaveLoad.contents.volume) # le decimos que muestre el valor guardado

func _process(delta: float) -> void:
	pass

func _on_back_pressed() -> void:
	
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn") # Scene to go back to

func _on_volume_numeric_value_changed(new_value: int) -> void:
	SaveLoad.set_volume(new_value)
