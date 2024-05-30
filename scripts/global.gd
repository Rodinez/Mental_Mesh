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
