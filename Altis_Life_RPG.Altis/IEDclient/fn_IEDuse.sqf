/*
	File: fn_IEDuse.sqf
	Author: soh
	
	Description:
	place the bomb
*/

if(vehicle player != player) exitWith {hint "You can't do that in a car!";};
if (life_inv_IED < 1) exitWith {hint "You don't have an IED!";};

if([false,"IED",1] call life_fnc_handleInv) then {
	titleText["Placing IED...","PLAIN"];
	titleFadeOut 5;
	life_action_inUse = true;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	IEDplantLOC = (getpos player);
	publicVariableServer "IEDplantLOC";
	hint "You placed an IED!";
	life_action_inUse = true;
} else {
	hint "... some IED error";
};