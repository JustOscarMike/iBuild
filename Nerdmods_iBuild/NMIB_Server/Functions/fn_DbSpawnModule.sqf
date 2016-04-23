_Plot = _this select 0;
_Data = _this select 1;

// Split array data into classname, position, direction, and variables.
_ClassName = _Data select 0;
_Position = _Data select 1;
_Direction = _Data select 2;

// Create module
_Module = _ClassName createVehicle [0,0,0];
player reveal _Module;
_Module setVectorUp [0,0,1];

// Set variable data on module if any are stored.
if (count _Data > 3) then
{				
	// Get variables list from config for specific module.
	_VarsList = getArray (configFile >> "CfgVehicles" >> _ClassName >> "iBuild_Vars");
	
	// Set variables for the module as required.
	if (count _VarsList != 0) then
	{					
		// Loop through required variable list and set data on module.
		for "_i" from 0 to (count _VarsList)-1 do
		{						
			// Get the variable data from stored array.
			_VarData = ((_Data select 3) select _i);
			
			// Check if variable data is a string.
			if (typeName _VarData == "STRING") then
			{
				// If it's a string, check that it's not an empty string.
				if (_VarData != "") then
				{							
					// Store data on module.
					_Module setVariable [_VarsList select _i,_VarData,true];
				};
			} else {
				// If it's not a string, store the data on module.
				_Module setVariable [_VarsList select _i,_VarData,true];
			};
		};
	};
};

// Set modules position and direction based on type.
if (_Module isKindOf "iBuild_Modules" && !(_Module isKindOf "iBuild_Plot")) then
{
	// Set position and direction of a module.
	_Module setDir (getDir _Plot)-_Direction; // Direction is set relative to plots direction.
	
	_PlotHeightASL = getPosASL _Plot select 2;
	
	_PositionWorld = (_Plot modelToWorld _Position);
	_PositionASL = [_PositionWorld select 0,_PositionWorld select 1,_PlotHeightASL+(_Position select 2)];
	
	_Module setPosASL _PositionASL; // Position is set relative to plots position.
	diag_log str[_Module,(getDir _Plot)-_Direction,_Position,(_Plot modelToWorld _Position)];
} else {
	// Set the position and direction of a plot.
	_Module setPosASL _Position;
	_Module setDir _Direction;
};

_Module;