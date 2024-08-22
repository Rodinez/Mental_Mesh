extends Node2D

var current_doors = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player_now = 1
	Global.leave = [0, 0]
	Global.opened_doors = [false, false]
	Global.fase = 2
	for i in range(0, 4):
		Global.areas_passed[i] = false
		Global.player_nearby[i] = false
	Global.password = 0
	Global.chances = 7

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match Global.password:
		0:
			if Global.player_nearby[0]:
				$lever/AnimatedSprite2D.play("esq_int")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[1]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("esq_int")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[2]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("esq_int")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[3]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("esq_int")
			else:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
		1:
			if Global.player_nearby[0]:
				$lever/AnimatedSprite2D.play("dir_int")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[1]:
				$lever/AnimatedSprite2D.play("ativada")
				$lever2/AnimatedSprite2D.play("esq_int")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[2]:
				$lever/AnimatedSprite2D.play("ativada")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("esq_int")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[3]:
				$lever/AnimatedSprite2D.play("ativada")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("esq_int")
			else:
				$lever/AnimatedSprite2D.play("ativada")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
		2:
			if Global.player_nearby[0]:
				$lever/AnimatedSprite2D.play("esq_int")
				$lever2/AnimatedSprite2D.play("ativada")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[1]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("dir_int")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[2]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("ativada")
				$lever3/AnimatedSprite2D.play("esq_int")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[3]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("ativada")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("esq_int")
			else:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("ativada")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("default")
		3:
			if Global.player_nearby[0]:
				$lever/AnimatedSprite2D.play("esq_int")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("ativada")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[1]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("esq_int")
				$lever3/AnimatedSprite2D.play("ativada")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[2]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("dir_int")
				$lever4/AnimatedSprite2D.play("default")
			elif Global.player_nearby[3]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("ativada")
				$lever4/AnimatedSprite2D.play("esq_int")
			else:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("ativada")
				$lever4/AnimatedSprite2D.play("default")
		4:
			if Global.player_nearby[0]:
				$lever/AnimatedSprite2D.play("esq_int")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("ativada")
			elif Global.player_nearby[1]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("esq_int")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("ativada")
			elif Global.player_nearby[2]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("esq_int")
				$lever4/AnimatedSprite2D.play("ativada")
			elif Global.player_nearby[3]:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("dir_int")
			else:
				$lever/AnimatedSprite2D.play("default")
				$lever2/AnimatedSprite2D.play("default")
				$lever3/AnimatedSprite2D.play("default")
				$lever4/AnimatedSprite2D.play("ativada")
	
	if current_doors != Global.password:
		Global.chances = Global.chances - 1
		current_doors = Global.password
	if Global.chances < 0:
		get_tree().reload_current_scene()
	match Global.password:
		1:
			for i in range(1, 17):
				var door_path = "door" + str(i)
				var door = get_node_or_null(door_path)
				var sprite = null
				var collision_shape = null
				if door:
					sprite = door.get_node_or_null("AnimatedSprite2D")
					collision_shape = door.get_node_or_null("CollisionShape2D")
				if sprite and collision_shape:
					if i not in [1, 9, 10, 14]:
						sprite.play("default")
						collision_shape.disabled = false
					else:
						sprite.play("aberta")
						collision_shape.disabled = true
		2:
			for i in range(1, 17):
				var door_path = "door" + str(i)
				var door = get_node_or_null(door_path)
				var sprite = null
				var collision_shape = null
				if door:
					sprite = door.get_node_or_null("AnimatedSprite2D")
					collision_shape = door.get_node_or_null("CollisionShape2D")
				if sprite and collision_shape:
					if i not in [2, 5, 12, 13]:
						sprite.play("default")
						collision_shape.disabled = false
					else:
						sprite.play("aberta")
						collision_shape.disabled = true
		3:
			for i in range(1, 17):
				var door_path = "door" + str(i)
				var door = get_node_or_null(door_path)
				var sprite = null
				var collision_shape = null
				if door:
					sprite = door.get_node_or_null("AnimatedSprite2D")
					collision_shape = door.get_node_or_null("CollisionShape2D")
				if sprite and collision_shape:
					if i not in [3, 11, 15, 16]:
						sprite.play("default")
						collision_shape.disabled = false
					else:
						sprite.play("aberta")
						collision_shape.disabled = true
		4:
			for i in range(1, 17):
				var door_path = "door" + str(i)
				var door = get_node_or_null(door_path)
				var sprite = null
				var collision_shape = null
				if door:
					sprite = door.get_node_or_null("AnimatedSprite2D")
					collision_shape = door.get_node_or_null("CollisionShape2D")
				if sprite and collision_shape:
					if i not in [4, 6, 7, 8]:
						sprite.play("default")
						collision_shape.disabled = false
					else:
						sprite.play("aberta")
						collision_shape.disabled = true
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
		get_tree().change_scene_to_file("res://Scenes/fase_3.tscn")

func _on_area_2d_2_body_entered(body):
	if "player" in body.get_groups():
		Global.areas_passed[0] = true
		$TileMap.set_layer_enabled(4,false)
		$TileMap.set_layer_enabled(8,true)

func _on_area_2d_3_body_entered(body):
	if "player" in body.get_groups():
		Global.areas_passed[1] = true
		$TileMap.set_layer_enabled(5,false)
		$TileMap.set_layer_enabled(9,true)

func _on_area_2d_4_body_entered(body):
	if "player" in body.get_groups():
		Global.areas_passed[2] = true
		$TileMap.set_layer_enabled(6,false)
		$TileMap.set_layer_enabled(10,true)

func _on_area_2d_body_entered(body):
	if "player" in body.get_groups():
		Global.areas_passed[3] = true
		$TileMap.set_layer_enabled(3,false)
		$TileMap.set_layer_enabled(7,true)

func _on_area_2d_5_body_entered(body):
	if "player" in body.get_groups() and not false in Global.areas_passed:
		Global.opened_doors[0] = true
		Global.opened_doors[1] = true

func _on_timer_timeout():
	if Global.player_position.y < $door5.global_position.y:
		$door5.top_level = true
		$door5.show_behind_parent = false
		$door6.top_level = true
		$door6.show_behind_parent = false
		$door9.top_level = true
		$door9.show_behind_parent = false
		$door16.top_level = true
		$door16.show_behind_parent = false
	elif Global.player_position.y < $door6.global_position.y:
		$door5.top_level = false
		$door5.show_behind_parent = true
		$door6.top_level = true
		$door6.show_behind_parent = false
		$door9.top_level = true
		$door9.show_behind_parent = false
		$door16.top_level = true
		$door16.show_behind_parent = false
	elif Global.player_position.y < $door16.global_position.y:
		$door5.top_level = false
		$door5.show_behind_parent = true
		$door6.top_level = false
		$door6.show_behind_parent = true
		$door9.top_level = false
		$door9.show_behind_parent = true
		$door16.top_level = true
		$door16.show_behind_parent = false
	elif Global.player_position.y > $door16.global_position.y:
		$door5.top_level = false
		$door5.show_behind_parent = true
		$door6.top_level = false
		$door6.show_behind_parent = true
		$door9.top_level = false
		$door9.show_behind_parent = true
		$door16.top_level = false
		$door16.show_behind_parent = true
	$Timer.set_wait_time(0.1)
	$Timer.start()
