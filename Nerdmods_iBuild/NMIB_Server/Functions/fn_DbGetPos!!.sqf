_Plot = _this select 0;
_Module = _this select 1;

_Position = if (_Module isKindOf "iBuild_Walls" || _Module isKindOf "iBuild_Floors" || _Module isKindOf "iBuild_Elevation") then
{
	//_Plot = [_Module] call NMIB_fnc_DbGetPlot;
	
	_ModelPos = _Plot worldToModel (getPosASL _Module);

	for "_Id" from 0 to 1 do
	{
		_FixedPos = [];
		
		_A = _ModelPos select _Id;
		
		if (_Module isKindOf "iBuild_Walls") then
		{
			for "_i" from 0 to (5*100) step 2.5 do
			{
				_B = _i - 1;
				_C = _i + 1;
				
				_Exit = if (_A > 0) then
				{
					if (_A > _B && _A < _C) exitWith
					{
						//_FixedPos = _FixedPos + [_i];
						_ModelPos set [_Id,_i];
						true;
					};
					false;
				} else {
					if (_A < -_B && _A > -_C) exitWith
					{
						//_FixedPos = _FixedPos + [-_i];
						_ModelPos set [_Id,-_i];
						true;
					};
					false;
				};
				
				if (_Exit) exitWith {};
			};
		} else {
			//_FixedPos = _FixedPos + [round _A];
			_ModelPos set [_Id,round _A];
		};
	};
	
	for "_i" from 0 to 3*1000 step 1 do
	{
		_A = _ModelPos select 2;
		
		_B = _i - 0.5;
		_C = _i + 0.5;
		
		if (_A > _B && _A < _C) exitWith
		{
			_ModelPos set [2,_i];
		};
	};
	
	_ModelPos;
} else {	
	getPosASL _Module;
};

//_Position = _FixedPos + [_Position select 2];
_Position;