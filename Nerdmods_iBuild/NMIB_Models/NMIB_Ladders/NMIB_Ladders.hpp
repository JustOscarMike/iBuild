class NMIB_Generic_Ladder : iBuild_Ladder
{
	scope = 2;
	displayName = "Generic";
	iBuild_ReqItems[] = {{1,2},{3,3}};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Ladders\Ladder_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Ladders\UI\Ladder_Type1.paa";
	author = "NerdMod";
	
	ladders[] = 
	{ 
		{ 
			"start", 
			"end" 
		} 
	};
};
class NMIB_Generic_Ladder_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Ladder (Generic) Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Ladders\Ladder_Type1_Ghost.p3d";
};