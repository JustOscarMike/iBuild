class CfgFunctions
{
	class NerdMod_Mod
	{
		tag = "NMIB";
		
		class iBuild_Mod
		{
			class iBuild_Init
			{
				postInit = 1;
				file = "NerdMods_iBuild\NMIB_Core\iBuild_Init.sqf";
			};
		};
		
		#include "NMIB_Controls\NMIB_Functions.hpp"		
		#include "NMIB_Core\NMIB_Functions.hpp"		
		#include "NMIB_Crafting\NMIB_Functions.hpp"		
		#include "NMIB_Gui\NMIB_Functions.hpp"		
		#include "NMIB_Misc\NMIB_Functions.hpp"		
		#include "NMIB_Server\NMIB_Functions.hpp"		
	};
};