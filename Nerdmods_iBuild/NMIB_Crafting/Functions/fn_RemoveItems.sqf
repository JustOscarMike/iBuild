_Container = (_this select 0);
_RequiredItems = (_this select 1);
_ItemsList = missionNamespace getVariable "NMIB_ItemsList";

if (_Container isKindOf 'Man') then
{			
	for "_i" from 0 to (count (_RequiredItems select 0)-1) do
	{
		_ReqItemClass = _ItemsList select ((_RequiredItems select 0) select _i);
		_ReqItemCount = ((_RequiredItems select 1) select _i);
		
		_UItemCount = {_x == _ReqItemClass} count (uniformItems _Container);
		_VItemCount = {_x == _ReqItemClass} count (vestItems _Container);
		_BItemCount = {_x == _ReqItemClass} count (backpackItems _Container);
		
		_Container removeItems _ReqItemClass;
		
		_ReqItemCount = (_UItemCount+_VItemCount+_BItemCount) - _ReqItemCount;								
		
		for "_i" from 1 to _ReqItemCount do
		{
			_Container addItem _ReqItemClass;
		};
	};
} else {
	_CargoItems = getItemCargo _Container;
	clearItemCargoGlobal _Container;
	
/* 	{	
		_Classname = _ItemsList select _x;
		
		_ReqItemId = (_RequiredItems select 0) find _Classname;
		_CargoItemId = (_CargoItems select 0) find _Classname;
		
		_ReqItemCount = ((_RequiredItems select 1) select _ReqItemId);
		_CargoItemCount = ((_CargoItems select 1) select _CargoItemId);
		
		_NewItemCount = _CargoItemCount - _ReqItemCount;
		
		(_CargoItems select 1) set [_CargoItemId, _NewItemCount];
	} forEach (_RequiredItems select 0); */
	
	for "_i" from 0 to (count (_RequiredItems select 0)-1) do
	{
		_ReqItemClassName = _ItemsList select ((_RequiredItems select 0) select _i);
		_ReqItemCount = ((_RequiredItems select 1) select _i);
		
		_CargoItemId = (_CargoItems select 0) find _ReqItemClassName;
		_CargoItemCount = ((_CargoItems select 1) select _CargoItemId);
		
		_NewItemCount = _CargoItemCount - _ReqItemCount;
		
		(_CargoItems select 1) set [_CargoItemId, _NewItemCount];
	};
	
	if (count (_CargoItems select 0) > 0) then
	{
		for "_i" from 0 to count (_CargoItems select 0)-1 do 
		{
			_Container addItemCargoGlobal [(_CargoItems select 0) select _i, (_CargoItems select 1) select _i];
		};
	};			
};