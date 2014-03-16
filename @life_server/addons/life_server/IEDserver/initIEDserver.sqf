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
	
if (isNil "IEDtypes") then {
	IEDtypes = ["Land_FieldToilet_F","Land_ToiletBox_F","Land_GarbageBags_F","Land_GarbagePallet_F","Land_JunkPile_F","Land_Tyres_F","Land_CratesWooden_F","Land_Sacks_goods_F","Land_Sacks_heap_F"];
	};
	
if (isNil "lock_IEDlist") then {
	lock_IEDlist = false;
	publicVariable "lock_IEDlist";
	};

if (isNil "IEDnum") then {
	IEDnum = 0;
	};
	
"IEDplantLOC" addpublicVariableEventHandler { (_this select 1) call IED_fnc_IEDplacement; }; // gives server location to put an IED

"IEDdeleteHandle" addpublicVariableEventHandler { (_this select 1) call IED_fnc_IEDmonitor; }; // give a handle to the server to delete an IED