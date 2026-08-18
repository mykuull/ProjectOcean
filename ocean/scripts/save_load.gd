extends Node

const save_location = "user://savefile.json" # path to the save file.
# used user:// as it's guaranteed to be writeable

signal balance_changed(new_balance: float) # señal para avisar de un cambio de balance
signal volume_changed(new_volume: int) # señal para avisar cambios de volumen

var contents: Dictionary = { # save file
	"balance": 112.3,
	"volume": 100
}

# SAVING AND LOADING DATA

func _ready() -> void:
	# _save() la primera vez que se abre el juego debe usarse _save() para crear el archivo de guardado que luego modificaremos
	_load() # carga el archivo de guardado (al iniciar el juego, pues save_load.gd está en autoload)

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
		contents.volume = save_data.volume
		SoundManager.set_volume(contents.volume)

# MANIPULATING DATA

func add_balance(amount: float) -> void:
	contents.balance += amount # suma el valor indicado al balance
	balance_changed.emit(contents.balance) # notifica que ha cambiado el balance
	_save() # guarda los cambios

func set_balance(amount: float) -> void: # for debug
	contents.balance = amount # fija el balance directamente al valor indicado
	balance_changed.emit(contents.balance) # notifica que ha cambiado el balance
	_save()

func set_volume(vol: int) -> void: # change the global app volume
	contents.volume = vol # fija el volumen escogido
	volume_changed.emit(contents.volume) # notifica el cambio de volumen
	_save()
