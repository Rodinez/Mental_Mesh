extends RigidBody2D 

@export var speed = 400 
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.can_move and Global.player_now == 2:
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
		if Input.is_action_just_released("change") and Global.recent_change == 1:
			Global.recent_change = 0
		elif Input.is_action_just_released("change"):
			$Camera2D.enabled = false
			Global.recent_change = 1
			Global.player_now += 1
			if Global.player_now > Global.max_players:
				Global.player_now = 1
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
