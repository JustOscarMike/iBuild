class NMIB_Generic_Floor_A : iBuild_Floor
{
	scope = 2;
	displayName = "Generic";
	iBuild_ReqItems[] = {{1,2},{6,3}};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Floors\Floor_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Floors\UI\Floor_Type1.paa";
	author = "NerdMod";
};
class NMIB_Generic_Floor_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Generic Floor Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Floors\Floor_Type1_Ghost.p3d";
};