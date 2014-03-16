/*
	File: fn_IEDmonitor.sqf
	Author: soh
	
	Description:
	server monitors each active IED
	
	USAGE:  [] execVM <filename>
	
	INPUTS: none (uses global variable "IEDlist"
	
	OUTPUTS: none
	
	The server creates the vehicles (generic term for non-openable container) which will be the mine and the "camoflage" garbage.
	
	Server creates trigger, but trigger "settings" are local to each player,
	so trigger characteristics must be set at each player's computer.
	
	
	There is a small corner case that an IED gets deleted while a JIP player is processing the list of active IEDs
	to create local player triggers.  The JIP routine should do pervasive and failsafe trigger setting.
*/
private ["_flag","_innerflag","_iednum"];

_iednum = [[_this],0,-1,[0]] call BIS_fnc_param;
if (_iednum == -1) exitWith { diag_log "Bad _iednum passed to monitor.";};

waitUntil {!lock_IEDlist}; // make sure something else is not modifying IEDlist
lock_IEDlist = true;  // reserve IEDlist for change
publicVariable "lock_IEDlist";

_flag = false; // flags whether there is any need to delete an array member
{	
	if (_iednum == (_x select 0)) exitWith {
		diag_log format["IED deleted: %1",_iednum];	
		IEDlist set [ _forEachIndex, -1];  // mark this entry for deletion
		IEDlist = IEDlist - [-1];
		publicVariable "IEDlist";
	};
	
} foreach IEDlist;
	
lock_IEDlist = false;
publicVariable "lock_IEDlist";
diag_log format["Active IEDs: %1",(count IEDlist)];




