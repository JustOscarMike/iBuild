_ValidPos = false;

_Ghost = _this select 0;
_Plot = _this select 1;
_ModuleCN = _this select 2;

_CentreTop = _Ghost modelToWorld [0,-2,2];
_CentreBottom = _Ghost modelToWorld [0,-2,0];
_Floors = [_Ghost, _CentreTop, _CentreBottom,["iBuild_Floors","iBuild_Elevation"],[_ModuleCN]] call NMIB_fnc_ModuleCheck;

_HasFloor = (count _Floors > 0);
_HasElevation = (count _Floors > 1);

if (_HasFloor && !_HasElevation) then
{
	NMIB_ReplaceModule = _Floors select 0;
	
	_ValidPos = true;
};

_ValidPos;