extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.player_nearby[0] and Input.is_action_just_pressed("interact") and Global.player_now == 2:
		Global.password = 1
		$AnimatedSprite2D.play("dir_int")

func _on_area_2d_body_entered(body):
	if "player" in body.get_groups():
		Global.player_nearby[0] = true 


func _on_area_2d_body_exited(body):
	if "player" in body.get_groups():
		Global.player_nearby[0] = false 
