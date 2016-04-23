class NMIB_Plot : iBuild_Plot
{
	scope = 2;
	displayName = "Generic";
	iBuild_ReqItems[] = {{0,1,2},{1,4,2}};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Plots\NMIB_Plot_Marker.p3d";
	author = "NerdMod";
};
class NMIB_Plot_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Plot Generic Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Plots\NMIB_Plot_Marker.p3d";
};
class NMIB_Plot_Guide_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Plot Guide Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Plots\NMIB_PlotBounds_Ghost.p3d";
};