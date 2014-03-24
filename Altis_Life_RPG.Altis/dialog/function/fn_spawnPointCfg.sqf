/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		[
			["cop_spawn_1","Police Headquarters","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_5","Border Outpost","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case civilian:
	{
		[
			["civ_spawn_1","Agios Dionysios","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Orepkastro","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Neochori","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Paros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};
};