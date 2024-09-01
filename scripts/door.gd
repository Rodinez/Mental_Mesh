extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.opened_doors[1]:
		$AnimatedSprite2D.play("aberta")
		$CollisionShape2D.disabled = true
		if Global.player_position.x > self.global_position.x or Global.player_position.y > self.global_position.y - 9.8:
			self.top_level = true
		else:
			self.top_level = false
	else:
		Global.sound_fase1[1] = false
		$AnimatedSprite2D.play("default")
		$CollisionShape2D.disabled = false
