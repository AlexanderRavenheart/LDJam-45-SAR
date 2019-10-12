extends Node

class_name Constants

enum Weapons {
	BurstLaser,
	LaserBeam,
	DumbMissiles,
	HomingMissiles,
	Mines,
	FlakCannon,
	OffenseDrone
}

static func get_weapon_scene(weapon_class_index):
	var WeaponClassMapping = {
		#0: BurstLaser,
		#1: get_class(LaserBeam),
		#2: DumbMissiles,
		#3: HomingMissiles,
		#4: Mines,
		5: "res://Systems/Offense/FlakCannon/FlakCannon.tscn",
		#6: OffenseDrone
	}
	return WeaponClassMapping[weapon_class_index]

enum DamageType {
	Shields,
	Hull,
	ShieldsAndHull
}