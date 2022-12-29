extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var button1 = $VBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	button1.focus_mode = Control.FOCUS_ALL


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
