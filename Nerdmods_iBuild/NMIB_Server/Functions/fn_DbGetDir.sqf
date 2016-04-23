_Plot = _this select 0;
_Module = _this select 1;

_Dir = if (_Module isKindOf "iBuild_Modules" && !(_Module isKindOf "iBuild_Plot")) then
{
	_PlotDir = getDir _Plot - getDir _Plot % 1;
	_ModuleDir = getDir _Module - getDir _Module % 1;		
	_PlotDir - _ModuleDir % 360;
} else {
	getDir _Module;
};

_Dir;