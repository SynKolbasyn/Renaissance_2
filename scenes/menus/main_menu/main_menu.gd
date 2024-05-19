extends Control


func _ready():
	$VBoxContainer/NewGameButton.grab_focus()


func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/world/world.tscn")


func _on_load_game_button_pressed():
	pass # Replace with function body.


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_exit_game_button_pressed():
	get_tree().quit()
