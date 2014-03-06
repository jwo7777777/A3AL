/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.
	
	Note: 
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones"];
_appleZones = ["apple_1","apple_2","apple_3","apple_4"];
_peachZones = ["peaches_1","peaches_2","peaches_3","peaches_4"];
_heroinZones = ["heroin_1"];
_cocaineZones = ["cocaine_1"];
_weedZones = ["weed_1"];
_copperZones = ["lead_1"];
_ironZones = ["iron_1"];
_saltZones = ["salt_1"];
_sandZones = ["sand_1"];
_diamondZones = ["diamond_1"];
_oilZones = ["oil_1", "oil_2"];
_rockZones = ["rock_1"];



//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Apples = player addAction['Gather Apples',life_fnc_gatherApples,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Peaches = player addAction['Gather Peaches',life_fnc_gatherPeaches,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Peaches;"];
} foreach _peachZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_heroin = player addAction['Gather Heroin',life_fnc_gatherHeroin,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cannabis = player addAction['Gather Cannabis',life_fnc_gatherCannabis,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Cannabis;"];
} foreach _weedZones;

//Create cocaine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Coke = player addAction['Gather Cocaine',life_fnc_gatherCocaine,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Coke;"];
} foreach _cocaineZones;

//Create copper zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[30,30,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Copper = player addAction['Mine Copper',{['copperore',2] call life_fnc_pickaxeUse;},'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Copper;"];
} foreach _copperZones;

//Create iron zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[30,30,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Iron = player addAction['Mine Iron',{['ironore',2] call life_fnc_pickaxeUse;},'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Iron;"];
} foreach _ironZones;

//Create salt zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[120,120,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Salt = player addAction['Mine Salt',{['salt',4] call life_fnc_pickaxeUse;},'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Salt;"];
} foreach _saltZones;

//Create sand zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[75,75,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Sand = player addAction['Mine Sand',{['sand',5] call life_fnc_pickaxeUse;},'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Sand;"];
} foreach _sandZones;

//Create diamond zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Diamonds = player addAction['Mine Diamonds',{['diamond',1] call life_fnc_pickaxeUse;},'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Diamonds;"];
} foreach _diamondZones;

// Create oil zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[40,40,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Oil = player addAction['Mine Oil', {['oilu',1] call life_fnc_pickaxeUse;},'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Oil;"];
} foreach _oilZones;

//Create Rock zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Rocks = player addAction['Mine Rocks',{ ['rock',2] call life_fnc_pickaxeUse;},'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Rocks;"];
} foreach _rockZones;
