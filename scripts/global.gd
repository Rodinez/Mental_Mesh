extends Node
@onready var player_position
var recent_change = 0 
var player_now = 1
var max_players = 2
var tween = 0
var can_move = true
var password
var player_paper
var player_door
var leave = [0, 0]
var opened_doors = [false, false]
var areas_passed = [false, false, false, false]
var chances = 7
var player_nearby = [false, false, false, false]
var fase = 1
# 3 2 3 1 2 4 1
# 2 4 2 1 3 2 3
