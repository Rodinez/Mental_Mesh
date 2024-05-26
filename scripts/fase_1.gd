extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player_paper = 2
	Global.player_door = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.opened_doors[0]:
		$TileMap.set_layer_enabled(1,true)
		$trapdoor_p1.visible = true
		$lever.visible = true
	if Global.opened_doors[1]:
		$TileMap.set_layer_enabled(2,true)
		$trapdoor_p2.visible = true
