NMIB_ActionKey1Down = false;
NMIB_Enabled = true;

NMIB_BuildProgress = 0;

NMIB_TempControls = (findDisplay 46) displayAddEventHandler ["KeyDown","	
	_Return = _this call NMIB_fnc_KeyDown;
	_Return;
"];

//NMIB_ClassName = (_this select 0);
NMIB_ClassName = if (typeName (_this select 0) == "STRING") then {(_this select 0);} else {typeOf (_this select 0);};
NMIB_RelocateObj = if (typeName (_this select 0) != "STRING") then {(_this select 0);};
//NMIB_RelocateObj hideObjectGlobal true;

//player forceWalk true;
NMIB_CurCamView = cameraView;

// Find the nearest plot and it's position
NMIB_Plot = (getPos (missionNamespace getVariable 'NMIB_Workbench')) nearestObject "iBuild_Plot";
NMIB_IP = getPosASL NMIB_Plot;

// Create ghost of the selected module
NMIB_ModuleGhost = (NMIB_ClassName + "_Ghost") createVehicleLocal [0,0,-10000];
NMIB_ModuleGhost setVectorUp [0,0,1];
NMIB_ModuleGhost setPosASL getPosASL NMIB_Plot;
NMIB_ModuleGhost setDir (getDir NMIB_Plot);

[(profileNamespace getVariable 'DisplayPlotBounds'),NMIB_Plot,NMIB_PlotSize] call NMIB_fnc_DisplayPlotBounds;

// Create ghost colour variables
_Opacity = 0.75;
NMIB_StateGood = [0.25,0.5,0.1,_Opacity];
NMIB_StateBad = [0.5,0.1,0.1,_Opacity];
NMIB_StateReplace = [0.25,0.1,0.5,_Opacity];
NMIB_State = NMIB_StateBad;

NMIB_Instance = addMissionEventHandler ["Draw3D",
{	
	// Display construction bar if in range
	if (NMIB_CanBuild) then
	{
		_ProgressBarPos = (positionCameraToWorld [0,1.5,3]);
		_Percentage = if (NMIB_BuildProgress != 0) then {str(NMIB_BuildProgress)+"%"} else {""};
		drawIcon3D ["", [1,1,1,0.25], _ProgressBarPos, 100/5, 0.6, 0, _Percentage, 0, 0.05, "PuristaMedium"];
		drawIcon3D ["", NMIB_State, _ProgressBarPos, NMIB_BuildProgress/5, 0.6, 0, "", 0, 0.05, "PuristaMedium"];
	};
	
	// Switch player cam to first-person
	if (cameraOn == player && cameraView == "External" && !(NMIB_ClassName isKindOf "iBuild_Plot")) then
	{
		player switchCamera "Internal";
	};
	
	titleRsc ["NMIB_HUD","PLAIN"];
	// Hide iBuild cross-hair if player has weapon
	if (!weaponLowered player) then {((uiNamespace getVariable 'NMIB_HUD') displayCtrl 6633) ctrlShow false};	
	
	// Update constructable modules count on HUD
	_CraftableCount = [NMIB_ClassName,(missionNamespace getVariable 'NMIB_Workbench')] call NMIB_fnc_CraftableCount;
	_Text = if (typeName _CraftableCount == "STRING") then {"";} else {parseText format["<t align='center' size='1.8' shadow='0' font='PuristaLight'>%1</t>",_CraftableCount];};
	((uiNamespace getVariable 'NMIB_HUD') displayCtrl 0982) ctrlSetStructuredText _Text;
	
	NMIB_ReplaceModule = objNull;
	_ValidPos = false;
	
	if (NMIB_ClassName isKindOf "iBuild_Plot") then
	{
		_PlayerPosASL = getPosASL player;
		_PlayerDir = getDir player;
		
		_NMP_DiagDist = (((sqrt 2)*5*NMIB_PlotSize)/2);				
		_LowestHeight = 0;
		{
			_Position = ASLToATL [(_PlayerPosASL select 0)+(_NMP_DiagDist)*sin(_PlayerDir+_x),(_PlayerPosASL select 1)+(_NMP_DiagDist)*cos(_PlayerDir+_x),_PlayerPosASL select 2];
			
			_CurrentHeight = (_Position select 2);
			if (_CurrentHeight < _LowestHeight) then {_LowestHeight = _CurrentHeight};
		} forEach [45,135,225,315];

		_NewPos = if (surfaceIsWater _PlayerPosASL) then
		{
			[_PlayerPosASL select 0,_PlayerPosASL select 1,0.25];
		} else {
			[_PlayerPosASL select 0,_PlayerPosASL select 1,(_PlayerPosASL select 2) + 0.2 + (-_LowestHeight)];
		};
		
		NMIB_ModuleGhost setDir _PlayerDir;
		NMIB_ModuleGhost setPosASL _NewPos;
		[true,NMIB_ModuleGhost,NMIB_PlotSize] call NMIB_fnc_DisplayPlotBounds;
		_ValidPos = [NMIB_ModuleGhost,NMIB_PlotSize] call NMIB_fnc_PlotRules;		
	} else {
		if (NMIB_ClassName isKindOf "NMIB_Plot_Workbench") then
		{
			if (NMIB_BuildProgress == 0) then {[NMIB_ModuleGhost,NMIB_Plot,3,5,NMIB_ClassName] call NMIB_fnc_GridSnapMechanic};
			
			_CentreTop = NMIB_ModuleGhost modelToWorld [0,0,1.5];
			_CentreBottom = NMIB_ModuleGhost modelToWorld [0,0,-1.5];
			_Floors = [NMIB_ModuleGhost,_CentreTop,_CentreBottom,["iBuild_Floors","iBuild_Elevation"]] call NMIB_fnc_ModuleCheck;
			_ValidPos = (count _Floors != 0);
		} else {
			if (NMIB_BuildProgress == 0) then {[NMIB_ModuleGhost,NMIB_Plot,3,5,NMIB_ClassName] call NMIB_fnc_GridSnapMechanic};
			switch (true) do
			{
				case (NMIB_ClassName isKindOf "iBuild_Foundation"):
				{
					_ValidPos = [NMIB_ModuleGhost,NMIB_Plot] call NMIB_fnc_FoundationRules;
				};
				case (NMIB_ClassName isKindOf "iBuild_Walls"):
				{
					_WallState = [NMIB_ModuleGhost,NMIB_Plot,NMIB_ClassName] call NMIB_fnc_WallRules;
					NMIB_ClassName = (_WallState select 0);
					_ValidPos = (_WallState select 1);
					_Pillars = (_WallState select 2);

					if (_Pillars select 0 == 0) then {NMIB_ModuleGhost setObjectTexture [1,""]} else {NMIB_ModuleGhost setObjectTexture [1,(format['#(argb,8,8,3)color(%1,%2,%3,%4)',(NMIB_State select 0),(NMIB_State select 1),(NMIB_State select 2),(NMIB_State select 3)])]};
					if (_Pillars select 1 == 0) then {NMIB_ModuleGhost setObjectTexture [2,""]} else {NMIB_ModuleGhost setObjectTexture [2,(format['#(argb,8,8,3)color(%1,%2,%3,%4)',(NMIB_State select 0),(NMIB_State select 1),(NMIB_State select 2),(NMIB_State select 3)])]};				
				};
				case (NMIB_ClassName isKindOf "iBuild_Floor"):
				{
					_ValidPos = [NMIB_ModuleGhost,NMIB_Plot] call NMIB_fnc_FloorRules;
				};
				case (NMIB_ClassName isKindOf "iBuild_Elevation"):
				{
					[NMIB_ModuleGhost,NMIB_Plot] call NMIB_fnc_SnapDirection;
					_ValidPos = [NMIB_ModuleGhost,NMIB_Plot,NMIB_ClassName] call NMIB_fnc_ElevationRules;
				};
			};
		};
	};
	
	if (_ValidPos) then
	{
		NMIB_State = if (isNull NMIB_ReplaceModule) then {NMIB_StateGood;} else {NMIB_StateReplace;};
	} else {
		//NMIB_BuildProgress = 0;
		NMIB_State = NMIB_StateBad;
	};

	_Ghosts = [NMIB_ModuleGhost];
	if (!isNil 'NMIB_PlotGuideGhosts') then {_Ghosts = _Ghosts + NMIB_PlotGuideGhosts};
	{_x setObjectTexture [0,(format['#(argb,8,8,3)color(%1,%2,%3,%4)',(NMIB_State select 0),(NMIB_State select 1),(NMIB_State select 2),(NMIB_State select 3)])];} forEach _Ghosts;		

	if (NMIB_Enabled && !(NMIB_ClassName isKindOf "iBuild_Plot")) then
	{
 		NMIB_Enabled = [player,NMIB_Plot,NMIB_PlotSize] call NMIB_fnc_EntityInsidePlot;
	};
	
	NMIB_CanBuild = (str NMIB_State in [str NMIB_StateGood,str NMIB_StateReplace] && [getPos player select 0,getPos player select 1,0] distance [getPos NMIB_ModuleGhost select 0,getPos NMIB_ModuleGhost select 1,0] <= 4);
	
	if (!NMIB_Enabled || !alive player || player != vehicle player) then
	{
		[false] call NMIB_fnc_DisplayPlotBounds;
		
		// Delete objects
		_Ghosts = [NMIB_ModuleGhost];
		{deleteVehicle _x} forEach _Ghosts;
		
		NMIB_ModuleGhost = nil;
		NMIB_ClassName = nil;
		//NMIB_Plot = nil;
		NMIB_IP = nil;
		//NMIB_PlotGuideGhosts = nil;
		NMIB_State = nil;
		NMIB_StateGood = nil;
		NMIB_StateBad = nil;
		NMIB_StateReplace = nil;
		
		//NMIB_RelocateObj hideObjectGlobal false;
		NMIB_RelocateObj = nil;
		
		removeMissionEventHandler ["Draw3D",NMIB_Instance];
		if !(NMIB_ClassName isKindOf "iBuild_Plot") then {player switchCamera NMIB_CurCamView};
		NMIB_CurCamView = nil;
		player forceWalk false;
		
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",NMIB_TempControls];
		NMIB_TempControls = nil;
	};
}];