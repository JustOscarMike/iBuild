	_Listbox = (uiNamespace getVariable 'NMIB_Craft_GUI') displayCtrl 1500;
	_Listbox2 = (uiNamespace getVariable 'NMIB_Craft_GUI') displayCtrl 1501;	
	lnbClear _Listbox2;
	
	_GroupName = (_Listbox lnbData [lnbCurSelRow _Listbox,0]);
	_ModuleGroup = (uiNamespace getVariable _GroupName);
	
	{
		if ((getNumber (configFile >> "CfgVehicles" >> (_x select 0) >> "scope")) > 0) then
		{
			_ModuleName = getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");
			_ModuleCraftCount = (_x select 1);
			
			_Id = _Listbox2 lnbAddRow [_ModuleName,str _ModuleCraftCount];
			_Listbox2 lnbSetData [[_Id,0],(_x select 0)];
			_Listbox2 lnbSetData [[_Id,2],str _ModuleCraftCount];
			_Icon = getText (configFile >> "CfgVehicles" >> (_x select 0) >> "iBuild_Picture");
			if (_Icon == "") then {_Icon = "Nerdmods_iBuild\NMIB_Images\iBuild_GUI_Logo.paa"};
			_Listbox2 lnbSetPicture [[_Id, 0], _Icon];
		};
	} forEach _ModuleGroup;