extends HBoxContainer

signal numeric_value_changed(new_value: int) # señal para avisar cambios numéricos

# podemos configurar las variables desde el inspector del panel derecho
@export var titulo_opcion: String = "Opción"
@export var lista_opciones: Array[String] = ["A","B","C"]
@export var imagen_icono: Texture2D

# modo numérico para volumen y otros
@export var modo_numerico: bool = false # activa selector como int en vez de array
@export var min_value: int = 0
@export var max_value: int = 100
@export var step_value: int = 5 # step. en cuánto cambia cada vez que se presiona

var indice_actual = 0
var valor_actual: int = 0 # valor numérico actual, solo usado si modo_numerico == True

# referencia a los nodos label, prepararlos antes de que exista la escena
@onready var etiqueta_titulo = $option
@onready var etiqueta_valor = $selecc
@onready var textura_icono = $icon


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	etiqueta_titulo.text = titulo_opcion
	textura_icono.texture = imagen_icono
	
	if modo_numerico: # para selectores numéricos
		valor_actual = max_value # start at max value
		etiqueta_valor.text = str(valor_actual) # update value to UI
	elif lista_opciones.size() > 0: # para selectores de texto
		etiqueta_valor.text = lista_opciones[indice_actual]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_valor_numerico(value: int) -> void:
	valor_actual = clamp(value, min_value, max_value) # nos aseguramos de que valor_actual se mantenga en nuestro rango
	etiqueta_valor.text = str(valor_actual)

func _on_button_left_pressed() -> void:
	
	SoundManager._play_hover_sound()
	
	if modo_numerico:
		valor_actual = max(min_value, valor_actual - step_value)
		etiqueta_valor.text = str(valor_actual)
		numeric_value_changed.emit(valor_actual)
		return
	
	if lista_opciones.size() == 0: 
		return
	
	# si se presiona el botón disminuye en uno el índice que selecciona el valor
	indice_actual -= 1
	if indice_actual < 0:
		# si es menor que cero da la vuelta
		indice_actual = lista_opciones.size()-1
	
	# seleccion valor según índice
	etiqueta_valor.text = lista_opciones[indice_actual]

func _on_button_right_pressed() -> void:
	
	SoundManager._play_hover_sound()
	
	if modo_numerico:
		valor_actual = min(max_value, valor_actual + step_value)
		etiqueta_valor.text = str(valor_actual)
		numeric_value_changed.emit(valor_actual)
		return
	
	if lista_opciones.size() == 0: 
		return 
	
	indice_actual += 1
	if indice_actual >= lista_opciones.size():
		indice_actual = 0
	etiqueta_valor.text = lista_opciones[indice_actual]
