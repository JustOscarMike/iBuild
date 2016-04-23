_Ghost = _this select 0;
_Plot = _this select 1;
_SnapDist = _this select 2;
_GridDist = _this select 3;
_ClassName = _this select 4;
_PlotDir = getDir _Plot;

_CrossHairPASL = (positionCameraToWorld [0,0,_SnapDist]);
if !(surfaceIsWater _CrossHairPASL) then {_CrossHairPASL = ATLToASL _CrossHairPASL};
if (_CrossHairPASL select 2 < getPosASL player select 2) then {_CrossHairPASL set [2,getPosASL player select 2]};

_GridPositions = [NMIB_IP,[NMIB_IP select 0,NMIB_IP select 1,(NMIB_IP select 2)-3],[NMIB_IP select 0,NMIB_IP select 1,(NMIB_IP select 2)+3]];

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
};

_Ghost setPosASL _NMP_NearestBlock;