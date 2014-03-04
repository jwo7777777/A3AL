class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "STS Mini-Admin Menu";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.4;
		};
		
		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.03 + (5 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (5 / 40);
			h = (1 / 25);
		};
		
		class AdminID : Life_RscButtonMenu {
			idc = -1;
			text = "Get ID";
			onButtonClick = "[] call life_fnc_admingetID;";
			x = 0.1 + (5 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (5 / 40);
			h = (1 / 25);
		};
		class TPtoME : Life_RscButtonMenu {
			idc = -1;
			text = "plyr->ME";
			onButtonClick = "[] call life_fnc_adminTPtoME;";
			x = 0.23 + (5 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (5 / 40);
			h = (1 / 25);
		};
		class TPtoPlayer : Life_RscButtonMenu {
			idc = -1;
			text = "ME->plyr";
			onButtonClick = "[] call life_fnc_adminTPtoPlayer;";
			x = 0.36 + (5 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (5 / 40);
			h = (1 / 25);
		};
		class MAPTP : Life_RscButtonMenu {
			idc = -1;
			text = "MAPTP";
			onButtonClick = "[] spawn life_fnc_adminMAPTP;";
			x = 0.49 + (5 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (5 / 40);
			h = (1 / 25);
		};
		class StartGCAM : Life_RscButtonMenu {
			idc = -1;
			text = "GCAM";
			onButtonClick = "[player] execVM ""dialog\gcam\gcam.sqf"";";
			x = 0.62 + (5 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (5 / 40);
			h = (1 / 25);
		};
	};
};