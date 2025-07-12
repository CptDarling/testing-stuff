@tool
extends EditorPlugin

func _enter_tree():
	add_tool_menu_item("Launch VSCode", _on_launch_vscode)


func _exit_tree():
	remove_tool_menu_item("Launch VSCode")


func _on_launch_vscode():
	var project_path = ProjectSettings.globalize_path("res://")
	OS.execute("cmd", ["/c", "start", "code", project_path],[],false,false)
