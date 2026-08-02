extends Control

@onready var sfx_button_hover: AudioStreamPlayer = %SFXHoverUnhover
@onready var sfx_button_buy: AudioStreamPlayer = %SFXBuy
@onready var sfx_button_press1: AudioStreamPlayer = %SFXPress1
@onready var sfx_button_press2: AudioStreamPlayer = %SFXPress2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _play_pressed1_sound() -> void:
	
	sfx_button_press1.play() # Press

func _play_pressed2_sound() -> void:
	
	sfx_button_press2.play() # PressBack

func _play_hover_sound() -> void:
	
	sfx_button_hover.play() # HoverUnhover, PressLeft, PressRight

func _play_buy_sound() -> void:
	sfx_button_buy.play() # Buy
	
