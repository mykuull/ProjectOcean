extends Node

# Señal para avisar a la UI
signal time_changed(minutes: int, seconds: int)

var tiempo_acumulado: float = 0.0
var ultimo_segundo_registrado: int = -1
var esta_activo: bool = false 

func _process(delta: float) -> void:

	if not esta_activo:
		return 
		
	tiempo_acumulado += delta
	var segundos_totales: int = int(tiempo_acumulado)
	
	if segundos_totales != ultimo_segundo_registrado:
		ultimo_segundo_registrado = segundos_totales
		
		var mins = segundos_totales / 60
		var secs = segundos_totales % 60
		
		time_changed.emit(mins, secs)
