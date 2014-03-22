/*
	File: fn_IEDdetonate.sqf
	Author: Written by Brian Sweeney - [EPD] Brian
		heavily modified by soh
	Description:
	setoff a rapid series of effects and explosions to mimic an IED
	
	INPUTS: Object of any sort that has the position for the IED
	
	OUTPUTS: none
*/
private["_iedPosition", "_explosiveSequence","_explosive","_xcoord","_ycoord","_bomb","_ied","_vehicle","_boom","_disarm","_iednum","_trigger"];

diag_log "IED detonation";
_trigger = [[_this],0,objNull,[objNull]] call BIS_fnc_param;
_iednum = _trigger getVariable ["index",-1];

waitUntil {!lock_IEDlist}; // make sure something else is not modifying IEDlist
lock_IEDlist = true;  // reserve IEDlist for change
publicVariable "lock_IEDlist";

{ if ((_x select 0) == _iednum) then {
	_vehicle = 	[_x, 1, objNull, [objNull]] call BIS_fnc_param;
	_ied = [_x, 2, objNull, [objNull]] call BIS_fnc_param;
	_boom = [_x, 3, objNull, [objNull]] call BIS_fnc_param;
	_disarm = [_x, 4, objNull, [objNull]] call BIS_fnc_param; };
} foreach IEDlist;

lock_IEDlist = false;  // reserve IEDlist for change
publicVariable "lock_IEDlist";

diag_log format ["Detonation Array: %1",[_iednum, _vehicle, _ied, _boom, _disarm]];

if ((_iednum == -1) or (isNull _vehicle) or (isNull _ied) or (isNull _boom) or (isNull _disarm))
	exitWith { diag_log "Detonation was passed an invalid device.";};
	
_iedPosition = getpos _ied; // device position
diag_log format ["IED pos: %1", _iedPosition];

deletevehicle _vehicle; deletevehicle _ied; deletevehicle _boom; deletevehicle _disarm;

IEDdeleteHandle = _iednum;
publicVariableServer "IEDdeleteHandle";

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