/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the player where he selected.
	
	Comments and decrufting of code by jwo7777777
	As of 3.1.1 all the spawn points are markers and not building config entries AFAIK - jwo7777777
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;  // Close the currently active user dialog.
if(count life_spawn_point == 0) then  // if there are no spawn points in the array ...
{
	_spCfg = [playerSide] call life_fnc_spawnPointCfg; // ... then fill the array with appropriate spawn points
	_sp = _spCfg select 0;  // pick the first location in the array, typically Kavala on Altis
}
else
{
	_sp = life_spawn_point; // player indicated which one he wanted, so set _sp to that point
};
	
if(playerSide == civilian) then  // civilians may have buildings to spawn into
{
	if(isNil {(call compile format["%1", _sp select 0])}) then { //if the spawn point name is not a building config entry? ...
		player setPos (getMarkerPos (_sp select 0)); // ... then treat it as a marker location.
	} else {
		_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom; // if a multiple position building ... pick one
		_spawnPos = _spawnPos buildingPos 0; /// ... choose first spawn point from the building position list
		player setPos _spawnPos; // put the player there
	};
}
	else
{
	player setPos (getMarkerPos (_sp select 0)); // cops just use markers, put the cop there
};
titleText[format["You have spawned at %1",_sp select 1],"BLACK IN"];

[] call life_fnc_hudSetup;