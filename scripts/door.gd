extends RigidBody2D

var password_open = false
var password_ui_scene
var password_ui_instance
var player_nearby

func _ready():
	password_ui_scene = preload("res://Scenes/password.tscn")
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	Global.password = rng.randi_range(1000, 9999)

func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("interact"):
		if !password_open:
			show_password_ui()
			password_open = true

func _on_area_2d_body_entered(body):
	if "player" in body.get_groups():  
		player_nearby = true

func _on_area_2d_body_exited(body):
	if "player" in body.get_groups(): 
		player_nearby = false

func show_password_ui():
	password_ui_instance = password_ui_scene.instantiate()
	add_child(password_ui_instance)
	var line_edit = password_ui_instance.get_node("LineEdit") as LineEdit
	Global.can_move = false
	line_edit.connect("text_submitted", Callable(self, "_on_password_entered"))
	line_edit.connect("text_changed", Callable(self, "_on_text_changed"))
	line_edit.grab_focus()

func _on_text_changed(new_text):
	if !new_text.is_valid_int() and new_text != "":
		password_ui_instance.get_node("LineEdit").text = new_text.substr(0, new_text.length() - 1)

func _on_password_entered(input_password):
	if input_password == str(Global.password):
		queue_free()
	else:
		Global.tween = 1
		password_ui_instance.queue_free()
	Global.can_move = true
	password_open = false




