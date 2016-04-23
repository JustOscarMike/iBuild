_ValidPos = false;

_Ghost = _this select 0;
_Plot = _this select 1;
_ModuleCN = _this select 2;

_GhostPosASL = getPosASL _Ghost;
_GhostDir = getDir _Ghost;

_CentreTop = _Ghost modelToWorld [0,1.25,1];
_CentreBottom = _Ghost modelToWorld [0,1.25,-1];
_Floors = [_Ghost,_CentreTop,_CentreBottom,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;

if (count _Floors == 0) then
{
	_NET = _Ghost modelToWorld [2.5,2.5,-0.2]; // LR FB TB
	_NEB = _Ghost modelToWorld [2.5,2.5,-2.8];
	_SET = _Ghost modelToWorld [2.5,-2.5,-0.2];
	_SEB = _Ghost modelToWorld [2.5,-2.5,-2.8];
	_SWT = _Ghost modelToWorld [-2.5,-2.5,-0.2];
	_SWB = _Ghost modelToWorld [-2.5,-2.5,-2.8];
	_NWT = _Ghost modelToWorld [-2.5,2.5,-0.2];
	_NWB = _Ghost modelToWorld [-2.5,2.5,-2.8];

	_NEWalls = [_Ghost, _NET, _NEB,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
	_SEWalls = [_Ghost, _SET, _SEB,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
	_SWWalls = [_Ghost, _SWT, _SWB,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
	_NWWalls = [_Ghost, _NWT, _NWB,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
	
	_ValidPos = switch true do
	{
		case (count _NWWalls != 0 && count _NEWalls != 0) : {true};
		case (count _NEWalls != 0 && count _SEWalls != 0) : {true};
		case (count _SEWalls != 0 && count _SWWalls != 0) : {true};
		case (count _SWWalls != 0 && count _NWWalls != 0) : {true};
		default {false};
	};	

	if (!_ValidPos) then
	{
		_N = _Ghost modelToWorld [0,5,0];
		_E = _Ghost modelToWorld [5,0,0];
		_S = _Ghost modelToWorld [0,-5,0];
		_W = _Ghost modelToWorld [-5,0,0];
		
		_NFloors = [_Ghost,_GhostPosASL, _N,["iBuild_Floor","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
		_EFloors = [_Ghost,_GhostPosASL, _E,["iBuild_Floor","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
		_SFloors = [_Ghost,_GhostPosASL, _S,["iBuild_Floor","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
		_WFloors = [_Ghost,_GhostPosASL, _W,["iBuild_Floor","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
		
		_ValidPos = switch true do
		{
			case (count _NFloors != 0 && count _SFloors != 0) : {true};
			case (count _EFloors != 0 && count _WFloors != 0) : {true};
			case (count _NFloors != 0 && count _EFloors != 0) : {true};
			case (count _EFloors != 0 && count _SFloors != 0) : {true};
			case (count _SFloors != 0 && count _WFloors != 0) : {true};
			case (count _WFloors != 0 && count _NFloors != 0) : {true};
			default {false};
		};
	};
};

_ValidPos;