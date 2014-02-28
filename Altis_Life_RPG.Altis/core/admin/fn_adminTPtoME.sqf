/*
	File: fn_adminTPtoME.sqf
	Author: soh based on BLuePhoenix's admin tools for DayzEpoch
	
	Description:
	Drags a player to the admin from anywhere.
*/
private["_display","_ret","_text","_unit","_prim","_sec","_vest","_uni","_bp","_attach","_tmp","_loc"];
_ret = _this;
_unit = _ret select 3;

if (_unit == player) exitWith { hint "Teleporting to self would create a scripting black hole ... no thanks!"; };

hint format ["Teleporting %1", name _unit];
_unit attachTo [vehicle player, [2, 2, 0]];
sleep 0.25;
detach _unit;