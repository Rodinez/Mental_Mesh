extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player_now = 1
	Global.leave = [0, 0]
	Global.opened_doors = [false, false]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
