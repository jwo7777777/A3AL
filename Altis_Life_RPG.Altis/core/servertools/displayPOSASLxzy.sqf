/*
	Monitor ESC Menu,
	this file is temporary and will be rolled into a FSM later on.
*/
private ["_loc"];

while {true} do
{
	_loc = getposASL player;
	_loc = [ _loc select 0, _loc select 2, _loc select 1 ];
	hint format ["SQM loc: %1", _loc];
	sleep 5;
};