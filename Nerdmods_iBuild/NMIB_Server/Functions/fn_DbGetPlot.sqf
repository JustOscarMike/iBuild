_Module = _this select 0;

_ModulePos = [getPos _Module select 0,getPos _Module select 1,0];
_Plot = _ModulePos nearestObject 'iBuild_Plot';

_Plot;