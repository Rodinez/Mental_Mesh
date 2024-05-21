extends RigidBody2D

var correct_password = "1234"
var password_ui_scene
var password_ui_instance

func _ready():
	password_ui_scene = preload("res://Scenes/password.tscn")

func _process(_delta):
	pass

func _on_area_2d_body_entered(body):
	if body.name == "P1":
		show_password_ui()

func show_password_ui():
	password_ui_instance = password_ui_scene.instantiate()
	add_child(password_ui_instance)
	var line_edit = password_ui_instance.get_node("LineEdit") as LineEdit
	line_edit.connect("text_submitted", Callable(self, "_on_password_entered"))
	line_edit.grab_focus()

func _on_password_entered(input_password):
	Global.can_move = false
	if input_password == correct_password:
		Global.can_move = true
		queue_free()
	else:
		Global.tween = 1
		Global.can_move = true
		password_ui_instance.queue_free()




