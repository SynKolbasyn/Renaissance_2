extends CanvasLayer


func set_max_health(val: int):
	$PlayersHealth.max_value = val


func update_health(val: int):
	$PlayersHealth.value = val
