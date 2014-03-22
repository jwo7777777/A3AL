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
	
	A civilian could still drive over the actual mine and detonate it.
*/
private["_IEDnew","_loc","_IEDvehicle", "_device", "_outer","_boom","_disarm","_camotype"];

_loc = [[_this],0,[0,0,0],[],[3]] call BIS_fnc_param; // passed through message event handler
_camotype = IEDtypes call BIS_fnc_selectRandom; // pick a random item for the IED to hide inside
_IEDvehicle = _camotype createVehicle _loc;  // IED "vehicle"
_IEDvehicle setpos _loc; // get the location exact
_boom = createTrigger ["EmptyDetector", _loc];  // server has to create triggers ... it's the law
_boom setVariable ["index",IEDnum,true];
_disarm = createTrigger ["EmptyDetector", _loc];
_disarm setVariable ["index",IEDnum,true];
_device = createMine ["ATMine", _loc,[], 0]; // Explosive for mine detector and disarming
_IEDvehicle enableSimulationGlobal false;  // keep toilets from opening, etc...
_device enableSimulationGlobal false;  // mine is just for detection

_IEDnew = [ IEDnum, _IEDvehicle, _device, _boom, _disarm];  // convenient variable assignment to handle array
[_IEDnew,"IED_fnc_IEDtriggers",west] spawn BIS_fnc_MP; // tell west players assign local trigger settings.
IEDnum = IEDnum +1;
waituntil {!lock_IEDlist};
lock_IEDlist = true;
publicVariable "lock_IEDlist";
IEDlist set [(count IEDlist), _IEDnew];  // add the new vehicle-device-trigger collection to master array
publicVariable "IEDlist";  // broadcast the list so that any JIP players can synchronize with it.
lock_IEDlist = false;
publicVariable "lock_IEDlist";
diag_log format["Active IEDs: %1",(count IEDlist)];
