_HostObject = (_this select 0);
_PaddingA = (_this select 1);
_PaddingB = (_this select 2);
_NearestObjects = (_this select 3);
_CollisionDetected = false;

_Bounds = [_HostObject,_PaddingA] call NMIB_fnc_GetBounds;
_ANE = _Bounds select 0;
_ASE = _Bounds select 1;
_ANW = _Bounds select 2;
_ASW = _Bounds select 3;
_AmaxWidth = _Bounds select 4;
_AmaxLength = _Bounds select 5;
_AmaxHeight = _Bounds select 6;

///////////////////////////////////////////////////////////////////////////////////////////////
{
	_nObject = _x;
	
	_Padding = switch (_nObject isKindOf 'iBuild_Plot') do
	{
		case (true): {(5*NMIB_PlotSize)+5};
		case (false): {_PaddingB};
	};
	
 	_Bounds = [_nObject,_Padding] call NMIB_fnc_GetBounds;
	_BNE = _Bounds select 0;
	_BSE = _Bounds select 1;
	_BNW = _Bounds select 2;
	_BSW = _Bounds select 3;	
	_BmaxWidth = _Bounds select 4;
	_BmaxLength = _Bounds select 5;
	_BmaxHeight = _Bounds select 6;
	
/* 	_a = [_ANE,_ASE,_ANW,_ASW,_BNE,_BSE,_BNW,_BSW];
	for "_i" from 0 to (count _a)-1 do
	{
		(Helpers select _i) setPosATL [(_a select _i) select 0,(_a select _i) select 1,0.25];
	}; */
	
	// Check if object is inside bounds of HostObject
	{			
		_LocalPos = _HostObject worldToModel _x;
		
		_W = (_LocalPos select 0);
		_L = (_LocalPos select 1);
		
		if (_W < 0) then {_W = -_W};
		if (_L < 0) then {_L = -_L};

 		_IsOutOfBoundsW = (_W < _AmaxWidth);
		_IsOutOfBoundsL = (_L < _AmaxLength);
		
		if (_IsOutOfBoundsW && _IsOutOfBoundsL) exitWith
		{
			_CollisionDetected = true;
		};
	} forEach [getPos _nObject,_BNE,_BSE,_BNW,_BSW];
	
	// Check if HostObject is inside bounds of object
	{			
		_LocalPos = _nObject worldToModel _x;
		
		_W = (_LocalPos select 0);
		_L = (_LocalPos select 1);
		
		if (_W < 0) then {_W = -_W};
		if (_L < 0) then {_L = -_L};

 		_IsOutOfBoundsW = (_W < _BmaxWidth);
		_IsOutOfBoundsL = (_L < _BmaxLength);
		
		if (_IsOutOfBoundsW && _IsOutOfBoundsL) exitWith
		{
			_CollisionDetected = true;
		};
	} forEach [getPos _HostObject,_ANE,_ASE,_ANW,_ASW];
	
	if (_CollisionDetected) exitWith {};
} forEach _NearestObjects;

_CollisionDetected