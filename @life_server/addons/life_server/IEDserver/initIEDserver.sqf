/*
	File: initIEDserver.sqf
	Author: soh
	
	Description:
	globals for IED stuff
	
	USAGE:  [] execVM <filename>
	
	INPUTS: none 
	
	OUTPUTS: none
	
*/
if (isNil "IEDlist") then {
	IEDlist = []; // this will be the global array of active IEDs
	publicVariable "IEDlist";  // broadcast the list
	};

[] spawn IED_fnc_IEDmonitor; // loops endlessly to track active IEDs for deletion

"IEDplantLOC" addpublicVariableEventHandler { if [_this select 1] call IED_fnc_IEDplacement; }; // gives server location to put an IED