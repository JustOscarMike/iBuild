_Object = _this select 0;

_Object addAction ["<t color='#FF974D'>Relocate Workbench</t>", {_this call NMIB_fnc_EnableiBuild;}, nil,0,false,true,"","(missionNamespace getVariable 'NMIB_Workbench') == (position player) nearestObject 'NMIB_Plot_Workbench';"];

_Object addAction ["<t color='#FF974D'>Save Structures</t>", {call NMIB_fnc_DbSave;}, nil,0,false,true,"","(missionNamespace getVariable 'NMIB_Workbench') == (position player) nearestObject 'NMIB_Plot_Workbench';"];