//http://forums.bistudio.com/showthread.php?172864-Any-idea-how-this-was-done
private ["_iedPos","_distance","_volume"];
_iedPos = _this;
sleep 0.25;
if(alive player) then {

	_distance = (getpos player) distance _iedPOS;
	if(_distance < 200) then {  //less than 200 meters away
		addCamShake[1+random 5, 1+random 3, 5+random 15];
	};
	if(_distance < 75) then {
		_volume = linearConversion [0,60,75-_distance, 0.1, 1, true];
		playSound3d["A3\Missions_F_EPA\data\sounds\combat_deafness.wss", player, false, getpos player, _volume];
	};
	if(_distance < 40) then {
		[] spawn {	
			private ["_blur"];
			_blur = ppEffectCreate ["DynamicBlur", 474];
			_blur ppEffectEnable true;
			_blur ppEffectAdjust [0];
			_blur ppEffectCommit 0;
			
			waitUntil {ppEffectCommitted _blur};
			
			_blur ppEffectAdjust [10];
			_blur ppEffectCommit 0;
			
			_blur ppEffectAdjust [0];
			_blur ppEffectCommit 5;
			
			waitUntil {ppEffectCommitted _blur};
			
			_blur ppEffectEnable false;
			ppEffectDestroy _blur;
		};
	};
};