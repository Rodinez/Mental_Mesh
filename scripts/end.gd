extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_restart_pressed():
	Global.player_now = 1
	Global.max_players = 2
	Global.tween = 0
	Global.can_move = true
	Global.leave = [0, 0]
	Global.opened_doors = [false, false]
	get_tree().change_scene_to_file("res://Scenes/fase_1.tscn")


func _on_quit_pressed():
	get_tree().quit()
