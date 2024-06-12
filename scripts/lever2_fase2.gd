extends RigidBody2D

var player_nearby = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("interact") and Global.player_now == 2:
		Global.password = 2
		$AnimatedSprite2D.play("dir_int")

func _on_area_2d_body_entered(body):
	if "player" in body.get_groups():
		player_nearby = true
		if Global.password == 2:
			$AnimatedSprite2D.play("dir_int")  
		else:
			$AnimatedSprite2D.play("esq_int")  


func _on_area_2d_body_exited(body):
	if "player" in body.get_groups():
		player_nearby = false
		if Global.password == 2:
			$AnimatedSprite2D.play("ativada")  
		else:
			$AnimatedSprite2D.play("default")  
