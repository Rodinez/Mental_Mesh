extends Node2D

func _ready():
	Global.player_paper = 2
	Global.player_door = 1
	Global.leave = [0, 0]
	Global.fase = 1
	Global.sound_fase1 = [false, false, false, true, false]

func _process(_delta):
	if Global.sound_fase1[2] and Global.sound_fase1[3]:
		$paper_sound.play()
		Global.sound_fase1[2] = false
		Global.sound_fase1[3] = false
	if Global.sound_fase1[4]:
		$lever_sound.play()
		Global.sound_fase1[4] = false
	if Global.opened_doors[0]:
		$TileMap.set_layer_enabled(1,true)
		$trapdoor_p1.visible = true
		$lever.visible = true
		if not Global.sound_fase1[0]:
			$door_sound.play()
			Global.sound_fase1[0] = true
	if Global.opened_doors[1]:
		$TileMap.set_layer_enabled(2,true)
		$trapdoor_p2.visible = true
		if not Global.sound_fase1[1]:
			$door_sound.play()
			Global.sound_fase1[1] = true
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
		get_tree().change_scene_to_file("res://Scenes/fase_2.tscn")
