class IGUIBack;
class RscStructuredText;
class RscControlsgroup;
class RscListbox;
class RscText;
class RscPicture;
class RscButton;

class NMIB_Setup_GUI
{
    idd = -1;
    movingenable = true;
	onLoad = "uiNamespace setVariable ['NMIB_Setup_GUI', _this select 0];call NMIB_fnc_SetupLoad;'dynamicBlur' ppEffectAdjust [3];'dynamicBlur' ppEffectCommit 0.5;'dynamicBlur' ppEffectEnable true;";
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
			
			colorText[] = {0,0,0,0.5};
			text = "NerdMods_iBuild\NMIB_Images\iBuild_Vingette.paa";
		};		
		class IGUIBack_2201: IGUIBack
		{
			//idc = 2201;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.55 * safezoneW;
			h = 0.76 * safezoneH;
			colorBackground[] = 
			{
				"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_B',0.5])",
				0.9
			};
		};
		class NMIB_MainGUI_SideBarBG: IGUIBack
		{
			//idc = 2201;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.76 * safezoneH;
		};
		class NMIB_MainGUI_SidebarText: RscStructuredText
		{
			//idc = 1101;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.44 * safezoneH;
			text = $STR_NMIB_Links;
		};
		class My_RscControlsgroup :  RscControlsgroup
		{
			x = 0.4 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = (0.375 * safezoneW)+0.04;
			h = 0.76 * safezoneH;
			class VScrollbar
			{
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				autoScrollDelay = 5;
				autoScrollEnabled = 1;
				autoScrollRewind = 0;
				autoScrollSpeed = -1;				
				color[] = {1,1,1,0.8};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				height = 0;
				scrollSpeed = 0.06;
				shadow = 0;				
				width = 0.04;
			};
			class Controls
			{
				class NMIB_MainGUI_ContentText: RscStructuredText
				{
					idc = 1100;
					x = 0.02;
					y = 0;
					w = 0.35 * safezoneW;
					h = 1 * safezoneH;
					colorBackground[] =
					{
						"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0.69])",
						"(profilenamespace getvariable ['IGUI_BCG_RGB_G',0.75])",
						"(profilenamespace getvariable ['IGUI_BCG_RGB_B',0.5])",
						0
					};
				};
			};
		};
/* 		class NMIB_MainGUI_ContentText: RscStructuredText
		{
			idc = 1100;
			x = 0.4125 * safezoneW + safezoneX;
			y = 0.14 * safezoneH + safezoneY;
			w = 0.35 * safezoneW;
			h = 0.72 * safezoneH;
			colorBackground[] =
			{
				"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_B',0.5])",
				0
			};			
			//text = $STR_NMIB_Welcome+"<t font='PuristaLight' align='center'><br/>Welcome to iBuild<br/><br/>iBuild allows for precise construction of modular buildings by utilising an intuitive snap mechanic alongside objects that are explicitly designed to fit seamlessly together. <br/><br/><br/>BEFORE YOU BEGIN<br/><br/>For iBuild to function in it's full glory, you must first bind some basic user action keys. <br/><br/><a href='http://ibuildmod.wordpress.com/controls'>Video</a></t>";
			//text = $STR_NMIB_Welcome;
		}; */
		class NMIB_MainGUI_SidebarMenu: RscListbox
		{
			idc = 1500;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.32 * safezoneH;
			
			font = "PuristaLight";
			rowHeight = "1.77 * ((((safezoneW / safezoneH) min 1.2) / 1.15) / 25)";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
			
			colorText[] = 
			{
				1,
				1,
				1,
				1
			};	
			colorSelect[] = 
			{
				1,
				1,
				1,
				1
			};
			colorSelect2[] = 
			{
				1,
				1,
				1,
				1
			};
			
			colorBackground[] = 
			{
				0,
				0,
				0,
				0.1
			};
			
			colorSelectBackground[] = 
			{
				0,
				0,
				0,
				0.1
			};
			colorSelectBackground2[] = 
			{
				0,
				0,
				0,
				0.1
			};
			
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
				width = 0.03;
			};
			
			onLBSelChanged = "_this call NMIB_fnc_Main_Menu;";
		};		
/* 		class NMIB_KeyBinds_List: RscListbox
		{
			idc = 1500;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.5 * safezoneW;
			h = 0.2 * safezoneH;
			
			type = CT_LISTNBOX;
			style = LB_TEXTURES;

			columns[] = {0, 0.8};
			rowHeight = "1.77 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			drawSideArrows = 0;
			idcLeft = 20010; 
			idcRight = 20011; 
			toolTip = "Double-click to see vehicle.";
			font = "PuristaLight";
			
			access = 0;

			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorScrollbar[] = {1,1,1,1};
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {1,1,1,0};
			colorSelectBackground2[] = {1,1,1,0};
			//colorBackground[] = {1,1,1,1};
			soundSelect[] = 
			{
				"\A3\ui_f\data\sound\RscListbox\soundSelect",
				0.09,
				1
			};
			autoScrollSpeed = -1;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
			arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
			arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
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
			shadow = 0;
			colorShadow[] = {1,1,1,1};
			period = 1.2;
			maxHistoryDelay = 1;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {1,1,1,1};
		}; */
	};
};

/* #Dewoky
$[
	1.063,
	["iBuild_BindKeys_GUI",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,0,0],
	[1500,"",[1,"",["0.25 * safezoneW + safezoneX","0.64 * safezoneH + safezoneY","0.5 * safezoneW","0.2 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2201,"",[1,"",["0.25 * safezoneW + safezoneX","0.16 * safezoneH + safezoneY","0.1375 * safezoneW","0.46 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.25 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.1125 * safezoneW","0.2 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"",[1,"",["0.4 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.3375 * safezoneW","0.42 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"",[1,"",["0.2625 * safezoneW + safezoneX","0.4 * safezoneH + safezoneY","0.1125 * safezoneW","0.2 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/










