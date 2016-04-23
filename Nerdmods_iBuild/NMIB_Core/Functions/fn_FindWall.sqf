private ["_Return"];
_Return = [];

_Ghost = (_this select 0);
_ValidKinds = _this select 1;
_InvalidKinds = if (count _this > 2) then {_this select 2} else {[]};
_HeightAdjust = if (count _this > 3) then {_this select 3} else {0};

_LeftTop = _Ghost modelToWorld [-2.5,0,1.4+_HeightAdjust];
_LeftBottom = _Ghost modelToWorld [-2.5,0,-1.4+_HeightAdjust];
_RightTop = _Ghost modelToWorld [2.5,0,1.4+_HeightAdjust];
_RightBottom = _Ghost modelToWorld [2.5,0,-1.4+_HeightAdjust];

_LeftObjs = lineIntersectsWith [ATLToASL _LeftTop, ATLToASL _LeftBottom, player, _Ghost, true];
_RightObjs = lineIntersectsWith [ATLToASL _RightTop, ATLToASL _RightBottom, player, _Ghost, true];

{
	_Obj = _x;
	
	_AtCurrentPos = (_Obj in _RightObjs);
	
	if (_AtCurrentPos) exitWith
	{
		_ValidType = ({_Obj isKindOf _x} count _ValidKinds) > 0;
		_InvalidType = ({_Obj isKindOf _x} count _InvalidKinds) > 0;
		
		if (_ValidType) then {_Return = _Return + [_Obj]};
		if (_InvalidType) then {_Return = _Return + [_Obj]};
	};
} forEach _LeftObjs;

_Return;