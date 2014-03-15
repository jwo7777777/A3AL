/* Written by Brian Sweeney - [EPD] Brian*/

private ["_aslLoc","_smoke1","_smoke2","_smoke3","_smoke4","_smokes"];
//.55, .47, .37 sand color
//.78, .76, .71 whitish color
//.1, .1, .1 dark gray
//0, 0, 0 black
_aslLoc = _this select 0;

_smoke1 = "#particlesource" createVehicle _aslLoc;
_smoke1 setposasl _aslLoc;
_smoke1 setParticleCircle [0, [0, 0, 0]];
_smoke1 setParticleRandom [0, [5, 5, 0], [8, 8, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [8, 12, 16], [[0, 0, 0, 1], [0.35, 0.35, 0.35, 0.95], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
_smoke1 setDropInterval .01;

_smoke2 = "#particlesource" createVehicle _aslLoc;
_smoke2 setposasl _aslLoc;
_smoke2 setParticleCircle [0, [0, 0, 0]];
_smoke2 setParticleRandom [0, [5, 5, 0], [8, 8, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [8, 12, 16], [[.78, .76, .71, 1], [.35, .35, .35, 0.8], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
_smoke2 setDropInterval .01;

_smoke3 = "#particlesource" createVehicle _aslLoc;
_smoke3 setposasl _aslLoc;
_smoke3 setParticleCircle [0, [0, 0, 0]];
_smoke3 setParticleRandom [0, [5, 5, 0], [8, 8, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [8, 12, 16], [[.55, .47, .37, 1], [.35, .35, .35, 0.95], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
_smoke3 setDropInterval .01;

_smoke4 = "#particlesource" createVehicle _aslLoc;
_smoke4 setposasl _aslLoc;
_smoke4 setParticleCircle [0, [0, 0, 0]];
_smoke4 setParticleRandom [0, [5, 5, 0], [8, 8, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [8, 12, 16], [[.1, .1, .1, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
_smoke4 setDropInterval .01;

_smokes = [_smoke1,_smoke2, _smoke3,_smoke4];

sleep 1.5;

_smoke1 setDropInterval .05;
_smoke2 setDropInterval .05;
_smoke3 setDropInterval .05;
_smoke4 setDropInterval .05;

_smoke1 setParticleRandom [0, [9, 9, 0], [7, 7, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke2 setParticleRandom [0, [9, 9, 0], [7, 7, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke3 setParticleRandom [0, [9, 9, 0], [7, 7, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke4 setParticleRandom [0, [9, 9, 0], [7, 7, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];

_smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [8, 12, 16], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
_smoke2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [8, 12, 16], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
_smoke3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [8, 12, 16], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
_smoke4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [8, 12, 16], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];

sleep 3;

_smoke1 setParticleRandom [0, [12, 12, 0], [6, 6, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke2 setParticleRandom [0, [12, 12, 0], [6, 6, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke3 setParticleRandom [0, [12, 12, 0], [6, 6, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke4 setParticleRandom [0, [12, 12, 0], [6, 6, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];

sleep 3;

_smoke1 setParticleRandom [0, [15, 15, 0], [4, 4, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke2 setParticleRandom [0, [15, 15, 0], [4, 4, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke3 setParticleRandom [0, [15, 15, 0], [4, 4, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
_smoke4 setParticleRandom [0, [15, 15, 0], [4, 4, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];

sleep 25;
{
	deletevehicle _x;
} foreach _smokes;
