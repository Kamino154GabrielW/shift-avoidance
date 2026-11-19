extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	testEsc()
	
func resume():
	get_tree().paused=false
	self.visible=false
func pause():
	get_tree().paused=true
	self.visible=true
func testEsc():
	if Input.is_action_just_pressed("Game_Pause") and get_tree().paused==false:
		pause()
	elif Input.is_action_just_pressed("Game_Pause") and get_tree().paused==true:
		resume()
	
		
	#


func _on_play_button_pressed() -> void:
	resume()


func _on_play_button_3_pressed() -> void:
	get_tree().quit()


func _on_play_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scripts/main_menu/nodes/Main_menu.tscn")
