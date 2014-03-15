/*
	File: fn_IEDdetonate.sqf
	Author: Written by Brian Sweeney - [EPD] Brian
		heavily modified by soh
	Description:
	setoff a rapid series of effects and explosions to mimic an IED
	
	INPUTS: Object of any sort that has the position for the IED
	
	OUTPUTS: none
*/
private["_iedPosition", "_explosiveSequence","_explosive","_xcoord","_ycoord","_bomb"];

diag_log "IED detonation";	

_iedPosition = getpos _this; // device position
diag_log _iedPosition;
_explosiveSequence = ["M_PG_AT","M_Zephyr","M_Titan_AA_long","M_PG_AT"];

[ _iedPosition , "IED_fnc_IedSmoke", true, false] spawn BIS_fnc_MP;	// create smoke around the explosion
[ _iedPosition , "IED_fnc_IedPlayerEffects", true, false] spawn BIS_fnc_MP; // camera shake, deafness, blur

{  
	[ _iedPosition , "IED_fnc_IedRocks", true, false] spawn BIS_fnc_MP; // send rocks flying with each detonation
	_explosive = (_explosiveSequence select _foreachindex);  
	_xCoord = (random 4)-2; // randomize the exact position by +/- 2 meters
	_yCoord = (random 4)-2;
	_bomb = _explosive createVehicle _iedPosition; // creating an ammo vehicle is like impacting it
	_bomb setPos [(_iedPosition select 0)+_xCoord,(_iedPosition select 1)+_yCoord, 0]; // get placement exact

	sleep .01;
} foreach _explosiveSequence;