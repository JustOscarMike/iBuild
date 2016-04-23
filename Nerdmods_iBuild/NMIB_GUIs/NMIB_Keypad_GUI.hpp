//class RscText;
//class RscButton;

class NMIB_KeypadBtn : RscButton 
{
	shadow = 0;
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0.002;
	font = "PuristaLight";

/* 	colorText[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.5
	}; */
	
 	colorFocused[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.75
	};
	
	colorBackground[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.75
	};
	
	colorBackgroundActive[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.25
	};
	
	colorShadow[] = 
	{
		0,
		0,
		0,
		0
	};
	
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
};
//missionConfigFile >> "NMIB_Keypad"
class NMIB_Keypad {
    idd = -1;
    movingenable = true;
	onLoad = "uiNamespace setVariable ['NMIB_Keypad', _this select 0];if (uiNamespace getVariable 'NMIB_KeypadCreateKey') then {((_this select 0) displayCtrl 1000) ctrlSetText str(floor random 9) + str(floor random 9) + str(floor random 9)} else {((_this select 0) displayCtrl 1000) ctrlSetText '0000'};'dynamicBlur' ppEffectAdjust [3];'dynamicBlur' ppEffectCommit 0.5;'dynamicBlur' ppEffectEnable true;";
	onUnload = "'dynamicBlur' ppEffectAdjust [0];'dynamicBlur' ppEffectCommit 0.5;'dynamicBlur' ppEffectEnable true;true";
	
    class Controls
	{
		class Vingette: RscPicture
		{
			idc = 03536;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = safezoneW;
			h = safezoneH;
			
			colorText[] =
			{
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
				0.3
			};
			text = "NerdMods_iBuild\NMIB_Images\iBuild_Vingette.paa";
		};
		class NMIB_KP_Info: RscStructuredText
		{
			idc = 1100;
			x = 0.025 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.95 * safezoneW;
			h = 0.26 * safezoneH;
			
			text="<t align='center'>ENTER A KEY TO LOCK OR OPEN THIS DOOR</t>";
		};
		class IGUIBack_2200: IGUIBack
		{
			//idc = 2200;
			x = 0.4125 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.1625 * safezoneW;
			h = 0.44 * safezoneH;
			
			colorBackground[] =
			{
				"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_B',0.5])",
				0.75
			};			
		};
		class NMIB_KGUI_Digits: RscText
		{
			idc = 1000;
			text = "0000";
			x = 0.425 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.08 * safezoneH;
			colorBackground[] =
			{
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
				0.5
			};
			style = 2;
			shadow = 0;
			font = "PuristaLight";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 10) * 1)";
			colorText[] =
			{
				1,
				1,
				1,
				1
			};
		};
		class NMIB_KGUI_1: NMIB_KeypadBtn
		{
			idc = 1600;
			text = "1"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.58 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[1] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_2: NMIB_KeypadBtn
		{
			idc = 1601;
			text = "2"; //--- ToDo: Localize;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.58 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[2] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_3: NMIB_KeypadBtn
		{
			idc = 1602;
			text = "3"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.58 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[3] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_4: NMIB_KeypadBtn
		{
			idc = 1603;
			text = "4"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[4] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_5: NMIB_KeypadBtn
		{
			idc = 1604;
			text = "5"; //--- ToDo: Localize;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[5] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_6: NMIB_KeypadBtn
		{
			idc = 1605;
			text = "6"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[6] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_7: NMIB_KeypadBtn
		{
			idc = 1606;
			text = "7"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[7] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_8: NMIB_KeypadBtn
		{
			idc = 1607;
			text = "8"; //--- ToDo: Localize;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[8] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_9: NMIB_KeypadBtn
		{
			idc = 1608;
			text = "9"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[9] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_0: NMIB_KeypadBtn
		{
			idc = 1609;
			text = "0"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[0] call NMIB_fnc_KeypadAction";
		};
		class NMIB_KGUI_Cancel: NMIB_KeypadBtn
		{
			idc = 1610;
			text = "X"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			action = "[10] call NMIB_fnc_KeypadAction";
			
			colorFocused[] = 
			{
				1,
				0.4,
				0.4,
				0.75
			};
			
			colorBackground[] = 
			{
				1,
				0.4,
				0.4,
				0.75
			};
			
			colorBackgroundActive[] = 
			{
				1,
				0.4,
				0.4,
				0.25
			};
		};
	};
};