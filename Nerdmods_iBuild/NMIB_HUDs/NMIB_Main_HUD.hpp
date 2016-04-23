/* class RscPicture;	// External class reference
class IGUIBack;	// External class reference
class RscStructuredText;	// External class reference
class RscText;	// External class reference */
//missionConfigFile >> "NMIB_HUD"
class RscTitles {
	class NMIB_HUD {
		idd = 111990;
		onLoad = "uiNamespace setVariable ['NMIB_HUD', _this select 0];";
		duration = 0.1;
		fadein = 0;
		fadeout = 0;
		movingEnable = 1;
		enableSimulation = 1;
		enableDisplay = 1;
		onunLoad = "";
		
		class controls {
			class NMIB_Title : RscStructuredText {
				x = "0 * safezoneW + safezoneX";
				y = "-0.02 * safezoneH + safezoneY";
				w = "0.0765 * safezoneW";
				h = "0.3 * safezoneH";
				font = "PuristaLight";
				//text = "<img align='center' shadow='0' size='6' image='NerdMods_iBuild\NMIB_Images\iBuild_Logo.paa'/><br/><t align='center' shadow='0' size='1.5' font = 'puristaLight' >v1.0</t>";
				text = $STR_NMIB_HUD;
				colorText[] = {1, 1, 1, 0.5};
			};
			class NMIB_Count : RscStructuredText {
				idc = 0982;
				x = "0 * safezoneW + safezoneX";
				y = "0.225 * safezoneH + safezoneY";
				w = "0.0765 * safezoneW";
				h = "0.3 * safezoneH";
				font = "PuristaLight";
				//text = "<img align='center' shadow='0' size='6' image='NerdMods_iBuild\NMIB_Images\iBuild_Logo.paa'/><br/><t align='center' shadow='0' size='1.5' font = 'puristaLight' >v1.0</t>";
				//text = "<t align='center' size='1.8' shadow='0' font='PuristaLight'>250</t>";
				colorText[] = {1, 1, 1, 0.5};
			};			
			class NMIB_Crosshair : RscPicture {
				idc = 6633;
				x = "(0.5-(0.0175/2)) * safezoneW + safezoneX";
				y = "(0.5-(0.0175/2)) * safezoneH + safezoneY";
				w = "0.0175 * safezoneW";
				h = "0.0175 * safezoneH";
				style = 2096;
				text = "NerdMods_iBuild\NMIB_Images\NMIB_HUD\iBuild_Crosshair.paa";
				colorText[] =
				{
					"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0.69])",
					"(profilenamespace getvariable ['IGUI_BCG_RGB_G',0.75])",
					"(profilenamespace getvariable ['IGUI_BCG_RGB_B',0.5])",
					0.75
				};
			};			
		};
	};
};