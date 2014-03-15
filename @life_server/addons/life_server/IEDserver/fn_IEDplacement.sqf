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
private["_IEDnew","_loc","_IEDvehicle", "_device", "_outer","_boom"];
_loc = _this select 0; // passed through message event handler
_IEDvehicle = "Land_BarrelTrash_F" createVehicle _loc;  // IED "vehicle"
_IEDvehicle setpos _loc; // get the location exact
_boom = createTrigger["EmptyDetector", _loc];  // server has to create triggers ... it's the law
_device = createMine ["ATMine", getpos _IEDvehicle,[], 0]; // Explosive for mine detector and disarming
_IEDvehicle enableSimulationGlobal false;

_IEDnew = [ _IEDvehicle, _device, _boom ];  // convenient variable assignment to handle items in the array
IEDlist set [(count IEDlist), _IEDnew];  // add the new vehicle-device-trigger collection to the master array
[_IEDnew,"IED_fnc_IEDtriggers",west] spawn BIS_fnc_MP; // tell all west players to assign local trigger settings.
publicVariable "IEDlist";  // broadcast the list so that any JIP players can synchronize with it.

