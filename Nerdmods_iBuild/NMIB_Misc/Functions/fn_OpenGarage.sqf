_DoorNames = ["Door_1A","Door_1B","Door_2A","Door_2B"];

_Door = _this select 0;
_State = _this select 1;

_AnimateDoors =
{
	_Door = _this select 0;
	{
		_Door animate [_x, _State];
	} forEach _DoorNames;
};

[_Door] call _AnimateDoors;
_StackedGarage = [_Door,["iBuild_Garage"],[],3] call NMIB_fnc_FindWall;
if (count _StackedGarage != 0) then {[_StackedGarage select 0] call _AnimateDoors};