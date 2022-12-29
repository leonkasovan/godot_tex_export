extends Button

func _pressed():
	var tex = StreamTexture.new()
	var err
	var src = "circle.png-bb6027fc4e63126420105e77096d288e.s3tc.stex"
	err = tex.load("res://assets/"+src)
	if err != OK:
		print("Error loading texture")
	else:
		print("Success loading texture")
	
	var img = tex.get_data()
	img.save_png("user://circle.png")
	
