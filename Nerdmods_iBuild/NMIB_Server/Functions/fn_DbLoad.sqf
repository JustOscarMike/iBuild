// Get database file name based on island and mission.
_DbFile = 'iBuild_' + worldName + '_' + missionName;

// If the above file exists, load it.
if (_DbFile call iniDB_exists) then
{
	// Read the plot count from file.
	_PlotsCount = [_DbFile, "Info", "PlotsCount", "SCALAR"] call iniDB_read;
	
	// Loop through plots from 1 to plots count.
	for "_i" from 1 to _PlotsCount do
	{		
		// Read the plots id.
		_PlotID = [_DbFile, "Info", "Plot"+str _i, "STRING"] call iniDB_read;
		
		// Read plots module count.
		_ModulesCount = [_DbFile, _PlotID, "ObjCount", "SCALAR"] call iniDB_read;		
		
		// Used to store the modules associated plot.
		_Plot = objNull;
		
		// Loop through modules from 1 to modules count.
		for "_i" from 1 to _ModulesCount do
		{			
			// Read modules data from file and store in array.
			_Data = [_DbFile, _PlotID, str _i, "ARRAY"] call iniDB_read;
			
			// Spawn the module with any required data.
			_Module = [_Plot,_Data] call NMIB_fnc_DbSpawnModule;
			
			// Store the plot.
			_Plot = if (_Module isKindOf "iBuild_Plot") then {_Module;} else {_Plot;};
		};
	};
};