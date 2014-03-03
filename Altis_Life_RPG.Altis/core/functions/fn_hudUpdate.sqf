/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health", "_tempstring", "_yoffset", "_vehicle", "_hudVehicle", "_x", "_y"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_hudVehicle = _ui displayCtrl 3601;

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.548];
_food ctrlSetText format["%1", life_hunger];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.502];
_water ctrlSetText format["%1", life_thirst];
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.456];
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;

_tempString = "";
_yOffset = 0.24;

if(player != vehicle player) then
{

	_vehicle = assignedVehicle player;

	{
		if((driver _vehicle == _x) || (gunner _vehicle == _x)) then
		{
			if(driver _vehicle == _x) then
			{
				_tempString = format ["%1 %2 <img size='0.8' image='client\icons\driver.paa'/><br/>",_tempString, (name _x)];
				_yOffset = _yOffset + 0.04;
			}
			else
			{
				_tempString = format ["%1 %2 <img size='0.8' image='client\icons\gunner.paa'/><br/>",_tempString, (name _x)];
				_yOffset = _yOffset + 0.04;
			}; 
		}
		else
		{
			_tempString = format ["%1 %2 <img size='0.8' image='client\icons\cargo.paa'/><br/>",_tempString, (name _x)];
			_yOffset = _yOffset + 0.04;
		};    
	} forEach crew _vehicle;
};

_hudVehicle ctrlSetStructuredText parseText _tempString;
_x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
_y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
_hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
_hudVehicle ctrlCommit 0;
