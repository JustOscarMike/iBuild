_Listbox = (uiNamespace getVariable 'NMIB_Craft_GUI') displayCtrl 1500;
_Listbox2 = (uiNamespace getVariable 'NMIB_Craft_GUI') displayCtrl 1501;

_ListboxSel = lnbCurSelRow _Listbox;

lnbClear _Listbox;
lnbClear _Listbox2;

{	
	_GroupClass = 'iBuild_'+_x;
	_Kind = getText (configFile >> "CfgVehicles" >> _GroupClass >> "iBuild_Kind");
	if ((missionNamespace getVariable 'NMIB_Workbench') isKindOf _Kind) then
	{				
		_Modules = [];		
		
		{
			_ModuleCN = _x;
			
			_CraftableCount = [_ModuleCN,(missionNamespace getVariable 'NMIB_Workbench')] call NMIB_fnc_CraftableCount;
			_Modules = _Modules + [[_ModuleCN,_CraftableCount]];
		} forEach (uiNamespace getVariable ('UI_'+_GroupClass));
		
		uiNamespace setVariable [_GroupClass,_Modules];
		_Id = _Listbox lnbAddRow [_x+'s',str(count _Modules)];
		_Listbox lnbSetData [[_Id,0],_GroupClass];
		_Listbox lnbSetPicture [[_Id, 0], "Nerdmods_iBuild\NMIB_Images\iBuild_GUI_Logo.paa"];	
	};
} forEach (getArray (configFile >> "CfgPatches" >> "NerdMods_iBuild" >> "iBuild_Groups"));

_Listbox lnbSetCurSelRow _ListboxSel;

(missionNamespace getVariable 'NMIB_Workbench') spawn
{
	_Items = getItemCargo _this;
	
	// Wait until cargo items have changed
	waitUntil {str(getItemCargo _this) != str(_Items) || !dialog};

	// If dialog is still open, cargo items have changed, so refresh craftable modules.
	if (dialog) then {disableSerialization;call NMIB_fnc_CraftLoad};
};