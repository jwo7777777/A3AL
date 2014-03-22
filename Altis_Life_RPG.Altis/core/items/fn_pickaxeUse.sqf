/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
private["_mine","_itemWeight","_diff","_itemName","_val"];
_mine = _this select 0;
_val = _this select 1;

//Mine check
if(vehicle player != player) exitWith {hint "You can't mine from inside a car!";};
if (life_inv_pickaxe < 1) exitWith {hint "You don't have a pickaxe with which to mine!";}; // no pickaxe

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull";};
life_action_inUse = true;

titleText["Mining...","PLAIN"];
titleFadeOut 5;
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["You have mined %2 %1",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;