/*
	File: fn_adminTPtoME.sqf
	Author: soh based on BLuePhoenix's admin tools for DayzEpoch
	
	Description:
	Drags a player to the admin from anywhere.
*/
private["_unit","_loc"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if (_unit == player) exitWith { hint "Teleporting to self would create a scripting black hole ... no thanks!"; };

if ( life_teleport_admin_lvl > life_adminlevel_589937 ) exitWith { hint "Insufficient Admin Level plyr->ME";};

_loc = getpos player;

hint format ["Teleporting %1", name _unit];
_unit setpos [ _loc select 0, _loc select 1, 0];

closeDialog 0;
sleep 0.25;
closeDialog 0;