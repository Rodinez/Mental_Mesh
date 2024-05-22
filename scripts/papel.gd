extends RigidBody2D

var detailed_view_visible = false
var player_nearby = false

func _ready():
	$Control.visible = false
	$Control/Label.text = str(Global.password)

func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("interact"):
		toggle_detailed_view()

func _on_area_2d_body_entered(body):
	if "player" in body.get_groups():  
		player_nearby = true

func _on_area_2d_body_exited(body):
	if "player" in body.get_groups(): 
		player_nearby = false

func toggle_detailed_view():
	detailed_view_visible = !detailed_view_visible
	$Control.visible = detailed_view_visible
