_On = (_this select 0);

if (_On) then
{
	_Object = (_this select 1);
	_PlotSize = (_this select 2);

	_Dir = getDir _Object;
	_PlotSize = 2.5+(5*_PlotSize);
	_Perim = (_PlotSize-2.5);	
	
	if (isNil 'NMIB_PlotGuideGhosts') then
	{
		NMIB_PlotGuideGhosts = [];
		for "_i" from -_Perim to _Perim step 5 do
		{			
			for "_i" from 0 to 5 do
			{
				_Guide = "NMIB_Plot_Guide_Ghost" createVehicle [0,0,0];
				_Guide setObjectTexture [0,'#(argb,8,8,3)color(1,1,1,0.5)'];
				_Guide setVectorUp [0,0,1];
				NMIB_PlotGuideGhosts = NMIB_PlotGuideGhosts + [_Guide];		
			};
		};
	};
	
	_ID = 0;
	for "_i" from -_Perim to _Perim step 5 do
	{			
		_Guide = (NMIB_PlotGuideGhosts select _ID);				
		_Guide attachTo [_Object,[_i,_PlotSize,0]];

		_Guide = (NMIB_PlotGuideGhosts select _ID+1);
		_Guide attachTo [_Object,[_PlotSize,_i,0]];
		_Guide setDir 90;

		_Guide = (NMIB_PlotGuideGhosts select _ID+2);
		_Guide attachTo [_Object,[_i,-_PlotSize,0]];
		_Guide setDir 180;
		
		_Guide = (NMIB_PlotGuideGhosts select _ID+3);
		_Guide attachTo [_Object,[-_PlotSize,_i,0]];
		_Guide setDir -90;
		
		_ID = _ID + 4;
	};		
} else {
	if (!isNil 'NMIB_PlotGuideGhosts') then
	{
		{deleteVehicle _x} forEach NMIB_PlotGuideGhosts;
		NMIB_PlotGuideGhosts = nil;
	};
};