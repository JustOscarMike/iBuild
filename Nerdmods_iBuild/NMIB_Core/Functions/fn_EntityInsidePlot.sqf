_Entity = _this select 0;
_Plot = _this select 1;
_PlotSize = _this select 2;
_Padding = if (count _this > 3) then {_this select 3} else {1};

_A = _Plot worldToModel (getPosASL _Entity);
_W = _A select 0;
_L = _A select 1;

if (_W < 0) then {_W = -_W};
if (_L < 0) then {_L = -_L};

(_W <= 2.5+5*_PlotSize+_Padding && _L <= 2.5+5*_PlotSize+_Padding);