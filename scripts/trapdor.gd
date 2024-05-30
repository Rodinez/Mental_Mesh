extends RigidBody2D

var player_nearby = false
var accept = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.opened_doors[0] and Global.opened_doors[1] and !accept:
		$AnimatedSprite2D.play("aberta")
		accept = true
	elif !Global.opened_doors[0] or !Global.opened_doors[1]:
		accept = false
		$AnimatedSprite2D.play("default")
	if accept and player_nearby and Input.is_action_just_pressed("interact"):
		Global.leave[Global.player_now - 1] = 1


func _on_area_2d_body_entered(body):
	if accept and "player" in body.get_groups():
		$AnimatedSprite2D.play("int")
		player_nearby = true


func _on_area_2d_body_exited(body):
	if accept and "player" in body.get_groups(): 
		$AnimatedSprite2D.play("aberta")
		player_nearby = false
