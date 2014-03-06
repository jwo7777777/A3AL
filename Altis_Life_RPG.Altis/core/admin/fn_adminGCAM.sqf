#include <macro.h>

/*
	File: fn_adminTPtoME.sqf
	Author: soh based on BLuePhoenix's admin tools for DayzEpoch
	
	Description:
	Drags a player to the admin from anywhere.
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") then { _unit = player;};
if(isNull _unit) then { _unit = player;};

if ( life_teleport_admin_lvl > __GETC__(life_adminlevel_589937) ) then 
	{ hint "Insufficient Admin Level GCAM";}
else
{

	[_unit] execVM "dialog\gcam\gcam.sqf";

};