_Plot = _this select 0;
_Module = _this select 1;

_PlotPosASL = getPosASL _Plot;
_ModulePosASL = getPosASL _Module;

_Position = if (_Module isKindOf "iBuild_Walls" || _Module isKindOf "iBuild_Floors" || _Module isKindOf "iBuild_Elevation") then
{
	// Calculate grid positions by using plot as the central grid position
	_FloorGridPositions = [];
	_FloorWorldPositions = [];
	for "_a" from -(5*NMIB_PlotSize) to (5*NMIB_PlotSize) step (5) do
	{
		for "_b" from -(5*NMIB_PlotSize) to (5*NMIB_PlotSize) step (5) do
		{
			for "_c" from 0 to (3*3) step (3) do
			{
				_Zasl = if (_c == 0) then {(_PlotPosASL select 2);} else {(_PlotPosASL select 2)+_c;};
				
				if (_Module isKindOf "iBuild_Walls") then
				{
					_North = [_a,_b+2.5,_c];
					_East = [_a+2.5,_b,_c];
					_South = [_a,_b-2.5,_c];
					_West = [_a-2.5,_b,_c];	
					_FloorGridPositions = _FloorGridPositions + [_North,_East,_South,_West];
					
					_NorthWorld = _Plot modelToWorld _North;
					_EastWorld = _Plot modelToWorld _East;
					_SouthWorld = _Plot modelToWorld _South;
					_WestWorld = _Plot modelToWorld _West;					
					
					_NorthWorld = [_NorthWorld select 0,_NorthWorld select 1,_Zasl];
					_EastWorld = [_EastWorld select 0,_EastWorld select 1,_Zasl];
					_SouthWorld = [_SouthWorld select 0,_SouthWorld select 1,_Zasl];
					_WestWorld = [_WestWorld select 0,_WestWorld select 1,_Zasl];
					
					_FloorWorldPositions = _FloorWorldPositions + [_NorthWorld,_EastWorld,_SouthWorld,_WestWorld];
				} else {
					_FloorGridPositions = _FloorGridPositions + [[_a,_b,_c]];
					
					_WorldPosASL = (_Plot modelToWorld [_a,_b,_c]);
					_WorldPosASL = [_WorldPosASL select 0,_WorldPosASL select 1,_Zasl];
					_FloorWorldPositions = _FloorWorldPositions + [_WorldPosASL];
				};
			};
		};
	};
	
 	_NearestWorldPos = [_FloorWorldPositions,getPosASL _Module] call BIS_fnc_nearestPosition;
	_FloorGridPositions select (_FloorWorldPositions find _NearestWorldPos);	
} else {	
	getPosASL _Module;
};

//_Position = _FixedPos + [_Position select 2];
_Position;