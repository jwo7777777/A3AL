#include <macro.h>

/*
	File: fn_adminTPtoME.sqf
	Author: soh based on BLuePhoenix's admin tools for DayzEpoch
	
	Description:
	Drags a player to the admin from anywhere.
*/
private["_unit","_adminloc","_plyrloc""_emptyflag"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if (_unit == player) exitWith { hint "Teleporting to self would create a scripting black hole ... no thanks!"; };

if ( life_teleport_admin_lvl > __GETC__(life_adminlevel_589937) ) then 
	{ hint "Insufficient Admin Level plyr->ME";}
else
{

_adminloc = getpos player;
_plyrloc = getpos _unit;

hint format ["Teleporting %1", name _unit];

if (vehicle _unit != _unit) then { //in a vehicle

	_unit = vehicle _unit; // _unit now refers to the vehicle
	_emptyflag = [_adminloc select 0, _adminloc select 1, 0] findEmptyPosition [5, 50, _unit]; //find a safe spot
	if (_emptyflag != []) then { _adminloc = _emptyflag;};  // if no safe spot, put it ON admin
};
	
_unit setvelocity [0,0,0]; // stop movement
_unit setpos [ _adminloc select 0, _adminloc select 1, 0]; // set altitude at 0

};
