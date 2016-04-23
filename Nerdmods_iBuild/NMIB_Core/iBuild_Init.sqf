//execVM 'NerdMods_iBuild\NMIB_Scripts\iBuild_Config.sqf';

if (isServer || isDedicated) then
{
	execVM 'NerdMods_iBuild\NMIB_Server\iBuild_ServerInit.sqf';
};

if (!isDedicated) then
{
	execVM 'NerdMods_iBuild\NMIB_Core\iBuild_ClientInit.sqf';
};