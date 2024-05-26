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
	if Global.player_door == Global.player_now:
		if Global.player_position.x > self.global_position.x + 3 or Global.player_position.y > self.global_position.y - 9.8:
			self.top_level = true 
		else:
			self.top_level = false
		if !Global.opened_doors[Global.player_now - 1] and player_nearby and Input.is_action_just_pressed("interact"):
			if !password_open:
				show_password_ui()
				password_open = true

func _on_area_2d_body_entered(body):
	if !Global.opened_doors[Global.player_now - 1] and "player" in body.get_groups(): 
		$Sprite2D.play("int") 
		player_nearby = true

func _on_area_2d_body_exited(body):
	if !Global.opened_doors[Global.player_now - 1] and "player" in body.get_groups(): 
		$Sprite2D.play("default") 
		player_nearby = false

func show_password_ui():
	password_ui_instance = password_ui_scene.instantiate()
	add_child(password_ui_instance)
	var line_edit = password_ui_instance.get_node("LineEdit") as LineEdit
	Global.can_move = false
	line_edit.connect("text_changed", Callable(self, "_on_text_changed"))
	line_edit.connect("text_submitted", Callable(self, "_on_password_entered"))
	line_edit.grab_focus()

func _on_text_changed(new_text):
	var line_edit = password_ui_instance.get_node("LineEdit")
	var filtered_text = ""
	for i in range(new_text.length()):
		if new_text[i].is_valid_int():
			filtered_text += new_text[i]
	if line_edit.text != filtered_text:
		line_edit.text = filtered_text

func _on_password_entered(input_password):
	if input_password == str(Global.password):
		Global.opened_doors[Global.player_now - 1] = true
		$Sprite2D.play("aberta")
		$CollisionShape2D.disabled = true
		password_ui_instance.queue_free()
	else:
		Global.tween = 1
		password_ui_instance.queue_free()
	Global.can_move = true
	password_open = false




