extends RigidBody2D

var player_nearby = false

func _ready():
	$Control.visible = false
	$Control/Label.text = str(Global.password)

func _process(_delta):
	if Global.player_paper == Global.player_now:
		$Control.global_position = Global.player_position + Vector2(-30, -70)
		if player_nearby and Input.is_action_just_pressed("interact"):
			detailed_view()
			Global.sound_fase1[2] = true

func _on_area_2d_body_entered(body):
	if "player" in body.get_groups():
		$Sprite2D.play("int")  
		player_nearby = true

func _on_area_2d_body_exited(body):
	if "player" in body.get_groups(): 
		$Sprite2D.play("default")  
		player_nearby = false

func detailed_view():
	$Control.visible = true
	$Timer.start()

func _on_timer_timeout():
	$Control.visible = false
	Global.sound_fase1[2] = false
	Global.sound_fase1[3] = true
