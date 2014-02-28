/*
	@file Version: 1.0
	@file Name: vehicle_hud.hpp
	@file Author: Goober based on [404] Deadbeat
	@file Created: 02/27/2014 and 11/09/2012 04:23
	@file Args:
*/

// #define hud_status_idc 3600
#define hud_vehicle_idc 3601

class sohHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "sohHud";
	onLoad = "uiNamespace setVariable ['sohHud', _this select 0]";
	
	class controlsBackground {
		class sohHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
                        y = safeZoneY + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
	};
};
