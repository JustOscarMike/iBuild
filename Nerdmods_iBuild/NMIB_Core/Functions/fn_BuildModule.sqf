if (!NMIB_ActionKey1Down) then
{
	[] spawn
	{
		_BuildTime = getNumber (configFile >> "CfgVehicles" >> NMIB_ClassName >> "iBuild_BuildTime"); // Get required module items
		_AdditionalTime = if (str NMIB_State in [str NMIB_StateReplace]) then {3;} else {1;};
		_BuildTime = if (_BuildTime == 0) then {1;} else {_BuildTime*_AdditionalTime;};

		_Progress = 0;			
		_Amount = 1/32;
		while {NMIB_ActionKey1Down && _Progress <= _BuildTime} do
		{
			sleep _Amount;
			_Progress = _Progress + _Amount;
			NMIB_BuildProgress = (_Progress / _BuildTime * 100)-(_Progress / _BuildTime * 100)%1;
		};
		NMIB_BuildProgress = 0;
	};
};		

if (NMIB_BuildProgress == 100) then
{
	if (isNil 'NMIB_RelocateObj') then
	{
		_ModuleCN = NMIB_ClassName;
		_Dir = getDir NMIB_ModuleGhost;
		
		if (!isNull NMIB_ReplaceModule) then
		{
			if (_ModuleCN isKindOf "iBuild_Walls") then
			{
				_ReplaceCN = toArray(typeOf NMIB_ReplaceModule);
				_ID = (count _ReplaceCN)-1;
				_Type = (_ReplaceCN select _ID);
				
				_Types = [toArray("B") select 0,toArray("C") select 0];
				
				_GhostDir = getDir NMIB_ModuleGhost - getDir NMIB_ModuleGhost % 1;
				_ReplaceDir = getDir NMIB_ReplaceModule - getDir NMIB_ReplaceModule % 1;
				_Dif = (_ReplaceDir - _GhostDir) % 360;
				if (_Dif < 0) then {_Dif = -_Dif};
				_Flip = (_Dif != 0);
				
				if (_Type in _Types && _Flip) then {_Type = (_Types - [_Type]) select 0};
				
				_NewModuleCN = toArray(_ModuleCN);
				_NewModuleCN set [(count _NewModuleCN)-1,_Type];
				_ModuleCN = toString(_NewModuleCN);
			};
			deleteVehicle NMIB_ReplaceModule;
		};
		
		_Module = _ModuleCN createVehicle [position player select 0,position player select 1,-100];
		player reveal _Module;
		_Module setVectorUp [0,0,1];		
		_Module setPosASL (getPosASL NMIB_ModuleGhost);
		_Module setDir _Dir;

		if (_ModuleCN isKindOf "iBuild_Plot") then
		{
			NMIB_Enabled = false;
			_Position = [(getPos player select 0)+(1)*sin(getDir player),(getPos player select 1)+(1)*cos(getDir player),0];
			_Obj = "NMIB_Plot_Workbench" createVehicle _Position;
			player reveal _Obj;
			_Obj setDir (getDir player);
			_Obj setPosATL _Position;
		} else {
			_CraftableCount = [_ModuleCN,(missionNamespace getVariable 'NMIB_Workbench')] call NMIB_fnc_CraftableCount;
			if (_CraftableCount == 0) then
			{
				NMIB_Enabled = false;
			} else {
				_RequiredItems = getArray (configFile >> "CfgVehicles" >> _ModuleCN >> "iBuild_ReqItems");
				[(missionNamespace getVariable 'NMIB_Workbench'),_RequiredItems] call NMIB_fnc_RemoveItems;
			};
		};
	} else {
		NMIB_RelocateObj setDir (getDir NMIB_ModuleGhost);
		NMIB_RelocateObj setPosASL (getPosASL NMIB_ModuleGhost);
		NMIB_Enabled = false;
	};
};		