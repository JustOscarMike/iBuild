class NMIB_ItemInfo
{
	type = 618;
	allowedSlots[] = {701,801,901};
};

class ItemCore;	// External class reference
class NMIB_Item : ItemCore
{
	scope = 0;
	
	class ItemInfo : NMIB_ItemInfo
	{
		mass = 0;
	};
};

class NMIB_PlotLease_Itm : NMIB_Item
{
	scope = 1;
	displayName = "iBuild Plot Lease";
	descriptionShort = "iBuild: Double-click to deploy.";
	description = "Plot leases are used to claim land.";
	picture = "\Nerdmods_iBuild\NMIB_Items\UI\PlotLease_Icon.paa";
	
	class ItemInfo : NMIB_ItemInfo
	{
		mass = 0;
	};
};
class NMIB_ScrapMetal_Itm : NMIB_Item
{
	scope = 1;
	displayName = "Scrap Metal";
	descriptionShort = "iBuild: Double-click to deploy.";
	description = "Scrap metal is used to construct some modules.";
	picture = "\Nerdmods_iBuild\NMIB_Items\UI\ScrapMetal_Icon.paa";
	
	class ItemInfo : NMIB_ItemInfo
	{
		mass = 0;
	};
};
class NMIB_WoodNails_Itm : NMIB_Item
{
	scope = 1;
	displayName = "Wood Nails";
	descriptionShort = "iBuild: Double-click to deploy.";
	description = "Wood nails are used to construct all modules.";
	picture = "\Nerdmods_iBuild\NMIB_Items\UI\WoodNails_Icon.paa";
	
	class ItemInfo : NMIB_ItemInfo
	{
		mass = 0;
	};
};
class NMIB_WoodPlanks_Itm : NMIB_Item
{
	scope = 1;
	displayName = "Wooden Planks";
	descriptionShort = "iBuild: Double-click to deploy.";
	description = "Wooden planks are used to construct all modules.";
	picture = "\Nerdmods_iBuild\NMIB_Items\UI\WoodPlanks_Icon.paa";
	
	class ItemInfo : NMIB_ItemInfo
	{
		mass = 0;
	};
};








