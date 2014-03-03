/*
	File: fn_civFetchGear.sqf
	Author: Bryan "Tonic" Boardwine with soh fixes
	
	Description:
	Fetches specific key items from the civilian for a persistent state.
	item types 4096 and 131072 are innocuous things like clothes, helmets, goggles, binocs, maps, vests,etc...
*/
private["_ret","_uItems","_bItems","_vItems"];
_ret = [];

_ret set[count _ret,uniform player];
_ret set[count _ret,backpack player];
_ret set[count _ret,goggles player];
_ret set[count _ret,headgear player];
_ret set[count _ret,assignedItems player];

_uItems = [];
_bItems = [];
_vItems = [];

if(uniform player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_uItems set[count _uItems,_x];
		};
	} foreach (uniformItems player);
};

if(backpack player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_bItems set[count _bItems,_x];
		};
	} foreach (backpackItems player);
};

_ret set[count _ret,_uItems];
_ret set[count _ret,_bItems];

// order is important for backwards compatibility in DB
// otherwise things will get really screwed up for existing characters on load

_ret set[count _ret,vest player];

if(vest player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_vItems set[count _vItems,_x];
		};
	} foreach (vestItems player);
};

_ret set[count _ret,_vItems];

civ_gear = _ret;