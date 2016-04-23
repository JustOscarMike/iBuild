_UPlotID = str (_this select 0);
_PlotA = toArray(_UPlotID);
_PlotA resize 8;
"P_" + toString(_PlotA);

/*
_UPlotID = str (_this select 0);

_PlotA = toArray(_UPlotID);
_Hash = toArray("#") select 0;
_ID = _PlotA find _Hash;

_PlotA resize _ID;

"P_" + toString(_PlotA);