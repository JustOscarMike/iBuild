//missionConfigFile >> "NMIB_Craft_GUI"

class NMIB_Craft_GUI
{
    idd = -1;
    movingenable = false;
	onLoad = "closedialog 0;uiNamespace setVariable ['NMIB_Craft_GUI', _this select 0];_this select 0 call NMIB_fnc_CraftLoad;'dynamicBlur' ppEffectAdjust [3];'dynamicBlur' ppEffectCommit 0.5;'dynamicBlur' ppEffectEnable true;";
	onUnload = "'dynamicBlur' ppEffectAdjust [0];'dynamicBlur' ppEffectCommit 0.5;'dynamicBlur' ppEffectEnable true;true";
	
    class Controls
	{
		class Main_BG: IGUIBack
		{
			//idc = 2200;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.425 * safezoneW;
			h = 0.56 * safezoneH;
		};
		
		class Group_BG: IGUIBack
		{
			//idc = 2200;
			x = 0.5375 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.42 * safezoneH;
		};
		
		class Module_Group_List: RscListbox
		{
			idc = 1500;
			x = 0.5375 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.42 * safezoneH;
			//lineSpacing = 1;
			type = 102;
			style = 16;
			
			columns[] = {0,0.8,0.975};
			rowHeight = "1.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"; 

			font = "PuristaLight";
			
			access = 0;

			itemSpacing = 0.005;
			
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorScrollbar[] = {1,1,1,1};
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] =
			{
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
				0.75
			};			
			colorSelectBackground2[] =
			{
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
				0.75
			};			
			
			drawSideArrows = 0;
			idcLeft = -1; 
			idcRight = -1;
			
			class ListScrollBar
			{
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				autoScrollDelay = 5;
				autoScrollEnabled = 1;
				autoScrollRewind = 0;
				autoScrollSpeed = -1;				
				color[] = {1,1,1,0.75};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				height = 0;
				scrollSpeed = 0.06;
				shadow = 0;				
				width = 0;
			};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

 			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,0};			
			tooltipColorShade[] =
			{
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
				0.75
			};			
			shadow = 0;
			period = 1.2;
			maxHistoryDelay = 1;
			
			onLBSelChanged = "_this call NMIB_fnc_ModulesList";
			//text = "";
		};
		class List_BG: IGUIBack
		{
			//idc = 2200;
			x = 0.7375 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.42 * safezoneH;
		};		
		class Modules_List: Module_Group_List
		{
			idc = 1501;
			x = 0.7375 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.42 * safezoneH;
			
			onLBSelChanged = "_this call NMIB_fnc_ModuleSelect";
		};
		class Header_BG: IGUIBack
		{
			idc = 2201;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.425 * safezoneW;
			h = 0.06 * safezoneH;
		};
		class Logo_Picture: RscPicture
		{
			idc = 1200;
			text = "Nerdmods_iBuild\NMIB_Images\iBuild_GUI_Logo.paa";
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.06 * safezoneH;
			style = 2096;
		};
		class Header_Text: RscText
		{
			idc = 1000;
			text = "iBuild Mod"; //--- ToDo: Localize;
			x = 0.55 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.325 * safezoneW;
			h = 0.06 * safezoneH;
			font = "PuristaLight";
			shadow = 0;
		};
		class Version_Text: RscText
		{
			idc = 1003;
			text = $STR_NMIB_Version; //--- ToDo: Localize;
			x = 0.875 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.06 * safezoneH;
			font = "PuristaLight";
			shadow = 0;
			style = 2;
		};
		class Tri: RscPicture
		{
			//idc = 1100;
			x = (0.4625 * safezoneW + safezoneX)+0.005;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.08 * safezoneH;
			text = "NerdMods_iBuild\NMIB_Images\NMIB_GUI\NMIB_Craft_Tri.paa";
			style = 2096;
			ColorText[] =
			{
				"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_B',0.5])",
				0.79
			};			
		};
	};	
};






/* #Wujelu
$[
	1.063,
	["dad",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,0,0],
	[2200,"Main_BG",[1,"",["0.5125 * safezoneW + safezoneX","0.22 * safezoneH + safezoneY","0.425 * safezoneW","0.56 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2201,"Group_BG",[1,"",["0.5375 * safezoneW + safezoneX","0.32 * safezoneH + safezoneY","0.175 * safezoneW","0.42 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Module_Group_List: RscListBox",[1,"",["0.5375 * safezoneW + safezoneX","0.32 * safezoneH + safezoneY","0.175 * safezoneW","0.42 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1500;","type = 102;","columns[] = {0,0.8,0.9};","rowHeight = |1.77 ~ ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)|;","font = |PuristaLight|;","itemSpacing = 0.005;","colorDisabled[] = {1,1,1,1};","colorScrollbar[] = {1,1,1,1};","colorSelect[] = {1,1,1,1};","colorSelect2[] = {1,1,1,1};","colorSelectBackground[] = {|(profilenamespace getvariable [^GUI_BCG_RGB_R^,0.69])|,|(profilenamespace getvariable [^GUI_BCG_RGB_G^,0.75])|,|(profilenamespace getvariable [^GUI_BCG_RGB_B^,0.5])|,0.5};","colorSelectBackground2[] = {|(profilenamespace getvariable [^GUI_BCG_RGB_R^,0.69])|,|(profilenamespace getvariable [^GUI_BCG_RGB_G^,0.75])|,|(profilenamespace getvariable [^GUI_BCG_RGB_B^,0.5])|,0.5};","drawSideArrows = 0;","idcLeft = -1;","idcRight = -1;","tooltipColorBox[] = {1,1,1,0};","tooltipColorShade[] = {|(profilenamespace getvariable [^GUI_BCG_RGB_R^,0.69])|,|(profilenamespace getvariable [^GUI_BCG_RGB_G^,0.75])|,|(profilenamespace getvariable [^GUI_BCG_RGB_B^,0.5])|,0.5};","onLBSelChanged = |_this call NMIB_fnc_LoadModules|;"]],
	[1001,"Modules_List: Module_Group_List",[1,"",["0.7375 * safezoneW + safezoneX","0.32 * safezoneH + safezoneY","0.175 * safezoneW","0.42 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1501;","onLBSelChanged = |_this call NMIB_fnc_SelectModule|;"]],
	[2202,"Header_BG",[1,"",["0.5125 * safezoneW + safezoneX","0.22 * safezoneH + safezoneY","0.425 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2201;"]],
	[1200,"Logo_Picture",[1,"iBuild_Logo.paa",["0.5125 * safezoneW + safezoneX","0.22 * safezoneH + safezoneY","0.0375 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1200;"]],
	[1002,"Header_Text",[1,"iBuild Mod",["0.55 * safezoneW + safezoneX","0.22 * safezoneH + safezoneY","0.325 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1000;","font = |PuristaLight|;","shadow = 0;"]],
	[1003,"Version_Text",[1,"v0.1",["0.875 * safezoneW + safezoneX","0.22 * safezoneH + safezoneY","0.0625 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/




