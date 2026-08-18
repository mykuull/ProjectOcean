extends Control

@onready var sfx_button_hover: AudioStreamPlayer = %SFXHoverUnhover
@onready var sfx_button_buy: AudioStreamPlayer = %SFXBuy
@onready var sfx_button_press1: AudioStreamPlayer = %SFXPress1
@onready var sfx_button_press2: AudioStreamPlayer = %SFXPress2

@onready var master_bus_index: int = AudioServer.get_bus_index("Master") # master volume bus

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SaveLoad.volume_changed.connect(set_volume)
	set_volume(SaveLoad.contents.volume) # aplica el volumen guardado al arrancar el programa

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# AVAILABLE SOUNDS

func _play_pressed1_sound() -> void:
	
	sfx_button_press1.play() # Press

func _play_pressed2_sound() -> void:
	
	sfx_button_press2.play() # PressBack

func _play_hover_sound() -> void:
	
	sfx_button_hover.play() # HoverUnhover, PressLeft, PressRight

func _play_buy_sound() -> void:
	sfx_button_buy.play() # Buy


func set_volume(volume: int) -> void:
	if volume <= 0:
		AudioServer.set_bus_mute(master_bus_index, true)
	else:
		AudioServer.set_bus_mute(master_bus_index, false)
		AudioServer.set_bus_volume_db(master_bus_index, linear_to_db(volume / 100.0))
