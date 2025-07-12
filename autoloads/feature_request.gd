#class_name FeatureRequest
extends Node

func screenshots() -> bool:
	return SteamManager.loggedOn()
