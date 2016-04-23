uiNamespace setVariable ['NMIB_KeypadCreateKey',false];

_Door = _this select 0;
_State = _this select 1;

_AnimateDoors =
{
	switch (true) do
	{
		case (_Door isKindOf "iBuild_Door"):
		{
			_Door animate ["Door", _State];
		};
		case (_Door isKindOf "iBuild_Garage"):
		{
			[_Door,_State] call NMIB_fnc_OpenGarage;
		};
	};
};

if (_State == 1) then
{
	//Open

	_SaveKeyToPlayer =
	{
		_Key = _this select 0;
		missionNamespace setVariable [str(_Door),_Key];
	};	
	
	_SaveKeyToDoor =
	{
		_Key = _this select 0;
		_Door setVariable ['NMIB_DoorKey',_Key,true];
	};
	
	_DoorKey = (_Door getVariable "NMIB_DoorKey");
	
	if (isNil ('_DoorKey')) then
	{
		// Create lock via keypad
		uiNamespace setVariable ['NMIB_KeypadCreateKey',true];
		
		missionNamespace setVariable ['NMIB_TargetDoor',_Door];
		createDialog "NMIB_Keypad";
		((uiNamespace getVariable 'NMIB_Keypad') displayCtrl 1100) ctrlSetStructuredText parseText "<t align='center'>PLEASE ENTER A 4 DIGIT CODE TO SET A LOCK FOR THIS DOOR</t>";
	} else {
		// Check player key matches		
		_PDoorKey = missionNamespace getVariable str(_Door);
		
		_AskForKey =
		{
			missionNamespace setVariable ['NMIB_TargetDoor',_Door];
			createDialog "NMIB_Keypad";
			_Text = format["<t align='center'>PLEASE ENTER THE CODE TO UNLOCK THIS DOOR<br/>KEY: %1 (Debugging)</t>",_Door getVariable 'NMIB_DoorKey'];
			((uiNamespace getVariable 'NMIB_Keypad') displayCtrl 1100) ctrlSetStructuredText parseText _Text;
		};
		
		if (isNil ('_PDoorKey')) then
		{
			// Key does not match, ask to enter key
			call _AskForKey;
		} else {
			if (_PDoorKey != _DoorKey) then
			{
				// Request player to enter key via iBuild keypad
				call _AskForKey;
			} else {
				call _AnimateDoors;
			};
		};
	};
} else {
	//Close
	call _AnimateDoors;
};