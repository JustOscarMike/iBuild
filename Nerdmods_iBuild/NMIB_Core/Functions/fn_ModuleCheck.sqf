private ["_Return"];

_Ghost = (_this select 0);
_StartPos = if (surfaceIsWater (_this select 1)) then {(_this select 1);} else {ATLToASL (_this select 1);};
_EndPos = if (surfaceIsWater (_this select 2)) then {(_this select 2);} else {ATLToASL (_this select 2);};
_ValidKinds = _this select 3;
_InvalidKinds = if (count _this > 4) then {_this select 4} else {[]};
_Return = [];

_IntersectedObjs = lineIntersectsWith [_StartPos, _EndPos, player, _Ghost, true];

if (count _IntersectedObjs != 0) then
{
/* 	_Obj = (_IntersectedObjs select (count _IntersectedObjs)-1);

	_ValidType = ({_Obj isKindOf _x} count _ValidKinds) > 0;
	_InvalidType = ({_Obj isKindOf _x} count _InvalidKinds) > 0;

	if (_ValidType) then {_Return = _Return + [_Obj]};
	if (_InvalidType) then {_Return = _Return + [_Obj]}; */
	
	{
		if (count _Return == 2) exitWith {};
		
		_Obj = _x;
		
		_ValidType = ({_Obj isKindOf _x} count _ValidKinds) > 0;
		_InvalidType = ({_Obj isKindOf _x} count _InvalidKinds) > 0;

		if (_ValidType) then {_Return = _Return + [_Obj]};
		if (_InvalidType) then {_Return = _Return + [_Obj]};				
	} forEach _IntersectedObjs;
};

_Return;