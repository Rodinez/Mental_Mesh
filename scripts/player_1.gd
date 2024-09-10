extends RigidBody2D

@export var speed = 400 
@onready var camera = $Camera2D
var blood = preload("res://Scenes/dead.tscn")
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.fase == 2:
		camera.zoom = Vector2(1.5,1.5)
	elif Global.fase == 4:
		camera.zoom = Vector2(2,2)
	else:
		camera.zoom = Vector2(3,3)
		
	if Global.dead[1]:
		$Camera2D.enabled = false
		Global.recent_change = 1
		Global.player_now += 1
		
	if Global.can_move and Global.player_now == 1:
		$Camera2D.enabled = true
		Global.player_position = self.global_position
		var velocity = Vector2()
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
			$AnimatedSprite2D.play("direita")
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1   
			$AnimatedSprite2D.play("esquerda")
		if Input.is_action_pressed("move_down"):
			velocity.y += 1  
			$AnimatedSprite2D.play("frente")
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1
			$AnimatedSprite2D.play("costa")
		if (Input.is_action_just_released("change") and Global.leave[1] <= 0) or Global.dead[1]:
			$Camera2D.enabled = false
			Global.recent_change = 1
			Global.player_now += 1
		move_and_collide(velocity.normalized() * speed * delta)
		if Global.tween == 1:
			var tween = create_tween()
			tween.tween_property($Camera2D, "global_position", $Camera2D.global_position + Vector2(5, 5), 0.02)
			tween.chain().tween_property($Camera2D, "global_position", $Camera2D.global_position - Vector2(10, 10), 0.02)
			tween.chain().tween_property($Camera2D, "global_position", $Camera2D.global_position + Vector2(10, 10), 0.02)
			tween.chain().tween_property($Camera2D, "global_position", $Camera2D.global_position - Vector2(10, 10), 0.02)
			tween.chain().tween_property($Camera2D, "global_position", $Camera2D.global_position + Vector2(10, 10), 0.02)
			tween.chain().tween_property($Camera2D, "global_position", $Camera2D.global_position - Vector2(10, 10), 0.02)
			tween.chain().tween_property($Camera2D, "global_position", $Camera2D.global_position + Vector2(10, 10), 0.02)
			tween.chain().tween_property($Camera2D, "global_position", $Camera2D.global_position - Vector2(5, 5), 0.02)
			tween.chain().tween_property($Camera2D, "global_position", $Camera2D.global_position, 0.02)
			Global.tween = 0
			
	if Global.fase == 4 and !Global.safe[0] and Global.player_now == 2:
		Global.player_position = self.global_position
		var velocity = Vector2()
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
			$AnimatedSprite2D.play("direita")
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1   
			$AnimatedSprite2D.play("esquerda")
		if Input.is_action_pressed("move_down"):
			velocity.y -= 1  
			$AnimatedSprite2D.play("costa")
		if Input.is_action_pressed("move_up"):
			velocity.y += 1
			$AnimatedSprite2D.play("frente")
		move_and_collide(velocity.normalized() * speed * delta)

func dead():
	$Camera2D.enabled = true
	$AnimatedSprite2D.visible = false
	$CollisionShape2D.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	Global.can_move = false

func _on_timer_timeout():
	get_tree().reload_current_scene()

func _on_area_2d_body_entered(body):
	if "saw" in body.name:
		for i in range(5):
			$sound.play()
		Global.dead[0] = true
		var blood_instance = blood.instantiate()
		blood_instance.global_position = global_position 
		get_parent().add_child(blood_instance)
		call_deferred("dead")
		$Timer.start()
