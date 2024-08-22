extends Node2D

var lost = false
var paper_read = [false,false,false,false,false]
var floor_passed = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]


func _ready():
	Global.fase = 3
	Global.player_now = 1
	Global.leave = [0, 0]
	Global.opened_doors = [false, false]
	$Node2D/Control.visible = false
	$Node2D/Control/Label.text = "♙ _ _ _ _ \n _ _ _ _ _ \n _ _ _ _ _ \n _ ♙ _ _ _"
	$Node2D/Control/Label.label_settings.font_size = 16
	$Node2D/Control.global_position = Vector2(205,1235)
	$Node2D2/Control.visible = false
	$Node2D2/Control/Label.text = "_ _♞x x \n x♞_ _ x \n _ _ _ x _ \n _ _ _ _ _"
	$Node2D2/Control/Label.label_settings.font_size = 16
	$Node2D2/Control.global_position = Vector2(290,1235)
	$Node2D3/Control.visible = false
	$Node2D3/Control/Label.text = "_ _ _ _ _ \n x x _ _ _ \n _ ♚ _ _ _ \n x _ x _ _"
	$Node2D3/Control/Label.label_settings.font_size = 16
	$Node2D3/Control.global_position = Vector2(375,1235)
	$Node2D4/Control.visible = false
	$Node2D4/Control/Label.text = "_ _ _ _ _ \n ♜ _ _ _ _ \n _ _ _ _ _ \n ♜ _ _ _ _"
	$Node2D4/Control/Label.label_settings.font_size = 16
	$Node2D4/Control.global_position = Vector2(460,1235)
	$Node2D5/Control.visible = false
	$Node2D5/Control/Label.text = "_ _ _ _ _ \n _ _ _ _ ♛ \n _ _ _ _ _ \n x _ _ ♛ _"
	$Node2D5/Control/Label.label_settings.font_size = 16
	$Node2D5/Control.global_position = Vector2(545,1235)

func _process(_delta):
	if($Node2D.player_nearby and Input.is_action_just_pressed("interact") and Global.player_now == 2):
		paper_read[0] = !paper_read[0]
		if(paper_read[0]):
			$Node2D/Control.visible = true
		else:
			$Node2D/Control.visible = false
	if($Node2D2.player_nearby and Input.is_action_just_pressed("interact") and Global.player_now == 2):
		paper_read[1] = !paper_read[1]
		if(paper_read[1]):
			$Node2D2/Control.visible = true
		else:
			$Node2D2/Control.visible = false
	if($Node2D3.player_nearby and Input.is_action_just_pressed("interact") and Global.player_now == 2):
		paper_read[2] = !paper_read[2]
		if(paper_read[2]):
			$Node2D3/Control.visible = true
		else:
			$Node2D3/Control.visible = false
	if($Node2D4.player_nearby and Input.is_action_just_pressed("interact") and Global.player_now == 2):
		paper_read[3] = !paper_read[3]
		if(paper_read[3]):
			$Node2D4/Control.visible = true
		else:
			$Node2D4/Control.visible = false
	if($Node2D5.player_nearby and Input.is_action_just_pressed("interact") and Global.player_now == 2):
		paper_read[4] = !paper_read[4]
		if(paper_read[4]):
			$Node2D5/Control.visible = true
		else:
			$Node2D5/Control.visible = false
	if not false in floor_passed:
		Global.opened_doors[0] = true
		Global.opened_doors[1] = true
	if Global.opened_doors[0]:
		$TileMap.set_layer_enabled(1,true)
		$trapdoor_p1.visible = true
	if Global.opened_doors[1]:
		$TileMap.set_layer_enabled(2,true)
		$trapdoor_p2.visible = true
	if Global.leave[0] == 1:
		Global.player_now = 2
		$P1/Camera2D.enabled = false
		$P1.queue_free()
		Global.leave[0] = 2
	if Global.leave[1] == 1:
		Global.player_now = 1
		$P2/Camera2D.enabled = false
		$P2.queue_free()
		Global.leave[1] = 2
	if Global.leave[0] == 2 and Global.leave[1] == 2:
		get_tree().change_scene_to_file("res://Scenes/end.tscn")

func _on_area_2d_body_entered(_body):
	if not true in floor_passed and !lost:
		$TileMap.set_layer_enabled(3,false)
		$TileMap.set_layer_enabled(4,true)
		floor_passed[0] = true

func _on_area_2d_2_body_entered(_body):
	if !floor_passed[1] and !lost:
		if floor_passed[0] and not true in floor_passed.slice(2):
			$TileMap.set_layer_enabled(6,false)
			$TileMap.set_layer_enabled(7,true)
			floor_passed[1] = true
		else:
			$TileMap.set_layer_enabled(6,false)
			$TileMap.set_layer_enabled(8,true)
			reset()

func _on_area_2d_3_body_entered(_body):
	if !floor_passed[12] and !lost:
			if not false in floor_passed.slice(0,9) and not true in floor_passed.slice(15):
				$TileMap.set_layer_enabled(9,false)
				$TileMap.set_layer_enabled(10,true)
				floor_passed[12] = true
			else:
				$TileMap.set_layer_enabled(9,false)
				$TileMap.set_layer_enabled(11,true)
				reset()

func _on_area_2d_4_body_entered(_body):
	if !floor_passed[18] and !lost:
			if not false in floor_passed.slice(0,18) and not true in floor_passed.slice(19):
				$TileMap.set_layer_enabled(12,false)
				$TileMap.set_layer_enabled(13,true)
				floor_passed[18] = true
			else:
				$TileMap.set_layer_enabled(12,false)
				$TileMap.set_layer_enabled(14,true)
				reset()

func _on_area_2d_5_body_entered(_body):
	if !floor_passed[16] and !lost:
			if not false in floor_passed.slice(0,16) and not true in floor_passed.slice(17):
				$TileMap.set_layer_enabled(15,false)
				$TileMap.set_layer_enabled(16,true)
				floor_passed[16] = true
			else:
				$TileMap.set_layer_enabled(15,false)
				$TileMap.set_layer_enabled(17,true)
				reset()

func _on_area_2d_6_body_entered(_body):
	if !floor_passed[13] and !lost:
			if not false in floor_passed.slice(0,9) and not true in floor_passed.slice(15):
				$TileMap.set_layer_enabled(18,false)
				$TileMap.set_layer_enabled(19,true)
				floor_passed[13] = true
			else:
				$TileMap.set_layer_enabled(18,false)
				$TileMap.set_layer_enabled(20,true)
				reset()

func _on_area_2d_7_body_entered(_body):
	if !floor_passed[2] and !lost:
		if not false in floor_passed.slice(0,2) and not true in floor_passed.slice(3):
			$TileMap.set_layer_enabled(21,false)
			$TileMap.set_layer_enabled(22,true)
			floor_passed[2] = true
		else:
			$TileMap.set_layer_enabled(21,false)
			$TileMap.set_layer_enabled(23,true)
			reset()

func _on_area_2d_8_body_entered(_body):
	if !floor_passed[11] and !lost:
			if not false in floor_passed.slice(0,9) and not true in floor_passed.slice(15):
				$TileMap.set_layer_enabled(24,false)
				$TileMap.set_layer_enabled(25,true)
				floor_passed[11] = true
			else:
				$TileMap.set_layer_enabled(24,false)
				$TileMap.set_layer_enabled(26,true)
				reset()

func _on_area_2d_9_body_entered(_body):
	if !floor_passed[17] and !lost:
			if not false in floor_passed.slice(0,17) and not true in floor_passed.slice(18):
				$TileMap.set_layer_enabled(27,false)
				$TileMap.set_layer_enabled(28,true)
				floor_passed[17] = true
			else:
				$TileMap.set_layer_enabled(27,false)
				$TileMap.set_layer_enabled(29,true)
				reset()

func _on_area_2d_10_body_entered(_body):
	if !floor_passed[14] and !lost:
			if not false in floor_passed.slice(0,9) and not true in floor_passed.slice(15):
				$TileMap.set_layer_enabled(42,false)
				$TileMap.set_layer_enabled(43,true)
				floor_passed[14] = true
			else:
				$TileMap.set_layer_enabled(42,false)
				$TileMap.set_layer_enabled(44,true)
				reset()

func _on_area_2d_11_body_entered(_body):
	if !floor_passed[10] and !lost:
			if not false in floor_passed.slice(0,9) and not true in floor_passed.slice(15):
				$TileMap.set_layer_enabled(39,false)
				$TileMap.set_layer_enabled(40,true)
				floor_passed[10] = true
			else:
				$TileMap.set_layer_enabled(39,false)
				$TileMap.set_layer_enabled(41,true)
				reset()

func _on_area_2d_12_body_entered(_body):
	if !floor_passed[3] and !lost:
		if not false in floor_passed.slice(0,3) and not true in floor_passed.slice(4):
			$TileMap.set_layer_enabled(36,false)
			$TileMap.set_layer_enabled(37,true)
			floor_passed[3] = true
		else:
			$TileMap.set_layer_enabled(36,false)
			$TileMap.set_layer_enabled(38,true)
			reset()

func _on_area_2d_13_body_entered(_body):
	if !floor_passed[4] and !lost:
		if not false in floor_passed.slice(0,4) and not true in floor_passed.slice(5):
			$TileMap.set_layer_enabled(33,false)
			$TileMap.set_layer_enabled(34,true)
			floor_passed[4] = true
		else:
			$TileMap.set_layer_enabled(33,false)
			$TileMap.set_layer_enabled(35,true)
			reset()

func _on_area_2d_14_body_entered(_body):
	if !floor_passed[5] and !lost:
		if not false in floor_passed.slice(0,5) and not true in floor_passed.slice(6):
			$TileMap.set_layer_enabled(30,false)
			$TileMap.set_layer_enabled(31,true)
			floor_passed[5] = true
		else:
			$TileMap.set_layer_enabled(30,false)
			$TileMap.set_layer_enabled(32,true)
			reset()

func _on_area_2d_15_body_entered(_body):
	if !floor_passed[15] and !lost:
		if not false in floor_passed.slice(0,15) and not true in floor_passed.slice(16):
			$TileMap.set_layer_enabled(45,false)
			$TileMap.set_layer_enabled(46,true)
			floor_passed[15] = true
		else:
			$TileMap.set_layer_enabled(45,false)
			$TileMap.set_layer_enabled(47,true)
			reset()

func _on_area_2d_16_body_entered(_body):
	if !floor_passed[6] and !lost:
		if not false in floor_passed.slice(0,5) and not true in floor_passed.slice(6):
			$TileMap.set_layer_enabled(48,false)
			$TileMap.set_layer_enabled(49,true)
			floor_passed[6] = true
		else:
			$TileMap.set_layer_enabled(48,false)
			$TileMap.set_layer_enabled(50,true)
			reset()

func _on_area_2d_17_body_entered(_body):
		if !floor_passed[7] and !lost:
			if not false in floor_passed.slice(0,7) and not true in floor_passed.slice(8):
				$TileMap.set_layer_enabled(51,false)
				$TileMap.set_layer_enabled(52,true)
				floor_passed[7] = true
			else:
				$TileMap.set_layer_enabled(51,false)
				$TileMap.set_layer_enabled(53,true)
				reset()

func _on_area_2d_18_body_entered(_body):
		if !floor_passed[8] and !lost:
			if not false in floor_passed.slice(0,8) and not true in floor_passed.slice(9):
				$TileMap.set_layer_enabled(54,false)
				$TileMap.set_layer_enabled(55,true)
				floor_passed[8] = true
			else:
				$TileMap.set_layer_enabled(54,false)
				$TileMap.set_layer_enabled(56,true)
				reset()

func _on_area_2d_19_body_entered(_body):
	if !floor_passed[9] and !lost:
			if not false in floor_passed.slice(0,9) and not true in floor_passed.slice(15):
				$TileMap.set_layer_enabled(57,false)
				$TileMap.set_layer_enabled(58,true)
				floor_passed[9] = true
			else:
				$TileMap.set_layer_enabled(57,false)
				$TileMap.set_layer_enabled(59,true)
				reset()

func reset():
	lost = true
	$Timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
