/*
	File: fn_adminTPtoME.sqf
	Author: soh based on BLuePhoenix's admin tools for DayzEpoch
	
	Description:
	Drags a player to the admin from anywhere.
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if (_unit == player) exitWith { hint "Teleporting to self would create a scripting black hole ... no thanks!"; };

hint format ["Teleporting %1", name _unit];
_unit attachTo [vehicle player, [2, 2, 0]];
sleep 0.25;
detach _unit;
closeDialog 0;
closeDialog 0;