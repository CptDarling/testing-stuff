class_name Main
extends Control

func _ready() -> void:
	if FeatureRequest.screenshots():
		print_debug("Screenshoting is a feature supported by this application")

	if Steam.loggedOn():
		print("Steam is logged on: %s" % SteamManager.getUserName())
