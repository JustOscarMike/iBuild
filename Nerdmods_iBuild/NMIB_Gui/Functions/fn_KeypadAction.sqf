_Door = missionNamespace getVariable 'NMIB_TargetDoor';
_DoorKey = _Door getVariable 'NMIB_DoorKey';

_GUI = uiNamespace getVariable 'NMIB_Keypad';
_Digits = (_GUI displayCtrl 1000);

_CreateKey = uiNamespace getVariable 'NMIB_KeypadCreateKey';

// Set default GUI colours
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(_GUI displayCtrl 03536) ctrlSetTextColor
[
	(profilenamespace getvariable 'GUI_BCG_RGB_R'),
	(profilenamespace getvariable 'GUI_BCG_RGB_G'),
	(profilenamespace getvariable 'GUI_BCG_RGB_B'),
	0.5
];	
/* _Digits ctrlSetTextColor
[
	1,
	1,
	1,
	1
]; */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_CreateKey) then
{
	if ((_this select 0) != 10) then
	{
		_Key = ((ctrlText _Digits)+str(_this select 0));
		_Digits ctrlSetText _Key;
		
		if (count toArray(ctrlText _Digits) == 4) then
		{
			_Door say3D "DoorLock";
			missionNamespace setVariable [str(_Door),_Key];
			_Door setVariable ['NMIB_DoorKey',_Key,true];
			closeDialog 0;
			hint format["Key created & copied to clipboard.\n\n%1",_Key];
			copyToClipboard _Key;
		};
	} else {
		_Digits ctrlSetText "";
	};	
} else {
	if ((_this select 0) != 10) then
	{
		if (ctrlText _Digits in ["0000","DENIED!"]) then
		{
			_Digits ctrlSetText "";
		};
		_Digits ctrlSetText ((ctrlText _Digits)+str(_this select 0));
		
		if (count toArray(ctrlText _Digits) == 4) then
		{
			// Verify code
			if ((ctrlText _Digits) == _DoorKey) then
			{
				// Good
				_Door say3D "DoorLock";
				missionNamespace setVariable [str(_Door),_DoorKey];
				closeDialog 0;
			} else {
				// Bad
				_Door say3D "DoorLocked";
				_Digits ctrlSetText "DENIED!";
				(_GUI displayCtrl 03536) ctrlSetTextColor [1, 0.25, 0.25, 0.5];
				//_Digits ctrlSetTextColor [1, 0.5, 0.5, 0.9];
			};
		};
	} else {
		_Digits ctrlSetText "";
	};	
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
