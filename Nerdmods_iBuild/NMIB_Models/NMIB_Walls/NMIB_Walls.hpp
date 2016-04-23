class NMIB_Generic_Wall0_A : iBuild_Wall
{
	scope = 2;
	displayName = "Type 1";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type1_CO.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type1_CO.paa"};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Wall_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Walls\UI\Wall_Type1.paa";
	author = "NerdMod";
};
class NMIB_Generic_Wall0_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Wall (Type 1) Ghost";
	NMIB_Pillars[] = {1,1};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Wall_Type1_Ghost.p3d";
};

class NMIB_Generic_Wall0_B : NMIB_Generic_Wall0_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type1_CO.paa"};
};

class NMIB_Generic_Wall0_C : NMIB_Generic_Wall0_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type1_CO.paa",""};
};

class NMIB_Generic_Wall0_D : NMIB_Generic_Wall0_C
{
	hiddenSelectionsTextures[] = {"",""};
};
///////////////////////////////////////////////////////////////////////////////////////////////////////
class NMIB_Generic_Wall1_A : iBuild_Wall
{
	scope = 2;
	displayName = "Type 2";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type2_CO.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type2_CO.paa"};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Wall_Type2_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Walls\UI\Wall_Type2.paa";
	author = "NerdMod";
};
class NMIB_Generic_Wall1_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Wall (Type 2) Ghost";
	NMIB_Pillars[] = {1,1};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Wall_Type1_Ghost.p3d";
};

class NMIB_Generic_Wall1_B : NMIB_Generic_Wall1_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type2_CO.paa"};
};

class NMIB_Generic_Wall1_C : NMIB_Generic_Wall1_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type2_CO.paa",""};
};

class NMIB_Generic_Wall1_D : NMIB_Generic_Wall1_C
{
	hiddenSelectionsTextures[] = {"",""};
};
///////////////////////////////////////////////////////////////////////////////////////////////////////
class NMIB_Generic_Wall2_A : iBuild_Wall
{
	scope = 2;
	displayName = "Type 3";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type3_CO.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type3_CO.paa"};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Wall_Type3_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Walls\UI\Wall_Type3.paa";
	author = "NerdMod";
};
class NMIB_Generic_Wall2_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Wall (Type 3) Ghost";
	NMIB_Pillars[] = {1,1};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Walls\Wall_Type1_Ghost.p3d";
};

class NMIB_Generic_Wall2_B : NMIB_Generic_Wall2_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type3_CO.paa"};
};

class NMIB_Generic_Wall2_C : NMIB_Generic_Wall2_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type3_CO.paa",""};
};

class NMIB_Generic_Wall2_D : NMIB_Generic_Wall2_C
{
	hiddenSelectionsTextures[] = {"",""};
};
///////////////////////////////////////////////////////////////////////////////////////////////////////
class NMIB_Generic_Wall3_A : iBuild_Wall
{
	scope = 2;
	displayName = "Type 4";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type4_CO.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type4_CO.paa"};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Wall_Type4_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Walls\UI\Wall_Type4.paa";
	author = "NerdMod";
};
class NMIB_Generic_Wall3_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Wall (Type 4) Ghost";
	NMIB_Pillars[] = {1,1};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Wall_Type1_Ghost.p3d";
};

class NMIB_Generic_Wall3_B : NMIB_Generic_Wall3_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type4_CO.paa"};
};

class NMIB_Generic_Wall3_C : NMIB_Generic_Wall3_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Wall_Type4_CO.paa",""};
};

class NMIB_Generic_Wall3_D : NMIB_Generic_Wall3_C
{
	hiddenSelectionsTextures[] = {"",""};
};	
///////////////////////////////////////////////////////////////////////////////////////////////////////
class NMIB_Generic_Window_A : iBuild_Wall
{
	scope = 2;
	displayName = "Window";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Window_Type1_CO.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Window_Type1_CO.paa"};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Window_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Walls\UI\Window_Type1.paa";
	author = "NerdMod";
};
class NMIB_Generic_Window_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Wall (Window) Ghost";
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Window_Type1_Ghost.p3d";
};

class NMIB_Generic_Window_B : NMIB_Generic_Window_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Window_Type1_CO.paa"};
};

class NMIB_Generic_Window_C : NMIB_Generic_Window_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Window_Type1_CO.paa",""};
};

class NMIB_Generic_Window_D : NMIB_Generic_Window_C
{
	hiddenSelectionsTextures[] = {"",""};
};
///////////////////////////////////////////////////////////////////////////////////////////////////////
class NMIB_Generic_Doorway_A : iBuild_Wall
{
	scope = 2;
	displayName = "Doorway";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Doorway_Type1_CO.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Doorway_Type1_CO.paa"};
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Doorway_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Walls\UI\Doorway_Type1.paa";
	author = "NerdMod";
};
class NMIB_Generic_Doorway_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Doorway Ghost";
	model = "Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Doorway_Type1_Ghost.p3d";
};

class NMIB_Generic_Doorway_B : NMIB_Generic_Doorway_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Doorway_Type1_CO.paa"};
};

class NMIB_Generic_Doorway_C : NMIB_Generic_Doorway_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Walls\Data\Doorway_Type1_CO.paa",""};
};

class NMIB_Generic_Doorway_D : NMIB_Generic_Doorway_C
{
	hiddenSelectionsTextures[] = {"",""};
};