extends RigidBody2D

@export var speed = 400 
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.enabled = true
	Global.player_position = self.global_position
	var velocity = Vector2()
	if Input.is_action_pressed("move_right") and Global.player_now == 1:
		velocity.x += 1
		$AnimatedSprite2D.play("direita")
	if Input.is_action_pressed("move_left") and Global.player_now == 1:
		velocity.x -= 1   
		$AnimatedSprite2D.play("esquerda")
	if Input.is_action_pressed("move_down") and Global.player_now == 1:
		velocity.y += 1  
		$AnimatedSprite2D.play("frente")
	if Input.is_action_pressed("move_up") and Global.player_now == 1:
		velocity.y -= 1
		$AnimatedSprite2D.play("costa")
	if Input.is_action_just_released("change") and Global.player_now == 1:
		$Camera2D.enabled = false
		Global.recent_change = 1
		Global.player_now += 1
	move_and_collide(velocity.normalized() * speed * delta)
