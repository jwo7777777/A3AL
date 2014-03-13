/*
	File: fn_IEDtriggers.sqf
	Author: soh
	
	Description:
	based on side "WEST" or not west
	actual triggers already created on server
	this is each player setting appropriate messages and actions for their char.
*/
private["_device","_outer","_disarm","_boom","_device","_actionIDX"];
_outer = _this select 1;  // 20m warning marker if you have minedetector
_disarm = _this select 2; // 5m detectorless warning and disarm radius
_boom = _this select 3;  // boom if in vehicle when triggered
_device = _this select 0;  // IED vehicle created when IED is placed



if (side player == west) then  // only WEST interacts once planted
	{
	_outer setTriggerArea[20,20,0,false]; // 20m circle around device
	_outer setTriggerActivation["WEST", "PRESENT", true]; // repeating trigger that west sets off by being in trigger area
	_outer setTriggerStatements ["this and (vehicle player == player) and
		(('MineDetector' in uniformItems player) or
		('MineDetector' in backpackItems player) or
		('MineDetector' in vestItems player) or
		('MineDetector' in weapons player))",
		"hint 'WARNING: IED Nearby!!';",
		"hint 'Leaving Area of IED.'"];
		
	_disarm setTriggerArea[5,5,0,false]; // 5m radius for disarming
	_disarm setTriggerActivation["WEST", "PRESENT", true]; // repeating trigger
	_disarm setTriggerStatements["this and (vehicle player == player) and
		(('Toolkit' in uniformItems player) or
		('Toolkit' in backpackItems player) or
		('Toolkit' in vestItems player) or
		('Toolkit' in weapons player))",
		"_actionIDX = player addAction['Disarm IED', 
			'{[_device] spawn IED_fnc_disarmIED; player removeAction _actionIDX;}',
			'',
			'6']",
		"player removeAction _actionIDX"];
		
	_boom setTriggerArea[10,10,0,false]; // simple presence trigger
	_boom setTriggerActivation["WEST", "PRESENT", false];
	_boom setTriggerStatements["this and (vehicle player != player)",
		"[_device] spawn IED_fnc_detonateIED;",""];
	};