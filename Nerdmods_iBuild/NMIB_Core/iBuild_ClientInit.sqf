_PlotSize = getNumber (missionConfigFile >> "iBuild_Config" >> "Rules" >> "PlotSize");
_Itemslist = getArray (missionConfigFile >> "iBuild_Config" >> "Misc" >> "Items");

// Declare global vars
NMIB_Enabled = false;
NMIB_BuildProgress = 0;
NMIB_ActionKey1Down = false;
NMIB_PlotSize = if (_PlotSize == 0) then {1;} else {_PlotSize;};

_Itemslist = if (count _Itemslist == 0) then {getArray (configFile >> "CfgPatches" >> "NerdMods_iBuild" >> "iBuild_Items");} else {_Itemslist;};
missionNamespace setVariable ["NMIB_ItemsList",_Itemslist];

// Get & store list of craft-able modules. - Prevents game hanging on dialog load.
{
	_GroupClass = 'iBuild_'+_x;
	
	_List = [];
	{
		_Classname = configName _x;
		_List = _List + [_Classname];
	} forEach ("inheritsFrom _x == (configFile >> 'CfgVehicles' >> _GroupClass)" configClasses (configFile >> "CfgVehicles"));
	uiNamespace setVariable [('UI_'+_GroupClass),_List];
} forEach (getArray (configFile >> "CfgPatches" >> "NerdMods_iBuild" >> "iBuild_Groups"));

[] execVM "Nerdmods_iBuild\NMIB_Controls\iBuild_ControlsInit.sqf";
[] execVM "Nerdmods_iBuild\NMIB_Core\iBuild_PlayerInit.sqf";