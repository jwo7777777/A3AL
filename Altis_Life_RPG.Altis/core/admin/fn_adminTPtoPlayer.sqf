/*
	File: fn_adminTPtoPlayer.sqf
	Author: soh based on BLuePhoenix's admin tools for DayzEpoch
	
	Description:
	Teleports the admin to a player.
*/
private["_ret","_unit","_loc"];
_ret = _this;
_unit = _ret select 3;

if (_unit == player) exitWith { hint "You are already here."; };

_loc = getpos _unit;

hint format "WHOOSH!!!";

if ((vehicle player isKindOf "Air")) then{

	(vehicle player) setpos [_loc select 0, _loc select 1, 100];
	player setVariable["lastPos",0, true];
} else {
    
    (vehicle player) setpos [_loc select 0, _loc select 1, 0];
};