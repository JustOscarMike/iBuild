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
_SBLBP = _Ghost modelToWorld [-1.25,-1,-3];
_SBRTP = _Ghost modelToWorld [1.25,-1,0];
_SBRBP = _Ghost modelToWorld [1.25,-1,-3];
_Objs1 = [_Ghost, _SBLTP, _SBLBP,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
_Objs2 = [_Ghost, _SBRTP, _SBRBP,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;

_SFLTP = _Ghost modelToWorld [-1.25,1,0];
_SFLBP = _Ghost modelToWorld [-1.25,1,-3];
_SFRTP = _Ghost modelToWorld [1.25,1,0];
_SFRBP = _Ghost modelToWorld [1.25,1,-3];
_Objs3 = [_Ghost, _SFLTP, _SFLBP,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
_Objs4 = [_Ghost, _SFRTP, _SFRBP,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;

_LeftTop = _Ghost modelToWorld [-2.5,0,0];
_LeftBottom = _Ghost modelToWorld [-2.5,0,-1.6];
_RightTop = _Ghost modelToWorld [2.5,0,0];
_RightBottom = _Ghost modelToWorld [2.5,0,-1.6];
_Objs5 = [_Ghost, _LeftTop, _LeftBottom,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
_Objs6 = [_Ghost, _RightTop, _RightBottom,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;

if (count _Objs1 != 0 && count _Objs2 != 0 || count _Objs3 != 0 && count _Objs4 != 0 || count _Objs5 != 0 && count _Objs6 != 0) then
{
	_CentreTop = _Ghost modelToWorld [0,0,1.4];
	_CentreBottom = _Ghost modelToWorld [0,0,-1.4];
	
	_Walls = [_Ghost, _CentreTop, _CentreBottom,["iBuild_Walls"],["iBuild_Door"]] call NMIB_fnc_ModuleCheck;
	_HasDoor = (count _Walls > 1);
	
 	if (!_HasDoor) then
	{
		NMIB_ReplaceModule = _Walls select 0;

		_LeftTop = _Ghost modelToWorld [-2.5,0,1.4];
		_LeftBottom = _Ghost modelToWorld [-2.5,0,-1.4];
		
		_Pillars = [_Ghost, _LeftTop, _LeftBottom,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
		_PillarsLeft = (count _Pillars != 0);
		
		_RightTop = _Ghost modelToWorld [2.5,0,1.4];
		_RightBottom = _Ghost modelToWorld [2.5,0,-1.4];

		_Pillars = [_Ghost, _RightTop, _RightBottom,["iBuild_Walls"]] call NMIB_fnc_ModuleCheck;
		_PillarsRight = (count _Pillars != 0);
		
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