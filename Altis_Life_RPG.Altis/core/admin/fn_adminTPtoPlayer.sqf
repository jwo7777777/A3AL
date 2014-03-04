#include <macro.h>

/*
	File: fn_adminTPtoPlayer.sqf
	Author: soh based on BLuePhoenix's admin tools for DayzEpoch
	
	Description:
	Teleports the admin to a player.
*/
private["_unit","_loc","_altitude"];
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

	_loc = getpos _unit;
	hint "WHOOSH!!!";
	if ((vehicle player) isKindOf "Air") then { _altitude = 100;};
	(vehicle player) setpos [_loc select 0, _loc select 1, _altitude];

};