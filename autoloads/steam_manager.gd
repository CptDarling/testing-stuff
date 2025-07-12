#class_name SteamManager
extends Node

var app_id: int = 480
var steam_info: Dictionary = {}

func _init() -> void:
	OS.set_environment("SteamAppId", str(app_id))
	OS.set_environment("SteamGameId", str(app_id))


func _ready() -> void:
	# Initialise Steam
	var initialize_response: Dictionary = Steam.steamInitEx(app_id,true)

	if initialize_response['status'] > Steam.STEAM_API_INIT_RESULT_OK:
		print("Failed to initialize Steam: %s" % initialize_response)
		Global.quit_safely()

	# Check if Steam is connected
	if Steam.loggedOn():
		print("✅ Steam is connected!")
	else:
		print("❌ Steam is not connected.")

	_get_steam_info()

	if not steam_info['is_owned']:
		print("User does not own this game")
		#Global.quit_safely()


func _get_steam_info() -> void:
	steam_info = {
		"app_installed_depots": Steam.getInstalledDepots(app_id),
		"app_languages": Steam.getAvailableGameLanguages(),
		"app_owner": Steam.getAppOwner(),
		"build_id": Steam.getAppBuildId(),
		"game_language": Steam.getCurrentGameLanguage(),
		"install_dir": Steam.getAppInstallDir(app_id),
		"is_on_steam_deck": Steam.isSteamRunningOnSteamDeck(),
		"is_on_vr": Steam.isSteamRunningInVR(),
		"is_online": Steam.loggedOn(),
		"is_owned": Steam.isSubscribed(),
		"launch_command_line": Steam.getLaunchCommandLine(),
		"steam_id": Steam.getSteamID(),
		"steam_username": Steam.getPersonaName(),
		"ui_language": Steam.getSteamUILanguage()
	}

	print("🎮 Steam Info Dump:")
	for key: String in steam_info.keys():
		print("%s: %s" % [key, steam_info[key]])


func loggedOn() -> bool:
	return Steam.loggedOn()


func getUserName() -> String:
	return steam_info['steam_username']
