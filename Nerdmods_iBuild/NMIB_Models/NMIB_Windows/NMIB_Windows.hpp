class NMIB_Barricaded_Window_A : iBuild_Window
{
	scope = 2;
	displayName = "Barricaded";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Windows\Data\Window_Type1_co.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Windows\Data\Window_Type1_co.paa"};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Windows\Window_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Windows\UI\Window_Type1.paa";
	author = "NerdMod";		
};
class NMIB_Barricaded_Window_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Window (Barricaded) Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Windows\Window_Type1_Ghost.p3d";
};

class NMIB_Barricaded_Window_B : NMIB_Barricaded_Window_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Windows\Data\Window_Type1_co.paa"};
};

class NMIB_Barricaded_Window_C : NMIB_Barricaded_Window_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Windows\Data\Window_Type1_co.paa",""};
};

class NMIB_Barricaded_Window_D : NMIB_Barricaded_Window_C
{
	hiddenSelectionsTextures[] = {"",""};
};