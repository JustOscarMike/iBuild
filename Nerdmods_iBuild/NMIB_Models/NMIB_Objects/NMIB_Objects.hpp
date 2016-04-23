class NMIB_Plot_Workbench : ReammoBox
{
	vehicleClass = "NerdMods_iBuild_A3";		
	mapSize = 5;				
	supplyRadius = 2;
	memoryPointSupply = "doplnovani";
	scope = 2;
	displayName = "Plot Workbench";
	icon = "\Nerdmods_iBuild\NMIB_Images\iBuild_Icon";
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Objects\NMIB_Workbench.p3d";
	author = "NerdMod";
	
	maximumLoad = 10000;
	transportMaxWeapons = 10000;
	transportMaxMagazines = 10000;
	
	class TransportMagazines {};
	
	class TransportWeapons {};
	
	class TransportItems
	{
		class _xx_NMIB_PlotLease_Itm
		{
			name = "NMIB_PlotLease_Itm";
			count = 5;
		};		
		class _xx_NMIB_ScrapMetal_Itm
		{
			name = "NMIB_ScrapMetal_Itm";
			count = 1000;
		};			
		class _xx_NMIB_WoodNails_Itm
		{
			name = "NMIB_WoodNails_Itm";
			count = 1000;
		};
		class _xx_NMIB_WoodPlanks_Itm
		{
			name = "NMIB_WoodPlanks_Itm";
			count = 1000;
		};
	};
	
	class Eventhandlers
	{
/* 		init = "(_this select 0) allowdamage false;(_this select 0) addAction [""<t color='#FF974D'>Relocate Workbench</t>"", {_this call NMIB_fnc_EnableiBuild;}, nil,0,false,true,"""",""(missionNamespace getVariable 'NMIB_Workbench') == (position player) nearestObject 'NMIB_Plot_Workbench';""];"; */
		init = "(_this select 0) allowdamage false;[(_this select 0)] execVM ""Nerdmods_iBuild\NMIB_Models\NMIB_Objects\Scripts\NMIB_WbActions.sqf"";";
	};		
};

class NMIB_Plot_Workbench_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Workbench Ghost";
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Objects\NMIB_Workbench_Ghost.p3d";
};