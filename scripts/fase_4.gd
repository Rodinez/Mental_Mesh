extends Node2D

var be_tween = false
var opened = [false, false, false, false, false, false, false, false]
var okay = [false, false, false, false]
var plate = [true, true, true, true]
var sound = true

func _ready():
	Global.can_move = true
	Global.fase = 4
	Global.player_now = 1
	Global.leave = [0, 0]
	Global.dead = [false, false]
	Global.opened_doors = [false, false]
	Global.safe = [false, false]
	opened = [false,false,false,false,false,false,false,false]


func _process(_delta):
	if opened[0] and opened[4]:
		$TileMap.set_layer_enabled(3,false)
		$TileMap.set_layer_enabled(7,true)
		if plate[0]:
			$pressure_sound.play()
			plate[0] = false
		okay[0] = true
	if opened[1] and opened[5]:
		$TileMap.set_layer_enabled(4,false)
		$TileMap.set_layer_enabled(8,true)
		if plate[1]:
			$pressure_sound.play()
			plate[1] = false
		okay[1] = true
	if opened[2] and opened[6]:
		$TileMap.set_layer_enabled(5,false)
		$TileMap.set_layer_enabled(9,true)
		if plate[2]:
			$pressure_sound.play()
			plate[2] = false
		okay[2] = true
	if opened[3] and opened[7]:
		$TileMap.set_layer_enabled(6,false)
		$TileMap.set_layer_enabled(10,true)
		if plate[3]:
			$pressure_sound.play()
			plate[3] = false
		okay[3] = true
	if not false in okay:
		Global.opened_doors[0] = true
		Global.opened_doors[1] = true
		Global.safe[0] = true
		Global.safe[1] = true
		if sound:
			$door_sound.play()
			sound = false
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


func _on_pr_1_body_entered(_body):
	opened[0] = true

func _on_pr_1_body_exited(_body):
	opened[0] = false

func _on_pr_2_body_entered(_body):
	opened[1] = true

func _on_pr_2_body_exited(_body):
	opened[1] = false

func _on_pr_3_body_entered(_body):
	opened[2] = true

func _on_pr_3_body_exited(_body):
	opened[2] = false

func _on_pr_4_body_entered(_body):
	opened[3] = true

func _on_pr_4_body_exited(_body):
	opened[3] = false

func _on_pr_5_body_entered(_body):
	opened[4] = true

func _on_pr_5_body_exited(_body):
	opened[4] = false

func _on_pr_6_body_entered(_body):
	opened[5] = true

func _on_pr_6_body_exited(_body):
	opened[5] = false

func _on_pr_7_body_entered(_body):
	opened[6] = true

func _on_pr_7_body_exited(_body):
	opened[6] = false

func _on_pr_8_body_entered(_body):
	opened[7] = true

func _on_pr_8_body_exited(_body):
	opened[7] = false

func _on_as_body_entered(_body):
	Global.safe[0] = true

func _on_as_body_exited(_body):
	Global.safe[0] = false

func _on_as_2_body_entered(_body):
	if not true in Global.opened_doors:
		Global.safe[1] = true

func _on_as_2_body_exited(_body):
	if not true in Global.opened_doors:
		Global.safe[1] = false
