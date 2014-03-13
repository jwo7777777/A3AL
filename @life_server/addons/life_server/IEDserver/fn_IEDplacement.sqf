/*
	File: fn_IEDplacement.sqf
	Author: soh
	
	Description:
	server creates vehicle and triggers that is IED at location
	
	INPUTS: [ location ]
	
	OUTPUTS: none
*/
private["_loc","_IEDvehicle","_outer","_disarm","_boom"];
_loc = _this select 0; // passed through message event handler
_outer = createTrigger["EmptyDetector", _loc];  // 20m detection with minedetector
_disarm = createTrigger["EmptyDetector", _loc]; // 5m disarm radius
_boom = createTrigger["EmptyDetector", _loc];  // boom if in vehicle when triggered
_IEDvehicle = "Land_BarrelTrash_F" createVehicle _loc;  // IED "vehicle"

IEDnew = [ _IEDvehicle, _outer, _disarm, _boom ];
IEDlist set [count IEDlist, IEDnew];
[IEDnew,"IED_fnc_IEDtriggers",west] spawn BIS_fnc_MP;
