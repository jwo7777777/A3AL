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
private["_IEDnum","_IEDvehicle","_device","_boom","_disarm","_exitflag"];
_exitflag = false;

_IEDnum = [_this,0,-1,[0]] call BIS_fnc_param;
_IEDvehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param; // garbage camoflaging the IED
_device = [_this,2,objNull,[objNull]] call BIS_fnc_param;  // small mine for minedetector triggering
_boom = [_this,3,objNull,[objNull]] call BIS_fnc_param;  // trigger used to trigger IED; if west player in a vehicle
_disarm = [_this,4,objNull,[objNull]] call BIS_fnc_param; // disarm radius, by trigger, stupid addaction no radius

if ((_IEDnum == -1) or (isNull _IEDvehicle) or (isNull _device) or (isNull _boom) or (isNull _disarm))
	exitwith {diag_log "Problem with IEDtriggers input"};

IEDarray = [_IEDnum, _IEDvehicle, _device, _boom, _disarm];

_boom setTriggerArea[10,10,0,false]; // simple radial trigger
_boom setTriggerActivation["WEST", "PRESENT", false]; // west player must be within trigger area, non-repeating
_boom setTriggerStatements["this and ((vehicle player) != player)",  // west player must be in car
	"IEDarray spawn IED_fnc_IEDdetonate",""];  
diag_log "Detonation trigger set";

_disarm setTriggerArea[5,5,0,false]; // simple radial trigger
_disarm setTriggerActivation["WEST", "PRESENT", true]; // repeatable trigger
_disarm setTriggerStatements["this",
	"DisarmIDX = player addAction ['Disable IED', IED_fnc_IEDdisarm, IEDarray,6,true,true,'','true'];",
	"player removeAction DisarmIDX;"];
diag_log "Disarm trigger set";
// adds the action for disarming at 2m
