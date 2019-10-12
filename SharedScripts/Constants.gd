extends Node

class_name Constants

enum Weapons {
	PulseLaser,
	LaserBeam,
	DumbMissiles,
	HomingMissiles,
	Mines,
	FlakCannon,
	VulcanCannon,
	OffenseDrone
}

static func get_weapon_scene(weapon_class_index):
	var WeaponClassMapping = {
		0: "res://Systems/Offense/PulseLaser/PulseLaser.tscn",
		1: "res://Systems/Offense/LaserBeam.tscn",
		2: "res://Systems/Offense/DumbMissiles/DumbMissileLauncher.tscn",
		3: "res://Systems/Offense/SmartMissiles/SmartMissileLauncher.tscn",
		#4: Mines,
		5: "res://Systems/Offense/FlakCannon/FlakCannon.tscn",
		6: "res://Systems/Offense/VulkanCannon/VulcanCannon.tscn"
		#7: OffenseDrone
	}
	return WeaponClassMapping[weapon_class_index]

enum DamageType {
	Shields,
	Hull,
	ShieldsAndHull
}