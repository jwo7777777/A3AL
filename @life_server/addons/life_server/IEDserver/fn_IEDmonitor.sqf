/*
	File: fn_IEDmonitor.sqf
	Author: soh
	
	Description:
	server monitors each active IED
	
	USAGE:  [] execVM <filename>
	
	INPUTS: none (uses global variable "IEDlist"
	
	OUTPUTS: none
	
	The server creates the vehicles (generic term for non-openable container) which will be the mine and the "camoflage" garbage.
	
	Server creates trigger, but trigger "settings" are local to each player,
	so trigger characteristics must be set at each player's computer.
	
	How can we tell when the explosive has been deactivated or detonated?  The mine "vehicle" will become null when either of these
	happens.  In the case of deactivation, the game removes the existing mine vehicle and places another one laying on its side
	ready to be grabbed by a player.  But it does not give a script handle to the new object.  
	The deactivated mine can be planted again, but this will not produce an IED, only a simple mine.
	
	Without the garbage covering the mine, a civilian could conceivably trigger it in a heavy vehicle.
	
	There is a small corner case that an IED gets deleted while a JIP player is processing the list of active IEDs
	to create local player triggers.  The JIP routine should do pervasive and failsafe trigger setting.
*/
private ["_flag"];
while {true} do // loop forever ... as long as the server is running
{
	_flag = false;  // flags whether there is any need to delete an array member
	sleep 1;  //  controls loop speed to once per second
	if ((!(isNil "IEDlist")) and ((count IEDlist) > 0)) then
	{
		{	
			if ((isNull (_x select 0)) or (isNull (_x select 1)) or (isNull (_x select 2))) then // are any of them void
			{  // select 0 will be void if garbage vehicle did not create, select 1 will be void if mine exploded, select 2 if trigger failed to create properly
				if !(isNull (_x select 0)) then { deleteVehicle (_x select 0);};  // delete garbage
				if !(isNull (_x select 1)) then { deleteVehicle (_x select 1);};  // delete explosive (just to be script-safe)
				if !(isNull (_x select 2)) then { deleteVehicle (_x select 2);};  // delete trigger (don't clutter the server)
				_flag = true;  // we did get rid of IED, so we need to delete it from the array.
				IEDlist set [ _forEachIndex, [-1]];  // mark this entry for deletion
			};
		} foreach IEDlist;
		
		if (_flag) then { IEDlist = IEDlist - [-1]; publicVariable "IEDlist";};  // if there is a change, then broadcast it.
	};
};



