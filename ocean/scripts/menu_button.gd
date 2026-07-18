extends Button

@onready var sfx_hover_unhover: AudioStreamPlayer = $SFXHoverUnhover
@onready var sfx_press: AudioStreamPlayer = $SFXPress

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	sfx_press.play()

func _on_mouse_entered() -> void:
	sfx_hover_unhover.play()
