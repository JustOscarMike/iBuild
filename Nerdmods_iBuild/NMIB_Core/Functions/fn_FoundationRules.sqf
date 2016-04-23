_Ghost = (_this select 0);
_Plot = (_this select 1);
_GhostPosASL = getPosASL _Ghost;
_PositionFree = true;

_A = _Plot worldToModel _GhostPosASL;
_W = _A select 0;
_L = _A select 1;

if (_W < 0) then {_W = -_W};
if (_L < 0) then {_L = -_L};

_InsidePlotBounds = (_W <= 2.5+5*NMIB_PlotSize+1 && _L <= 2.5+5*NMIB_PlotSize+1);

_PositionFree = _InsidePlotBounds;

if (_InsidePlotBounds) then
{
	//Check for existing foundation
	_Apos = [_GhostPosASL select 0,_GhostPosASL select 1,(_GhostPosASL select 2)+1];
	_Bpos = [_GhostPosASL select 0,_GhostPosASL select 1,(_GhostPosASL select 2)-100];
	_Foundations = [_Ghost,_Apos,_Bpos,["iBuild_Plot"],["iBuild_Floors"]] call NMIB_fnc_ModuleCheck;

	if (count _Foundations == 0) then
	{
		_BlockSize = 5;
		
		_NMIB_DiagDist = (((sqrt 2)*_BlockSize)/2);
		{
			_CornerTop = [(_GhostPosASL select 0)+(_NMIB_DiagDist)*sin((getDir _Ghost)+_x),(_GhostPosASL select 1)+(_NMIB_DiagDist)*cos((getDir _Ghost)+_x),_GhostPosASL select 2];
			_CornerBottom = [_CornerTop select 0,_CornerTop select 1,(_CornerTop select 2)-(((boundingBox _Ghost select 1) select 2)*2)];
			
			_CornerTopHeight = ((ASLToATL _CornerTop) select 2);
			_CornerTopBottom = ((ASLToATL _CornerBottom) select 2);
			
			if (_CornerTopHeight < 0 || _CornerTopBottom > 0) exitWith
			{
				_PositionFree = false;
			};
		} forEach [45,135,225,315];
	} else {
		_PositionFree = false;
	};
};
//if (str(_State) == str(NMIB_StateGood) && NMIB_BuildTime > 0) exitWith {}; // No change detected so skip state update.

_PositionFree