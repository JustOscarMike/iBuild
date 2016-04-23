class CfgPatches
{
	class NerdMods_iBuild
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_UI_F", "A3_Data_F", "A3_UIFonts_F"};
		version = 1.0;
		author = "NerdMod";
		//iBuild_Groups[] = {"Plot","Foundation","Floor","Roof","Wall","Window","Door","Garage","Ladder","Ramp","Step","Misc"};
		//iBuild_Groups[] = {"Plot","Foundation","Floor","Wall","Window","Door","Garage","Ladder"};
		iBuild_Groups[] = {"Plot","Foundation","Floor","Wall","Window","Door","Garage","Ladder"};
		iBuild_Items[] = {"NMIB_PlotLease_Itm","NMIB_WoodPlanks_Itm","NMIB_WoodNails_Itm","NMIB_ScrapMetal_Itm"};
	};
};

class CfgVehicleClasses
{
	class NerdMods_iBuild_A3
	{
		displayName = "iBuild A3 Modules";
	};
};

class CfgVehicles
{
	//class NonStrategic;	// External class reference
	class Strategic;
	class ReammoBox;

	class iBuild_Modules : Strategic
	{
		vehicleClass = "NerdMods_iBuild_A3";
		scope = 0;
		mapSize = 5;
		hiddenSelections[] = {"NMIB_Body","NMIB_PillarL","NMIB_PillarR"};
		icon = "\Nerdmods_iBuild\NMIB_Images\iBuild_Icon";
		iBuild_BuildTime = 1;
		class Eventhandlers {init = "(_this select 0) allowdamage false;";};
	};
	
	class iBuild_Module 		: 	iBuild_Modules {iBuild_Kind = "NMIB_Plot_Workbench";};
	class iBuild_Ghost 			: 	iBuild_Modules {scope = 1;};
	
	class iBuild_Plot 			: 	iBuild_Module {iBuild_Kind = "Man";};
	
	class iBuild_Floors 		: 	iBuild_Module	{};
	class iBuild_Foundation 	: 	iBuild_Floors 	{};
	class iBuild_Floor 			: 	iBuild_Floors 	{};
	
	class iBuild_Roof 			: 	iBuild_Module 	{};
	
	class iBuild_Walls 			: 	iBuild_Module {hiddenSelections[] = {"NMIB_PillarL","NMIB_PillarR"};};
	class iBuild_Wall 			: 	iBuild_Walls {};
	class iBuild_Window 		: 	iBuild_Walls {};
	class iBuild_Door 			: 	iBuild_Walls {};
	class iBuild_Garage 		: 	iBuild_Walls {};
	
	class iBuild_Elevation 		: 	iBuild_Module {};
	class iBuild_Ladder 		: 	iBuild_Elevation {};
	class iBuild_Ramp 			: 	iBuild_Elevation {};
	class iBuild_Step 			: 	iBuild_Elevation {};
	
	class iBuild_Misc 			: 	iBuild_Module {};
///////////////////////////////////////////////////////////////////////////////////////////////////////
	#include "NMIB_Models\NMIB_Plots\NMIB_Plots.hpp"
	#include "NMIB_Models\NMIB_Foundations\NMIB_Foundations.hpp"
	#include "NMIB_Models\NMIB_Floors\NMIB_Floors.hpp"
	#include "NMIB_Models\NMIB_Ladders\NMIB_Ladders.hpp"
	#include "NMIB_Models\NMIB_Walls\NMIB_Walls.hpp"
	#include "NMIB_Models\NMIB_Windows\NMIB_Windows.hpp"
	#include "NMIB_Models\NMIB_Doors\NMIB_Doors.hpp"
	#include "NMIB_Models\NMIB_Garages\NMIB_Garages.hpp"
	#include "NMIB_Models\NMIB_Objects\NMIB_Objects.hpp"
///////////////////////////////////////////////////////////////////////////////////////////////////////		
};

class CfgWeapons
{
	#include "NMIB_Items\NMIB_Items.hpp"
};

class CfgSounds
{
	// List of sounds (.ogg files without the .ogg extension)
	sounds[] = {DoorOpen,GarageOpen,DoorClose,DoorLock,DoorLocked,Ham0,Ham1,Ham2,Built0,Abort0};

	// Definition for each sound
	class DoorOpen
	{
		name = "DoorOpen"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\DoorOpen.ogg, 1, 0.9, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	// Definition for each sound
	class GarageOpen
	{
		name = "GarageOpen"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\GarageOpen.ogg, 1, 0.9, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};	
	// Definition for each sound
	class DoorClose
	{
		name = "DoorClose"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\DoorClose.ogg, 0.4, 0.7, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	// Definition for each sound
	class DoorLock
	{
		name = "DoorLock"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\DoorLock.ogg, 0.2, 1, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	// Definition for each sound
	class DoorLocked
	{
		name = "DoorLocked"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\DoorLocked.ogg, 0.5, 1.2, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	// Definition for each sound
	class Ham0
	{
		name = "Ham0"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\Ham0.ogg, 1, 0.9, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	// Definition for each sound
	class Ham1
	{
		name = "Ham1"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\Ham1.ogg, 1, 0.9, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	// Definition for each sound
	class Ham2
	{
		name = "Ham2"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\Ham2.ogg, 1, 0.9, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	// Definition for each sound
	class Built0
	{
		name = "Built0"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\Built0.ogg, 1, 1, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	class Built1
	{
		name = "Built1"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\Built1.ogg, 1, 1, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	class Built2
	{
		name = "Built2"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\Built2.ogg, 1, 1, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};
	
	// Definition for each sound
	class Abort0
	{
		name = "Abort0"; // Name for mission editor
		sound[] = {\NerdMods_iBuild\NMIB_Sounds\Abort0.ogg, 1, 1, 175}; // {filname, volume, pitch, fade}
		titles[] = {};
	};		
};

#include "NMIB_FunctionsInit.hpp"

#include "NMIB_Guis\NMIB_Setup_GUI.hpp"

#include "NMIB_Guis\NMIB_Craft_GUI.hpp"

#include "NMIB_Guis\NMIB_Keypad_GUI.hpp"

#include "NMIB_HUDs\NMIB_Main_HUD.hpp"