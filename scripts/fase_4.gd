extends Node2D

var be_tween = false
var opened = [false,false,false,false,false,false,false,false]

func _ready():
	Global.can_move = true
	Global.fase = 4
	Global.player_now = 1
	Global.leave = [0, 0]
	Global.opened_doors = [false, false]
	var opened = [false,false,false,false,false,false,false,false]


func _process(_delta):
	if Global.opened_doors[0]:
		$TileMap.set_layer_enabled(1,true)
		$trapdoor_p1.visible = true
	if Global.opened_doors[1]:
		$TileMap.set_layer_enabled(2,true)
		$trapdoor_p2.visible = true
	if Global.opened_doors[0] and Global.opened_doors[1] and not be_tween:
		be_tween = true
		Global.tween = 1
	if Global.leave[0] == 1:
		Global.player_now = 2
		$P1/Camera2D.enabled = false
		$P1.queue_free()
		Global.leave[0] = 2
		$trapdoor_sound.play()
	if Global.leave[1] == 1:
		Global.player_now = 1
		$P2/Camera2D.enabled = false
		$P2.queue_free()
		Global.leave[1] = 2
		$trapdoor_sound.play()
	if Global.leave[0] == 2 and Global.leave[1] == 2:
		get_tree().change_scene_to_file("res://Scenes/end.tscn")


func _on_pr_1_body_entered(body):
	pass # Replace with function body.

func _on_pr_1_body_exited(body):
	pass # Replace with function body.

func _on_pr_2_body_entered(body):
	pass # Replace with function body.

func _on_pr_2_body_exited(body):
	pass # Replace with function body.

func _on_pr_3_body_entered(body):
	pass # Replace with function body.

func _on_pr_3_body_exited(body):
	pass # Replace with function body.

func _on_pr_4_body_entered(body):
	pass # Replace with function body.

func _on_pr_4_body_exited(body):
	pass # Replace with function body.

func _on_pr_5_body_entered(body):
	pass # Replace with function body.

func _on_pr_5_body_exited(body):
	pass # Replace with function body.

func _on_pr_6_body_entered(body):
	pass # Replace with function body.

func _on_pr_6_body_exited(body):
	pass # Replace with function body.

func _on_pr_7_body_entered(body):
	pass # Replace with function body.

func _on_pr_7_body_exited(body):
	pass # Replace with function body.

func _on_pr_8_body_entered(body):
	pass # Replace with function body.

func _on_pr_8_body_exited(body):
	pass # Replace with function body.

func _on_as_body_entered(body):
	pass # Replace with function body.

func _on_as_2_body_entered(body):
	pass # Replace with function body.
