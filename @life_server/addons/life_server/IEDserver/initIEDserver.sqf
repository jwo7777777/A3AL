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
	IEDlist = [];
	publicVariable "IEDlist";
	};

[] spawn IED_fnc_IEDmonitor; // loops endlessly to track active IEDs

"IEDplantLOC" addpublicVariableEventHandler { if [_this select 1] call IED_fnc_IEDplacement; };