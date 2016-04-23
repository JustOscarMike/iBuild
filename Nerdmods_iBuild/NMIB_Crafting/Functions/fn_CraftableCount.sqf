_ModuleCN = (_this select 0);
_Container = (_this select 1);

_RequiredItems = getArray (configFile >> "CfgVehicles" >> _ModuleCN >> "iBuild_ReqItems");
_ItemsList = missionNamespace getVariable "NMIB_ItemsList";

_CraftableCount = [];
if (_Container isKindOf 'Man') then
{
	for "_i" from 0 to (count (_RequiredItems select 0)-1) do
	{
		_ReqItemClass = _ItemsList select ((_RequiredItems select 0) select _i);
		_ReqItemCount = ((_RequiredItems select 1) select _i);
		_PlayerItemCount = {_x == _ReqItemClass} count (items _Container);
		
		_CraftableCount = _CraftableCount + [_PlayerItemCount / _ReqItemCount];
	};
} else {
	_CargoItems = getItemCargo _Container;
	for "_i" from 0 to (count (_RequiredItems select 0)-1) do
	{
		_ReqItemClass = _ItemsList select ((_RequiredItems select 0) select _i);
		_ReqItemCount = ((_RequiredItems select 1) select _i);
		
		_CargoItemId = ((_CargoItems select 0) find _ReqItemClass);
		if (_CargoItemId >= 0) then
		{
			_CargoItemCount = (_CargoItems select 1) select _CargoItemId;
			_CraftableCount = _CraftableCount + [_CargoItemCount / _ReqItemCount];
		} else {
			_CraftableCount = _CraftableCount + [0];
		};
	};
};

_ModuleCraftCount = (_CraftableCount select 0);
{
	if (_x < _ModuleCraftCount) then {_ModuleCraftCount = _x};
} forEach _CraftableCount;

(_ModuleCraftCount - _ModuleCraftCount %1)