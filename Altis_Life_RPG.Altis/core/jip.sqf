/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	JIP functionality for JIP required things like vehicles.
*/
private["_list"];
{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");

_list = IEDlist;
{
	[_x] spawn IED_fnc_IEDtriggers;
} foreach IEDlist;