_Ghost = _this select 0;
_Plot = _this select 1;
_SnapDist = _this select 2;
_GridDist = _this select 3;
_ClassName = _this select 4;
_PlotDir = getDir _Plot;

_CrossHairPASL = (positionCameraToWorld [0,0,_SnapDist]);
if !(surfaceIsWater _CrossHairPASL) then {_CrossHairPASL = ATLToASL _CrossHairPASL};
if (_CrossHairPASL select 2 < getPosASL player select 2) then {_CrossHairPASL set [2,getPosASL player select 2]};

// Calculate grid positions by using plot position as the central grid position
_FloorGridPositions = [];
_FloorWorldPositions = [];
for "_a" from -(5*NMIB_PlotSize) to (5*NMIB_PlotSize) step (5) do
{
	for "_b" from -(5*NMIB_PlotSize) to (5*NMIB_PlotSize) step (5) do
	{
		_FloorGridPositions = _FloorGridPositions + [[_a,_b,0]];
		_FloorWorldPositions = _FloorWorldPositions + [ATLToASL (_Plot modelToWorld [_a,_b,0])];
	};
};

_WallGridPositions = [];
_WallWorldPositions = [];
{
	_FloorGridPos = _x;
	_North = [(_FloorGridPos select 0),(_FloorGridPos select 1)+2.5,(_FloorGridPos select 2)];
	_East = [(_FloorGridPos select 0)+2.5,(_FloorGridPos select 1),(_FloorGridPos select 2)];
	_South = [(_FloorGridPos select 0),(_FloorGridPos select 1)-2.5,(_FloorGridPos select 2)];
	_West = [(_FloorGridPos select 0)-2.5,(_FloorGridPos select 1),(_FloorGridPos select 2)];	
	_WallGridPositions = _WallGridPositions + [_North,_East,_South,_West];
	
	_NorthWorld = _Plot modelToWorld _North;
	_EastWorld = _Plot modelToWorld _East;
	_SouthWorld = _Plot modelToWorld _South;
	_WestWorld = _Plot modelToWorld _West;
	_WallWorldPositions = _WallWorldPositions + [ATLToASL _NorthWorld,ATLToASL _EastWorld,ATLToASL _SouthWorld,ATLToASL _WestWorld];	
} forEach _FloorGridPositions;

_NearestWorldPos = [];
_NearestGrisPos = [];
if (_ClassName isKindOf "iBuild_Walls") then
{
 	_NearestWorldPos = [_WallWorldPositions,_CrossHairPASL] call BIS_fnc_nearestPosition;
	_NearestGridPos = _WallGridPositions select (_WallWorldPositions find _NearestWorldPos);
	
 	_Id = (_WallWorldPositions find _NearestWorldPos);

	for "_i" from 3 to (count _FloorGridPositions)-1 step 4 do
	{
		if (_Id == _i-3) exitWith {_Ghost setDir _PlotDir;systemChat "North"};
		if (_Id == _i-2) exitWith {_Ghost setDir _PlotDir+90;systemChat "East"};
		if (_Id == _i-1) exitWith {_Ghost setDir _PlotDir+180;systemChat "South"};
		if (_Id == _i) exitWith {_Ghost setDir _PlotDir-90;systemChat "West"};		
	};
} else {
	_NearestWorldPos = [_FloorWorldPositions,_CrossHairPASL] call BIS_fnc_nearestPosition;
	_NearestGridPos = _FloorGridPositions select (_FloorWorldPositions find _NearestWorldPos);
};

_Ghost setPosASL _NearestWorldPos;

/* _GridPositions = [NMIB_IP,[NMIB_IP select 0,NMIB_IP select 1,(NMIB_IP select 2)-3],[NMIB_IP select 0,NMIB_IP select 1,(NMIB_IP select 2)+3]];

{
	_Position = [(NMIB_IP select 0)+(_GridDist)*sin(_PlotDir+_x),(NMIB_IP select 1)+(_GridDist)*cos(_PlotDir+_x),NMIB_IP select 2];
	_GridPositions = _GridPositions + [_Position];
} forEach [0,90,180,270];

_NMP_NearestBlock = switch (true) do
{
	case (_ClassName isKindOf "iBuild_Walls") : {[_GridPositions,[getpos player select 0,getpos player select 1,_CrossHairPASL select 2]] call BIS_fnc_nearestPosition};
	case (_ClassName isKindOf "NMIB_Plot_Workbench") : {[_GridPositions,[getpos player select 0,getpos player select 1,_CrossHairPASL select 2]] call BIS_fnc_nearestPosition};
	default {[_GridPositions,_CrossHairPASL] call BIS_fnc_nearestPosition};
};

NMIB_IP = _NMP_NearestBlock;

if (_ClassName isKindOf "NMIB_Plot_Workbench") then {_GridDist = _GridDist - 1.25};
if (_ClassName isKindOf "iBuild_Walls" || _ClassName isKindOf "NMIB_Plot_Workbench") then
{
	_GridPositions = [];
	{
		_Position = [(_NMP_NearestBlock select 0)+(_GridDist/2)*sin(_PlotDir+_x),(_NMP_NearestBlock select 1)+(_GridDist/2)*cos(_PlotDir+_x),_NMP_NearestBlock select 2];
		_GridPositions = _GridPositions + [_Position];
	} forEach [0,90,180,270];
	_NMP_NearestBlock = [_GridPositions,_CrossHairPASL] call BIS_fnc_nearestPosition;

	if (_GridPositions find _NMP_NearestBlock == 0) then {_Ghost setDir _PlotDir;};
	if (_GridPositions find _NMP_NearestBlock == 1) then {_Ghost setDir _PlotDir+90;};
	if (_GridPositions find _NMP_NearestBlock == 2) then {_Ghost setDir _PlotDir+180;};
	if (_GridPositions find _NMP_NearestBlock == 3) then {_Ghost setDir _PlotDir+270;};
} else {
	_Ghost setDir _PlotDir;
}; */