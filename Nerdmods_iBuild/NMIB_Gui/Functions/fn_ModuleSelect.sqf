_Listbox = (uiNamespace getVariable 'NMIB_Craft_GUI') displayCtrl 1500;
_Listbox2 = (uiNamespace getVariable 'NMIB_Craft_GUI') displayCtrl 1501;

if (parseNumber((_this select 0) lnbData [lnbCurSelRow (_this select 0),2]) > 0) then
{
	_RequiredItems = getArray (configFile >> "CfgVehicles" >> ((_this select 0) lnbData [lnbCurSelRow (_this select 0),0]) >> "iBuild_ReqItems"); // Get required module items
	
	[(missionNamespace getVariable 'NMIB_Workbench'),_RequiredItems] call NMIB_fnc_RemoveItems;

	closeDialog 0;
	//null = [(_Listbox2 lnbData [lnbCurSelRow _Listbox2,0])] execVM 'Nerdmods_iBuild\NMIB_Scripts\NMIB_Actions\NMIB_PlaceObject.sqf';
	[(_Listbox2 lnbData [lnbCurSelRow _Listbox2,0]),_BuildTime] call NMIB_fnc_EnableiBuild;
};