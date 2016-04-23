class NMIB_Lockable_Door_A : iBuild_Door
{
	scope = 2;
	displayName = "Lockable";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Doors\Data\Door_Type1_co.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Doors\Data\Door_Type1_co.paa"};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Doors\Door_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Doors\UI\Door_Type1.paa";
	author = "NerdMod";
	iBuild_Vars[] = {"NMIB_DoorKey"};
	
	class AnimationSources
	{
		class door
		{
			source = "user";
			animPeriod = 1;
			initPhase = 0;
			sound = "GenericDoorsSound";
		};		
	};
	
	class UserActions
	{
		class Open
		{
			displayName = "Open Door";
			position = "door_axis";
			radius = 2.3;
			onlyforplayer = true;
			condition = "this animationPhase ""door"" == 0;";
			statement = "[this,1,1] call NMIB_fnc_LockMechanic;";
		};
		class Close
		{
			displayName = "Close Door";
			position = "door_axis";
			radius = 2.3;
			onlyforplayer = true;
			condition = "this animationPhase ""door"" == 1;";
			statement = "[this,0,1] call NMIB_fnc_LockMechanic;";
		};		
	};			
};
class NMIB_Lockable_Door_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Door (Lockable) Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Doors\Door_Type1_Ghost.p3d";
};

class NMIB_Lockable_Door_B : NMIB_Lockable_Door_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Doors\Data\Door_Type1_co.paa"};
};

class NMIB_Lockable_Door_C : NMIB_Lockable_Door_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Doors\Data\Door_Type1_co.paa",""};
};

class NMIB_Lockable_Door_D : NMIB_Lockable_Door_C
{
	hiddenSelectionsTextures[] = {"",""};
};

class NMIB_Generic_Door_A : iBuild_Door
{
	scope = 2;
	displayName = "Generic";
	iBuild_ReqItems[] = {{1,2},{4,2}};
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Doors\Data\Door_Type1_co.paa","Nerdmods_iBuild\NMIB_Models\NMIB_Doors\Data\Door_Type1_co.paa"};
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Doors\Door_Type1_Solid.p3d";
	iBuild_Picture = "\Nerdmods_iBuild\NMIB_Models\NMIB_Doors\UI\Door_Type1.paa";
	author = "NerdMod";
	
	class AnimationSources
	{
		class door
		{
			source = "user";
			animPeriod = 1;
			initPhase = 0;
			sound = "GenericDoorsSound";
		};		
	};
	
	class UserActions
	{
		class Open
		{
			displayName = "Open Door";
			position = "door_axis";
			radius = 2.3;
			onlyforplayer = true;
			condition = "this animationPhase ""door"" == 0;";
			statement = "this animate [""door"", 1];";
		};
		class Close
		{
			displayName = "Close Door";
			position = "door_axis";
			radius = 2.3;
			onlyforplayer = true;
			condition = "this animationPhase ""door"" == 1;";
			statement = "this animate [""door"", 0];";
		};		
	};			
};

class NMIB_Generic_Door_A_Ghost : iBuild_Ghost
{
	scope = 1;
	displayName = "Door (Generic) Ghost";
	model = "\NerdMods_iBuild\NMIB_Models\NMIB_Doors\Door_Type1_Ghost.p3d";
};

class NMIB_Generic_Door_B : NMIB_Generic_Door_A
{
	hiddenSelectionsTextures[] = {"","Nerdmods_iBuild\NMIB_Models\NMIB_Doors\Data\Door_Type1_co.paa"};
};

class NMIB_Generic_Door_C : NMIB_Generic_Door_B
{
	hiddenSelectionsTextures[] = {"Nerdmods_iBuild\NMIB_Models\NMIB_Doors\Data\Door_Type1_co.paa",""};
};

class NMIB_Generic_Door_D : NMIB_Generic_Door_C
{
	hiddenSelectionsTextures[] = {"",""};
};