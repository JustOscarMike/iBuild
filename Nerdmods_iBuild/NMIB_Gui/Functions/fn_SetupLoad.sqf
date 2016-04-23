//_ActionKey = 'User'+ str (getNumber (missionConfigFile >> "iBuild_Config" >> "Controls" >> "ActionKey"));

_Control = _this select 0;
_ListBox = (_Control displayCtrl 1500);
_InfoBox = (_Control displayCtrl 1100);

/* _InfoBox ctrlSetStructuredText parseText format[
"<t font='PuristaLight' align='center'><br/>Greetings, %1!<br/><br/>
Welcome to the iBuild modification for ArmA 3.<br/><br/><br/>
BEFORE YOU BEGIN<br/><br/>For iBuild to function in it's full glory, you must first bind some basic user action keys.<br/><br/>
<a href='http://ibuildmod.wordpress.com/controls'>Video</a></t>",profileName]; */

_KeysBound = [];
if (count actionKeys NMIB_ActionKey1 == 0) then {_KeysBound = _KeysBound + ['Unbound']} else {_KeysBound = _KeysBound + [(actionKeysNamesArray NMIB_ActionKey1 select 0)]};
/* if (count actionKeys 'User2' == 0) then {_KeysBound = _KeysBound + ['Unbound']} else {_KeysBound = _KeysBound + [(actionKeysNamesArray "User2" select 0)]};
if (count actionKeys 'User3' == 0) then {_KeysBound = _KeysBound + ['Unbound']} else {_KeysBound = _KeysBound + [(actionKeysNamesArray "User3" select 0)]};
if (count actionKeys 'User4' == 0) then {_KeysBound = _KeysBound + ['Unbound']} else {_KeysBound = _KeysBound + [(actionKeysNamesArray "User4" select 0)]};	 */	

/* _WhiteSpace = ":        ";
_ListBox lnbAddRow [(actionName _ActionKey)+_WhiteSpace+"Craft & Build",_KeysBound select 0];
_ListBox lnbSetPicture [[0, 0], "NerdMods_iBuild\NMIB_Images\NMIB_Action.paa"];
_ListBox lnbSetPicture [[0, 1], "NerdMods_iBuild\NMIB_Images\NMIB_Key.paa"]; */


for "_i" from 1 to parseNumber(localize "STR_NMIB_MenuCount") do
{
	_String = "STR_NMIB_Menu"+str(_i);
	_MenuName = (localize _String);
	_index = _ListBox lbAdd _MenuName;
	_ListBox lbSetPicture [_index, "Nerdmods_iBuild\NMIB_Images\iBuild_GUI_Logo.paa"];
	_ListBox lbSetData [_index, _String+"_Txt"];
};

_ListBox lbSetCurSel 0;

/* _ListBox lnbAddRow [(actionName 'User2')+_WhiteSpace+"Hold to build module",_KeysBound select 1];
_ListBox lnbSetPicture [[1, 0], "NerdMods_iBuild\NMIB_Images\NMIB_Action.paa"];
_ListBox lnbSetPicture [[1, 1], "NerdMods_iBuild\NMIB_Images\NMIB_Key.paa"];

_ListBox lnbAddRow [(actionName 'User3')+_WhiteSpace+"Press to build module [Debug]",_KeysBound select 2];
_ListBox lnbSetPicture [[2, 0], "NerdMods_iBuild\NMIB_Images\NMIB_Action.paa"];
_ListBox lnbSetPicture [[2, 1], "NerdMods_iBuild\NMIB_Images\NMIB_Key.paa"];

_ListBox lnbAddRow [(actionName 'User4')+_WhiteSpace+"Delete module [Debug]",_KeysBound select 3];
_ListBox lnbSetPicture [[3, 0], "NerdMods_iBuild\NMIB_Images\NMIB_Action.paa"];
_ListBox lnbSetPicture [[3, 1], "NerdMods_iBuild\NMIB_Images\NMIB_Key.paa"]; */