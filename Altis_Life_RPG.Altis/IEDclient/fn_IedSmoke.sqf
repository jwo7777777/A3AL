/* Written by Brian Sweeney - [EPD] Brian*/
private ["_loc","_aslLoc","_numPlumes","_r"];

_loc = _this;
_aslLoc = [_loc select 0, _loc select 1, getTerrainHeightASL [_loc select 0, _loc select 1]];


_numPlumes = 20 + floor random 10;
for "_i" from 0 to _numPlumes -1 do{
	_r = floor random 3;
	switch(_r) do
	{
		case 0:
		{
			[_loc, _aslLoc] spawn IED_fnc_IedSandTrailSmoke;
		};
		case 1: 
		{
			[_loc, _aslLoc] spawn IED_fnc_IedGrayTrailSmoke;
		};
		case 2:
		{
			[_loc, _aslLoc] spawn IED_fnc_IedBrownTrailSmoke;
		};
	};		

};
[_aslLoc] call IED_fnc_IedCreateRing;
