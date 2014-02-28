/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine + soh changes
	
	Description:
	Sets up the hud for the player?
*/
private["_display","_alpha","_version","_p","_pg"];
disableSerialization;
_display = findDisplay 46;
_alpha = _display displayCtrl 1001;
_version = _display displayCtrl 1000;

2 cutRsc ["playerHUD","PLAIN"];
1000 cutRsc ["sohHud","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];
[] call life_fnc_hudUpdate;

if (!life_hud_looping) then
{
	[] spawn
	{
		private["_dam"];
		while {true} do
		{
			sleep 1;
			[] call life_fnc_hudUpdate;
		};
		life_hud_looping = false;
	};
};