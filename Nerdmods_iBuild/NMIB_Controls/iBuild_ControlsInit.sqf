waitUntil {!isNull (findDisplay 46)};

[] call NMIB_fnc_MapKeys;

(findDisplay 46) displayAddEventHandler ["KeyUp","
	_Return = _this call NMIB_fnc_KeyUp;
	_Return
"];

/* (findDisplay 46) displayAddEventHandler ["KeyDown","
	
	_Key = (_this select 1);	
	
	if (_Key == 1 && NMIB_Enabled) then
	{
		NMIB_Enabled = false;
		[NMIB_ClassName] call NMIB_fnc_RestoreItems;
		true
	};
"]; */