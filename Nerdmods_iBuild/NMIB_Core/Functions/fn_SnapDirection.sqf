_Ghost = _this select 0;
_Plot = _this select 1;

_PlayerDir = (getDir Player);
_GhostDir = (getDir _Ghost);
_FoundationDir = (getDir _Plot);

_Ghost setDir _FoundationDir;

//if (_ModuleClass in ["Foundation","Floor"]) exitWith {};

_DirDifference = _PlayerDir - _FoundationDir;
if (_DirDifference < -180) then {_DirDifference = _DirDifference + 360};
if (_DirDifference > 180) then {_DirDifference = _DirDifference - 360};

if (_DirDifference > 45 && _DirDifference < 135) then {_Ghost setDir (_FoundationDir + 90)};
if (_DirDifference < -45 && _DirDifference > -135) then {_Ghost setDir (_FoundationDir - 90)};
if (_DirDifference > 135 || _DirDifference < -135) then {_Ghost setDir (_FoundationDir + 180)};