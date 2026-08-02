extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	SoundManager._play_pressed1_sound()

func _on_mouse_entered() -> void:
	SoundManager._play_hover_sound()
