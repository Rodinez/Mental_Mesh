extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match Global.chances:
		7:
			$AnimatedSprite2D.play("7")
		6:
			$AnimatedSprite2D.play("6")
		5:
			$AnimatedSprite2D.play("5")
		4:
			$AnimatedSprite2D.play("4")
		3:
			$AnimatedSprite2D.play("3")
		2:
			$AnimatedSprite2D.play("2")
		1:
			$AnimatedSprite2D.play("1")
		0:
			$AnimatedSprite2D.play("0")
