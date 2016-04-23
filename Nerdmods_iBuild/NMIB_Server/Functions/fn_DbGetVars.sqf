_Module = _this select 0;
_ClassName = typeOf _Module;

_VarsArray = [];
_VarsList = getArray (configFile >> "CfgVehicles" >> _ClassName >> "iBuild_Vars");
if (count _VarsList != 0) then
{
	{
		_VD = _Module getVariable _x;
		_VD = if (isNil '_VD') then {"";} else {_VD;};
		_VarsArray = _VarsArray + [_VD];
	} forEach _VarsList;
};		

_VarsArray;