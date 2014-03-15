/*
	File: fn_IEDtriggers.sqf
	Author: soh
	
	Description:
	based on side "WEST" or not west
	actual triggers already created on server
	this is each player setting appropriate messages and actions for their char.
	
	INPUTS:  [ object for camoflage, object from createmine, explosive triggering trigger ]
	
	OUTPUTS: none
	
*/
private["_IEDvehicle", "_device","_boom"];
_boom = _this select 2;  // trigger used to expand  and change detection mechanism of IED; boom if a west player in a vehicle
_device = _this select 1;  // small mine used for deactivation and minedetector triggering
_IEDvehicle = _this select 0; // garbage camoflaging the IED



if (side player == west) then  // only WEST interacts once planted
	{
		_boom setTriggerArea[10,10,0,false]; // simple radial trigger
		_boom setTriggerActivation["WEST", "PRESENT", false]; // west player must be within trigger area, non-persistent
		_boom setTriggerStatements["this and (vehicle player != player)",  // west player must be in car
			"thisTrigger spawn IED_fnc_IEDdetonate;",""];  
		diag_log "Detonation trigger set";
	};