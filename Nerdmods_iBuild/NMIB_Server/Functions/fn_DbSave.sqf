_StartTime = time;

_DbFile = 'iBuild_' + worldName + '_' + missionName;

systemChat format["iBuild: Saving database to [%1]",_DbFile];

if (_DbFile call iniDB_exists) then
{
	_DbFile call iniDB_delete;
};

{
	_Plot = _x;
	_PlotID = [_Plot] call NMIB_fnc_DbPlotId;

	_ModuleClassName = typeOf _Plot;
	_Dir = getDir _Plot;
	_Position = getPosASL _Plot;
	_Data = [_ModuleClassName,_Position,_Dir];
	
	_PlotsCount = [_DbFile, "Info", "PlotsCount", "SCALAR"] call iniDB_read;
	[_DbFile, "Info", "PlotsCount", str(_PlotsCount+1)] call iniDB_write;
	[_DbFile, "Info", "Plot"+str(_PlotsCount+1), _PlotID] call iniDB_write;
	
	[_DbFile, _PlotID, "ObjCount", 1] call iniDB_write;
	[_DbFile, _PlotID, "1", [typeOf _Plot,getPosASL _Plot,getDir _Plot], "ARRAY"] call iniDB_write;
	
	systemChat format['Saved Plot: %1',_PlotID];
} forEach (allMissionObjects "iBuild_Plot");

{
	_Module = _x;
	
	if !(_Module isKindOf "iBuild_Plot") then
	{
		if (_Module isKindOf "iBuild_Module" || _Module isKindOf "NMIB_Plot_Workbench") then
		{
			_Plot = [_Module] call NMIB_fnc_DbGetPlot;
			_PlotID = [_Plot] call NMIB_fnc_DbPlotId;
			
			_ModuleCount = [_DbFile, _PlotID, 'ObjCount', "SCALAR"] call iniDB_read;
			_ModuleCount = _ModuleCount + 1;
			[_DbFile, _PlotID, "ObjCount", str _ModuleCount] call iniDB_write;				
			
			_Dir = [_Plot,_Module] call NMIB_fnc_DbGetDir;
			
			_Position = [_Plot,_Module] call NMIB_fnc_DbGetPos;
			_Data = [typeOf _Module,_Position,_Dir];
			
			_VarsArray = [_Module] call NMIB_fnc_DbGetVars;
			_Data = _Data + [_VarsArray];
			
			[_DbFile, _PlotID, str _ModuleCount, _Data, "ARRAY"] call iniDB_write;
			
			systemChat format['Saved Module: %1',_Module];
		};	
	};
} forEach (allMissionObjects "All");

systemChat format["iBuild: Database Saved %1",time-_StartTime];