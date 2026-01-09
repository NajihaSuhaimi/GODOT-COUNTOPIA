extends Node

# Diamond counters
var blue: int = 0
var green: int = 0
var red: int = 0
var yellow: int = 0
var purple: int = 0

# Player health
var player_health: int = 10

# Question progress
var question_complete: int = 0

# Reset everything (for Retry or Main Menu)
func reset():
	blue = 0
	green = 0
	red = 0
	yellow = 0
	purple = 0
	player_health = 10
	question_complete = 0
