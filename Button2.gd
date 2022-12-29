extends Button

func tex_export_png(path, src): 	
	if src.get_extension() != "stex":
		print("Invalid texture extention (require *.stex)")
		return FAILED
	var tex = StreamTexture.new()
	var err = tex.load(path+"/"+src)
	if err != OK:
		print("Error loading texture")
		return FAILED
	
	var cc = src.findn(".png")
	if cc == -1:
		print("Invalid PNG image (require *.png.*.stex)")
		return FAILED
	
	var img = tex.get_data()
	img.save_png("user://"+src.left(cc)+".png")
	print("Success exporting "+src)
	return OK

func export_dir_contents(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var n_success = 0
		while file_name != "":
			if not dir.current_is_dir():
				if file_name.get_extension() == "stex":
					if tex_export_png(path, file_name) == OK:
						n_success = n_success + 1
			file_name = dir.get_next()
		return n_success
	else:
		print("An error occurred when trying to access the path.")
		return 0

# Called when the node enters the scene tree for the first time.
func _pressed():
	print("Check output in %AppData%\\godot\\StreamTextureExport "+str(export_dir_contents("res://assets"))+ " success")
