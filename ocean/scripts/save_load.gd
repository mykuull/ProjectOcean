extends Node

const save_location = "user://savefile.json" # path to the save file.
# used user:// as it's guaranteed to be writeable

signal balance_changed(new_balance: float) # señal para avisar de cuándo cambia el balance

var contents: Dictionary = {
	"balance": 112.21,
	"test": false # deleteme
}

func _ready() -> void:
	_load() # carga el archivo de guardado (al iniciar el juego, pues save_load.gd está en autoload)

func add_balance(amount: float) -> void:
	contents.balance += amount # suma el valor indicado al balance
	balance_changed.emit(contents.balance) # notifica que ha cambiado el balance
	_save() # guarda los cambios

func set_balance(amount: float) -> void: # for debug
	contents.balance = amount # fija el balance directamente al valor indicado
	balance_changed.emit(contents.balance) # notifica que ha cambiado el balance
	_save() # guarda los cambios

func _save():
	print("Saving")
	var file = FileAccess.open(save_location, FileAccess.WRITE) # open the save file in write mode
	file.store_var(contents.duplicate()) # write the new data onto the file
	file.close()

func _load():
	print("Loading")
	if FileAccess.file_exists(save_location): # check if file exists (prevent error/crash)
		var file = FileAccess.open(save_location, FileAccess.READ) # read the data from the save file
		var data = file.get_var() # temp data storage
		file.close() # close since we can refer to the data variable
		
		# update data with save file
		var save_data = data.duplicate()
		contents.balance = save_data.balance
		contents.test = save_data.test
