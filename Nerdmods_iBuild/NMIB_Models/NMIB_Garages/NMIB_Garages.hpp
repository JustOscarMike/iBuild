class NMIB_Lockable_Garage_A : iBuild_Garage
{
	scope = 2;
	displayName = "Lockable";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Garages\Data\Garage_Type1_co.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Garages\Data\Garage_Type1_co.paa"};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Garages\Garage_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Garages\UI\Garage_Type1.paa";
	author = "NerdMod";
	iBuild_Vars[] = {"NMIB_DoorKey"};
	
	class AnimationSources
	{
		class Door_1A
		{
			source = "user";
			animPeriod = 2;
			initPhase = 0;
			sound = "OldWoodDoorsSound";
		};
		class Door_1B : Door_1A {};
		class Door_2A : Door_1A {};
		class Door_2B : Door_1A {};
	};
	
	class UserActions
	{
		class Open
		{
			displayName = "Open Garage";
			position = "Door_Handle";
			radius = 2.5;
			onlyforplayer = true;
			condition = "this animationPhase ""Door_1A"" == 0;";
			statement = "[this,1,1] call NMIB_fnc_LockMechanic;";
		};
		class Close : Open
		{
			displayName = "Close Garage";
			condition = "this animationPhase ""Door_1A"" == 1;";
			statement = "[this,0,1] call NMIB_fnc_LockMechanic;";
		};		
	};			
};
class NMIB_Lockable_Garage_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Garage (Lockable) Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Garages\Garage_Type1_Ghost.p3d";
};

class NMIB_Lockable_Garage_B : NMIB_Lockable_Garage_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Garages\Data\Garage_Type1_co.paa"};
};

class NMIB_Lockable_Garage_C : NMIB_Lockable_Garage_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Garages\Data\Garage_Type1_co.paa",""};
};

class NMIB_Lockable_Garage_D : NMIB_Lockable_Garage_C
{
	hiddenSelectionsTextures[] = {"",""};
};

class NMIB_Generic_Garage_A : iBuild_Garage
{
	scope = 2;
	displayName = "Generic";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Garages\Data\Garage_Type1_co.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Garages\Data\Garage_Type1_co.paa"};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Garages\Garage_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Garages\UI\Garage_Type1.paa";
	author = "NerdMod";
	
	class AnimationSources
	{
		class Door_1A
		{
			source = "user";
			animPeriod = 2;
			initPhase = 0;
			sound = "OldWoodDoorsSound";
		};
		class Door_1B : Door_1A {};
		class Door_2A : Door_1A {};
		class Door_2B : Door_1A {};
	};
	
	class UserActions
	{
		class Open
		{
			displayName = "Open Garage";
			position = "Door_Handle";
			radius = 2.5;
			onlyforplayer = true;
			condition = "this animationPhase ""Door_1A"" == 0;";
			statement = "this animate [""Door_1A"", 1];this animate [""Door_1B"", 1];this animate [""Door_2A"", 1];this animate [""Door_2B"", 1];";
		};
		class Close : Open
		{
			displayName = "Close Garage";
			condition = "this animationPhase ""Door_1A"" == 1;";
			statement = "this animate [""Door_1A"", 0];this animate [""Door_1B"", 0];this animate [""Door_2A"", 0];this animate [""Door_2B"", 0];";
		};		
	};			
};
class NMIB_Generic_Garage_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Garage (Lockable) Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Garages\Garage_Type1_Ghost.p3d";
};

class NMIB_Generic_Garage_B : NMIB_Generic_Garage_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Garages\Data\Garage_Type1_co.paa"};
};

class NMIB_Generic_Garage_C : NMIB_Generic_Garage_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Garages\Data\Garage_Type1_co.paa",""};
};

class NMIB_Generic_Garage_D : NMIB_Generic_Garage_C
{
	hiddenSelectionsTextures[] = {"",""};
};