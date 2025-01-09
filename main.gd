extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_select_button_pressed():
	%FileDialog.popup_centered()

func _on_file_dialog_file_selected(path):
	# Load an existing glTF scene.
	var gltf_document_load = GLTFDocument.new()
	var gltf_state_load = GLTFState.new()
	var error = gltf_document_load.append_from_file(path, gltf_state_load)
	if error == OK:
		var gltf_scene_root_node = gltf_document_load.generate_scene(gltf_state_load)
		add_child(gltf_scene_root_node)
		
		gltf_scene_root_node.get_node("AnimationPlayer").play("EmptyAction")
	else:
		%ErrorLabel.text = "Couldn't load glTF scene (error code: %s)." % error_string(error)
	
