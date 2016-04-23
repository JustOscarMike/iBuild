_RefreshDB = getNumber (missionConfigFile >> "iBuild_Config" >> "iniDBI" >> "AutoSave");
NMIB_RefreshDB = if (_RefreshDB == 0) then {60;} else {_RefreshDB;};

_iniDBI = getNumber (configFile >> 'CfgPatches' >> 'iniDBI' >> 'requiredVersion');

if (_iniDBI > 0) then
{
	// iniDBI installed
	
	// Enable iniDBI if disabled
	if (isNil ('iniDB_version')) then
	{
		call compile preProcessFile "\inidbi\init.sqf";			
	};
	
	if (!isNil ('iniDB_version')) then
	{
		call NMIB_fnc_DbLoad;
		
		[] spawn {
			while {true} do
			{
				sleep 60*NMIB_RefreshDB; // Save every X minutes
				call NMIB_fnc_DbSave;
			};
		};
	};
	sleep 0.1;
	systemChat format['iniDB detected: Your iBuild structures will be saved every %1 Minute[s]',NMIB_RefreshDB];
};