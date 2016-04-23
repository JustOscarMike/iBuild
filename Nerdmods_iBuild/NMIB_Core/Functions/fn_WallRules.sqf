_Ghost = _this select 0;
_Plot = _this select 1;
_ModuleCN = _this select 2;

_String = toArray(toUpper(_ModuleCN));
_String resize (count _String - 1);
_ModuleCN = toString(_String);

_GhostPosASL = getPosASL _Ghost;
_GhostDir = getDir _Ghost;

_GhostA = _ModuleCN + "A";
_GhostB = _ModuleCN + "B";
_GhostC = _ModuleCN + "C";
_GhostD = _ModuleCN + "D";
_WallState = [_GhostA,false,[1,1]];

_SBLTP = _Ghost modelToWorld [-1.25,-1,0];
_SBLBP = _Ghost modelToWorld [-1.25,-1,-1.5];
_SBRTP = _Ghost modelToWorld [1.25,-1,0];
_SBRBP = _Ghost modelToWorld [1.25,-1,-1.5];
_Objs1 = [_Ghost, _SBLTP, _SBLBP,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
_Objs2 = [_Ghost, _SBRTP, _SBRBP,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;

_SFLTP = _Ghost modelToWorld [-1.25,1,0];
_SFLBP = _Ghost modelToWorld [-1.25,1,-1.5];
_SFRTP = _Ghost modelToWorld [1.25,1,0];
_SFRBP = _Ghost modelToWorld [1.25,1,-1.5];
_Objs3 = [_Ghost, _SFLTP, _SFLBP,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
_Objs4 = [_Ghost, _SFRTP, _SFRBP,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;

_Wall = [_Ghost,["iBuild_Walls"],[],-3] call NMIB_fnc_FindWall;

if (count _Objs1 != 0 && count _Objs2 != 0 || count _Objs3 != 0 && count _Objs4 != 0 || count _Wall != 0) then
{
	_Walls = [_Ghost,["iBuild_Walls"],[_GhostA,_GhostB,_GhostC,_GhostD]] call NMIB_fnc_FindWall;
	_SameWallExists = (count _Walls > 1);
	
	if (!_SameWallExists) then
	{
		NMIB_ReplaceModule = if (count _Walls != 0) then {_Walls select 0;} else {NMIB_ReplaceModule};
		
		_LeftTop = _Ghost modelToWorld [-2.5,0,1.3];
		_LeftBottom = _Ghost modelToWorld [-2.5,0,-1.3];
		
		_PillarsL = [_Ghost, _LeftTop, _LeftBottom,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
		_PillarsLeft = (count _PillarsL != 0);
		
		_RightTop = _Ghost modelToWorld [2.5,0,1.3];
		_RightBottom = _Ghost modelToWorld [2.5,0,-1.3];

		_PillarsR = [_Ghost, _RightTop, _RightBottom,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
		_PillarsRight = (count _PillarsR != 0);
		
 		_WallState = switch true do
		{
			case (!_PillarsLeft && !_PillarsRight): // no pillar left, no pillar right
			{
				//A
				[_GhostA,true,[1,1]];			
			};
			case (_PillarsLeft && !_PillarsRight): // pillar left, no pillar right
			{
				//B
				[_GhostB,true,[0,1]];			
			};
			case (!_PillarsLeft && _PillarsRight): // no pillar left, pillar right
			{
				//C
				[_GhostC,true,[1,0]];			
			};
			case (_PillarsLeft && _PillarsRight): // pillar left, pillar right
			{
				//D
				[_GhostD,true,[0,0]];
			};
		};
	};
};

_WallState