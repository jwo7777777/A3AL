/*
	File: fn_IEDplacement.sqf
	Author: soh
	
	Description:
	server creates vehicle and triggers that is IED at location
	
	INPUTS: [ location ]
	
	OUTPUTS: none
	
	The server creates the vehicles (generic term for non-openable container) which will be the mine and the "camoflage" garbage.
	
	Server creates trigger, but trigger "settings" are local to each player,
	so trigger characteristics must be set at each player's computer.
	
	How can we tell when the explosive has been deactivated or detonated?  The mine "vehicle" will become null when either of these
	happens.  In the case of deactivation, the game removes the existing mine vehicle and places another one laying on its side
	ready to be grabbed by a player.  The deactivated mine can be planted again, but this will not produce an IED of this type, only
	a simple mine.
	
	Without the garbage covering the mine, a civilian could conceivably trigger it in a heavy vehicle.
*/
private["_loc","_IEDvehicle", "_device", "_outer","_boom"];
_loc = _this select 0; // passed through message event handler
_boom = createTrigger["EmptyDetector", _loc];  // boom if in vehicle when triggered
_IEDvehicle = "Land_BarrelTrash_F" createVehicle _loc;  // IED "vehicle"
_device = "ATMine" createMine _loc; // Explosive for mine detector and disarming

IEDnew = [ _IEDvehicle, _device, _boom ];
IEDlist set [count IEDlist, IEDnew];
[IEDnew,"IED_fnc_IEDtriggers",west] spawn BIS_fnc_MP;

