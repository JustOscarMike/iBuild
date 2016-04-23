_Key = _this select 1;
_SHIFT = _this select 2;
_CTRL = _this select 3;
_ALT = _this select 4;

_KeyOnly = (!_SHIFT && !_CTRL && !_ALT);

_Esc = 1;
_ActionKey1 = (actionKeys NMIB_ActionKey1 select 0);
_ActionKey2 = (actionKeys NMIB_ActionKey2 select 0);

// When only one key is pressed.
if (_KeyOnly) then
{
	_Return = nil;
	
	if (_Key == _Esc) then
	{
		if (NMIB_Enabled) then
		{
			NMIB_Enabled = false;
			[NMIB_ClassName] call NMIB_fnc_RestoreItems;
			_Return = true;
		};
	};	
	if (_Key == _ActionKey1) then
	{
		if (NMIB_CanBuild) then
		{
			[] call NMIB_fnc_BuildModule;
			NMIB_ActionKey1Down = true;
		};
		
		_Return = true;
	};
	if (_Key == _ActionKey2) then
	{
		if (NMIB_Enabled) then
		{
			profileNamespace setVariable ['DisplayPlotBounds',!(profileNamespace getVariable 'DisplayPlotBounds')];
			[(profileNamespace getVariable 'DisplayPlotBounds'),NMIB_Plot,NMIB_PlotSize] call NMIB_fnc_DisplayPlotBounds;
			_Return = true;
		};
	};

	_Return
};