player addAction ["",{}, "", 0, false, true, "DefaultAction", "NMIB_Enabled"];

_DPB = profileNamespace getVariable 'DisplayPlotBounds';
if (isNil '_DPB') then
{
	profileNamespace setVariable ['DisplayPlotBounds',true];
};

profileNamespace setVariable ['_IsBuildRookie',true];

// 1: Check if iBuild is being enabled for the first time...
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
_IsBuildRookie = (profileNamespace getVariable '_IsBuildRookie');

// Check if player is new to iBuild.
_IsBuildRookie = switch (isNil ('_IsBuildRookie')) do
{
    case true: { true };
    default { _IsBuildRookie };
};

// Check if all iBuild keys are bound.
if (!_IsBuildRookie) then
{
	// Check if all custom user controls are bound...
	_BindKey = {
		if(count (actionKeys _x) == 0) exitWith {true};
		false;
	} forEach (profileNamespace getVariable 'NMIB_Controls');
	
	// If a key is not bound show welcome dialog
	_IsBuildRookie = _BindKey;
};

// Show setup dialog if players first time or keys not bound.
if (_IsBuildRookie) then
{
	createDialog 'NMIB_Setup_GUI';
};

_FreePlots = getNumber (missionConfigFile >> "iBuild_Config" >> "Misc" >> "FreePlots");
_FreePlots = if (_FreePlots == 0) then {1;} else {_FreePlots;};

if (_FreePlots > 0) then
{
	_RequiredItems = getArray (configFile >> "CfgVehicles" >> "NMIB_Plot" >> "iBuild_ReqItems");
	_ItemsList = missionNamespace getVariable "NMIB_ItemsList";
	for "_i" from 0 to (count (_RequiredItems select 0))-1 do
	{				
		_ReqItemClass = _ItemsList select ((_RequiredItems select 0) select _i);
		_ReqItemCount = ((_RequiredItems select 1) select _i);
		for "_i" from 1 to (_ReqItemCount*_FreePlots) do
		{
			player addItemToUniform _ReqItemClass;
		};
	};
};