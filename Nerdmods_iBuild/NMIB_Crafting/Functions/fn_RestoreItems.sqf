_ClassName = _this select 0;

_RestoreItems = getArray (configFile >> "CfgVehicles" >> _ClassName >> "iBuild_ReqItems"); // Get required module items
_ItemsList = missionNamespace getVariable "NMIB_ItemsList";

if ((missionNamespace getVariable 'NMIB_Workbench') isKindOf 'Man') then
{
	for "_i" from 0 to (count (_RestoreItems select 0)-1) do
	{
		_ItemClass = _ItemsList select ((_RestoreItems select 0) select _i);
		_ItemCount = ((_RestoreItems select 1) select _i);
		for "_i" from 1 to _ItemCount do
		{
			(missionNamespace getVariable 'NMIB_Workbench') addItem _ItemClass;
		};
	};
} else {
	for "_i" from 0 to (count (_RestoreItems select 0)-1) do
	{
		_ItemClass = _ItemsList select ((_RestoreItems select 0) select _i);
		_ItemCount = ((_RestoreItems select 1) select _i);
		
		(missionNamespace getVariable 'NMIB_Workbench') addItemCargoGlobal [_ItemClass,_ItemCount];
	};	
};