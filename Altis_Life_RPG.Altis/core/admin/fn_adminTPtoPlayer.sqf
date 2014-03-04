#include <macro.h>

/*
	File: fn_adminTPtoPlayer.sqf
	Author: soh based on BLuePhoenix's admin tools for DayzEpoch
	
	Description:
	Teleports the admin to a player.
*/
private["_unit","_adminloc","_plyrloc","_altitude"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
_altitude = 0;

if (_unit == player) exitWith { hint "You are already here."; };
if ( life_teleport_admin_lvl > __GETC__(life_adminlevel_589937) ) then
	{ hint "Insufficient Admin Level ME->plyr";}
else
{

_adminloc = getpos player;
_plyrloc = getpos _unit;

hint "WHOOSH!!!";

_unit = player;

if (vehicle _unit != _unit) then { //in a vehicle

	_unit = vehicle _unit; // _unit now refers to the vehicle
	_emptyflag = [_plyrloc select 0, _plyrloc select 1, 0] findEmptyPosition [5, 50, _unit]; //find a safe spot
	if (_emptyflag != []) then { _plyrloc = _emptyflag;};  // if no safe spot, put it ON TOP of target
};

_unit setvelocity [0,0,0];
_unit setpos [_plyrloc select 0, _plyrloc select 1, 0];

};
