extends CanvasLayer

var current_submenu : Control = null

func _ready() -> void:
	$MainHUD/Orders/BuildButton.pressed.connect(_on_build_pressed)
	$MainHUD/Orders/WorkButton.pressed.connect(_on_work_pressed)
	
	
func _on_build_pressed():
	_toggle_submenu(preload("res://Scenes/UI/build_submenu.tscn"), $MainHUD/Orders/BuildButton)
	
	
func _on_work_pressed():
	_toggle_submenu(preload("res://Scenes/UI/work_submenu.tscn"), $MainHUD/Orders/WorkButton)


func _toggle_submenu(scene: PackedScene, button: Button):
	# Close current submenu if open
	if current_submenu:
		current_submenu.queue_free()
		current_submenu = null

	# Open new one
	current_submenu = scene.instantiate()
	$MainHUD.add_child(current_submenu)
	
	await get_tree().process_frame
	
	var global_pos = button.get_global_position() - Vector2(0, current_submenu.size.y)
	current_submenu.set_global_position(global_pos)
