/*
	File: fn_IEDdisarm.sqf
	Author: TOnic, heavily modified by soh
	Description:
	setoff a rapid series of effects and explosions to mimic an IED
	
	INPUTS: Object of any sort that has the position for the IED
	
	OUTPUTS: none
*/
private["_iedPosition", "_disarm","_displayName","_upp","_ui","_progress","_pgText","_cP","_obj","_vartest","_IEDarray","_boom","_vehicle","_boom","_iednum"];

diag_log "IED detonation";
_IEDarray = [_this,3,[-1,objNull,objNull,objNull,objNull],[],[5]] call BIS_fnc_param;

_iednum = [_IEDarray,0,-1,[0]] call BIS_fnc_param;
_vehicle = 	[_IEDarray, 1, objNull, [objNull]] call BIS_fnc_param;
_ied = [_IEDarray, 2, objNull, [objNull]] call BIS_fnc_param;
_boom = [_IEDarray, 3, objNull, [objNull]] call BIS_fnc_param;
_disarm = [_IEDarray, 4, objNull, [objNull]] call BIS_fnc_param;

if ((_iednum == -1) or (isNull _vehicle) or (isNull _ied) or (isNull _boom) or (isNull _disarm))
	exitWith { diag_log "Disarm was passed an invalid device.";};

_iedPosition = getpos _disarm; // device position

_vartest = [] + uniformItems player + backpackItems player + vestItems player;
diag_log _vartest;
if !("ToolKit" in _vartest) exitWith {titleText["You cannot disarm IEDs without a toolkit!","PLAIN"];};
diag_log "Had Toolkit";

life_action_inUse = true;
_displayName = "IED";
_upp = format["Disarming %1",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.27;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action cancelled","PLAIN"]; life_action_inUse = false;};
if(player != vehicle player) exitWith {titleText["You cannot do this from inside a vehicle.","PLAIN"];};

(_this select 0) removeAction (_this select 2); //success, get rid of action item

deletevehicle _vehicle; deletevehicle _ied; deletevehicle _boom; deletevehicle _disarm;

IEDdeleteHandle = _iednum;
publicVariableServer "IEDdeleteHandle";
player removeItem "ToolKit";

diag_log "IED disarmed";
titleText["You have disarmed the IED.","PLAIN"];

_obj = "Land_Suitcase_F" createVehicle _iedPosition;
[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
_obj setPos _iedPosition;
_obj setVariable["item",["IED",1],true];