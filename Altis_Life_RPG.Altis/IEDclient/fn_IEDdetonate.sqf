/*
	File: fn_IEDdetonate.sqf
	Author: soh
	
	Description:
	boom
*/
private["_iedPosition", "_explosiveSequence","_explosive","_xcoord","_ycoord","_bomb"];
	
_iedPosition = getpos (_this select 0); // device position
_explosiveSequence = ["M_PG_AT","M_Zephyr","M_Titan_AA_long","M_PG_AT"];

[[_iedPosition] , "IED_SMOKE", true, false] spawn BIS_fnc_MP;	
[[_iedPosition] , "IED_SCREEN_EFFECTS", true, false] spawn BIS_fnc_MP;
for "_i" from 0 to (count _explosiveSequence) -1 do{
	[[_iedPosition] , "IED_ROCKS", true, false] spawn BIS_fnc_MP;
	_explosive = (_explosiveSequence select _i);
	_xCoord = (random 4)-2;
	_yCoord = (random 4)-2;
	_bomb = _explosive createVehicle _iedPosition;
	_bomb setPos [(_iedPosition select 0)+_xCoord,(_iedPosition select 1)+_yCoord, 0];

	sleep .01;
};