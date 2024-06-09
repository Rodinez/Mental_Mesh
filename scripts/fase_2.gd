extends Node2D

var current_doors = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player_now = 1
	Global.leave = [0, 0]
	Global.opened_doors = [false, false]
	for i in range(0, 4):
		Global.areas_passed[i] = false
	Global.password = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if current_doors != Global.password:
		Global.chances = Global.chances - 1
		current_doors = Global.password
	if Global.chances <= 0:
		get_tree().change_scene_to_file("res://Scenes/fase_2.tscn")
	match Global.password:
		1:
			$lever2/AnimatedSprite2D.play("default")
			$lever3/AnimatedSprite2D.play("default")
			$lever4/AnimatedSprite2D.play("default")
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
			$lever/AnimatedSprite2D.play("default")
			$lever3/AnimatedSprite2D.play("default")
			$lever4/AnimatedSprite2D.play("default")
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
			$lever/AnimatedSprite2D.play("default")
			$lever2/AnimatedSprite2D.play("default")
			$lever4/AnimatedSprite2D.play("default")
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
			$lever/AnimatedSprite2D.play("default")
			$lever2/AnimatedSprite2D.play("default")
			$lever3/AnimatedSprite2D.play("default")
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
		get_tree().change_scene_to_file("res://Scenes/end.tscn")

func _on_area_2d_2_body_entered(body):
	if "player" in body.get_groups():
		Global.areas_passed[0] = true

func _on_area_2d_3_body_entered(body):
	if "player" in body.get_groups():
		Global.areas_passed[1] = true

func _on_area_2d_4_body_entered(body):
	if "player" in body.get_groups():
		Global.areas_passed[2] = true

func _on_area_2d_body_entered(body):
	if "player" in body.get_groups():
		Global.areas_passed[3] = true

func _on_area_2d_5_body_entered(body):
	if "player" in body.get_groups() and not false in Global.areas_passed:
		Global.opened_doors[0] = true
		Global.opened_doors[1] = true
