extends Spatial

func Finish():
	$"FinishTimer".start()
	pass

func _on_FinishTimer_timeout():
	get_tree().reload_current_scene()


func _on_Scorpion_on_dead():
	Finish()
