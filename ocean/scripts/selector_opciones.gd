extends HBoxContainer

#podemos configurar las variables desde el inspector del panel derecho
@export var titulo_opcion: String = "Opción"
@export var lista_opciones: Array[String] = ["A","B","C"]
@export var imagen_icono: Texture2D

var indice_actual = 0
#referencia a los nodos label, prepararlos antes de que exista la escena
@onready var etiqueta_titulo= $option
@onready var etiqueta_valor = $selecc
@onready var textura_icono = $icon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	etiqueta_titulo.text = titulo_opcion
	textura_icono.texture = imagen_icono
	
	if lista_opciones.size()>0:
		etiqueta_valor.text=lista_opciones[indice_actual]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_button_left_pressed() -> void:
	if lista_opciones.size()==0:return
	
	#si se presiona el botón disminuye en uno el índice que selecciona el valor
	indice_actual-=1
	if indice_actual<0:
		#si es menor que cero da la vuelta
		indice_actual = lista_opciones.size()-1
	
	#seleccion valor según índice
	etiqueta_valor.text = lista_opciones[indice_actual]
	
func _on_button_right_pressed()->void:
	if lista_opciones.size()==0:return 
	
	indice_actual+=1
	if indice_actual>=lista_opciones.size():
		indice_actual=0
	etiqueta_valor.text=lista_opciones[indice_actual]
