extends CanvasLayer

# 1. Vinculamos los nodos de la escena a variables usando el %
@onready var label_tiempo = %Label
@onready var boton_control = %Button

func _ready() -> void:
	
	if ChronometerScript.has_signal("time_changed"):
		ChronometerScript.time_changed.connect(_on_time_changed)
	
	# 
	if boton_control:
		boton_control.pressed.connect(_on_boton_control_pressed)
	
	label_tiempo.text = "00:00"
	_actualizar_texto_boton()

func _on_time_changed(minutes: int, seconds: int) -> void:
	label_tiempo.text = "%02d:%02d" % [minutes, seconds]

func _on_boton_control_pressed() -> void:
	# Cambiamos el estado en el script global
	ChronometerScript.esta_activo = !ChronometerScript.esta_activo
	_actualizar_texto_boton()

func _actualizar_texto_boton() -> void:
	if not boton_control:
		return
		
	if ChronometerScript.esta_activo:
		boton_control.text = "Desactivar"
	else:
		boton_control.text = "Activar"


func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/shop_placeholder.tscn") # go to shop
