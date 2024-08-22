extends RigidBody2D

var player_nearby = false

func _ready():
	pass

func _process(_delta):
	if Global.player_paper == Global.player_now:
		if player_nearby and Input.is_action_just_pressed("interact"):
			detailed_view()

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
