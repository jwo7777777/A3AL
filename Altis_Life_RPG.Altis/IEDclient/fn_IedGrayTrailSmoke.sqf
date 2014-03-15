/* Written by Brian Sweeney - [EPD] Brian*/

private ["_loc","_aslLoc","_size","_thingToFling","_smoke","_sleepTime","_currentTime"];
_loc = _this select 0;
_aslLoc = _this select 1;

_size = 1 + random 3;

_thingToFling = "Land_Bucket_F" createVehicle [0,0,0];
_thingToFling hideObject true;
_thingToFling setPos _loc;
_smoke = "#particlesource" createVehicle _aslLoc;
_smoke setposasl _aslLoc;
_smoke setParticleCircle [0, [0, 0, 0]];
_smoke setParticleRandom [0, [0.25, 0.25, 0], [0, 0, 0], 0, 1, [0, 0, 0, 0.1], 0, 0];
_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[.1, .1, .1, .75], [0.78, 0.76, 0.71, 0]], [0.08], 1, 0, "", "", _thingToFling];
_smoke setDropInterval 0.02;

_thingToFling setVelocity [(random 40)-20, (random 40)-20, 5+(random 30)];
_thingToFling allowDamage false;
_sleepTime = (random 1);
_currentTime = 0;

while { _currentTime < _sleepTime and _size > 0} do {
	//_thingToFling hideObject true;
	_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[.1, .1, .1, .75], [0.78, 0.76, 0.71, 0]], [0.08], 1, 0, "", "", _thingToFling];
	
	_sleep = random .05;
	_size = _size - (6*_sleep);
	_currentTime = _currentTime + _sleep;
	sleep _sleep;
};

_thingToFling setpos [0,0,0];
deletevehicle _smoke;
deletevehicle _thingToFling;