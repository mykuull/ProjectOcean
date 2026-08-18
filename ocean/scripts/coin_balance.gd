extends HBoxContainer

@onready var display = %display # referencia al label que muestra el balance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SaveLoad.balance_changed.connect(_on_balance_changed)
	_update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update() -> void:
	display.text = str(SaveLoad.contents.get("balance"))
	
func _on_balance_changed(new_balance: float) -> void:
	display.text = str(new_balance)
