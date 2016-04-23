//_Key = _this select 0;

if (!NMIB_Enabled) then
{
	// Action only available if not in vehicle
	if (vehicle player == player) then
	{
		_Object = cursorTarget;	
		if (isNull _Object) then
		{
			_Object = player;
		} else {	
			_MemoryPoint = getText (configFile >> "CfgVehicles" >> (typeOf _Object) >> "memoryPointSupply");
			_MpPos = _Object modelToWorld (_Object selectionPosition _MemoryPoint);
			_Radius = getNumber (configFile >> "CfgVehicles" >> (typeOf _Object) >> "supplyRadius");

			_MpPos = [_MpPos select 0,_MpPos select 1,0];
			_PlayerPos = [getPos player select 0,getPos player select 1,0];

			if (_PlayerPos distance _MpPos > _Radius) then
			{
				_Object = player;
			};
		};
		
		// First check if player is inside a plot and has recently had access to plot storage.
		_PlotStorage = (missionNamespace getVariable 'NMIB_Workbench');
		if (_Object == player && !isNull _PlotStorage) then
		{			
			// Check if player is inside plot bounds.
			_InsidePlot = [player,NMIB_Plot,NMIB_PlotSize,1] call NMIB_fnc_EntityInsidePlot;
			if (_InsidePlot) then
			{
				_Object = _PlotStorage;
			};
		};	
		
		missionNamespace setVariable ['NMIB_Workbench',_Object];
		createDialog "NMIB_Craft_GUI";		
	};
};