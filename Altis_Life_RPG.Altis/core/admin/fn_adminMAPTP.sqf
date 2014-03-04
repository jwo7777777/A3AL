/*
	File: fn_adminMAPTP.sqf
	Author: soh
	
	Description:
	Teleports the admin to the first clicked map location.
*/
private["_ported"];

if ( life_teleport_admin_lvl > __GETC__(life_adminlevel_589937) ) then { hint "Insufficient Admin Level MAPTP";}

else
{
hint "Left click on map.";
onMapSingleClick "(vehicle player) setPos _pos; _ported = true; true; onMapSingleClick """";";

if ( !visibleMap ) then { openMap true;};
_ported = false;

waitUntil { (_ported or !visibleMap) };
if ( !visibleMap ) then { hint "Canceled MAPTP";};
};
	
