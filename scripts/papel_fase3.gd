extends RigidBody2D

var player_nearby = false
var paper_read = false

func _ready():
	pass

func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("interact") and Global.player_now == 2:
		paper_read = !paper_read
		if(paper_read):
			$Control.visible = true
			$paper_sound.play()
		else:
			$Control.visible = false

func _on_area_2d_body_entered(body):
	if "player" in body.get_groups():
		$Sprite2D.play("int")  
		player_nearby = true

func _on_area_2d_body_exited(body):
	if "player" in body.get_groups(): 
		$Sprite2D.play("default")  
		player_nearby = false

