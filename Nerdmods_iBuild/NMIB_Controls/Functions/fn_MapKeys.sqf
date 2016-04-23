_DefaultUser1 = 'User1';
_DefaultUser2 = 'User2';

_ActionKey1 = getNumber (missionConfigFile >> "iBuild_Config" >> "Controls" >> "ActionKey");
NMIB_ActionKey1 = if (_ActionKey1 == 0) then {_DefaultUser1;} else {'User'+str(_ActionKey1)};
_ActionKey2 = getNumber (missionConfigFile >> "iBuild_Config" >> "Controls" >> "PlotToggleKey");
NMIB_ActionKey2 = if (_ActionKey2 == 0) then {_DefaultUser2;} else {'User'+str(_ActionKey2)};