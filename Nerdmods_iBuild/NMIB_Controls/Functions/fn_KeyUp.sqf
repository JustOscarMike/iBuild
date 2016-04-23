_Key = _this select 1;

switch (_Key) do
{
	case (1):
	{
		NMIB_Enabled = false;
		[] call NMIB_fnc_MapKeys;
	};
	case (actionKeys NMIB_ActionKey1 select 0):
	{
		if (!NMIB_ActionKey1Down) then
		{
			if (_this select 2) then
			{
				createDialog 'NMIB_Setup_GUI';
			} else {
				if (NMIB_BuildProgress == 0) then
				{
					[_Key] call NMIB_fnc_Action;
				} else {
					NMIB_BuildProgress = 0;
				};
			};
		};
		NMIB_ActionKey1Down = false;
	};
};