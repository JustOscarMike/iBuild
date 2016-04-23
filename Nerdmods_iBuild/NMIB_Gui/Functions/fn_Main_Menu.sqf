_ListBox = _this select 0;
_Id = _this select 1;

_InfoBox = ((uiNamespace getVariable 'NMIB_Setup_GUI') displayCtrl 1100);
_String = _ListBox lbData _Id;
_Content = (localize _String);

_Content = switch (true) do
{
	case (_String == "STR_NMIB_Menu2_Txt"):
	{
		//_ActionKey = 'User'+ str (getNumber (missionConfigFile >> "iBuild_Config" >> "Controls" >> "ActionKey"));
		_ActionKeyBind = if (count actionKeys NMIB_ActionKey1 == 0) then {"Unbound"} else {(actionKeysNamesArray NMIB_ActionKey1 select 0)};
		_ActionKeyText = format ['Perform Action:<br/>%1<br/>%2<br/>',(actionName NMIB_ActionKey1),_ActionKeyBind];
		
		//_PlotToggleKey = 'User'+ str (getNumber (missionConfigFile >> "iBuild_Config" >> "Controls" >> "PlotToggleKey"));
		_PlotToggleKeyBind = if (count actionKeys NMIB_ActionKey2 == 0) then {"Unbound"} else {(actionKeysNamesArray NMIB_ActionKey2 select 0)};
		_PlotToggleKeyText = format ['Toggle Plot:<br/>%1<br/>%2<br/>',(actionName NMIB_ActionKey2),_PlotToggleKeyBind];
		
		format['<br/>Below is a list of all the keys utilised by iBuild:<br/><br/>[Name]<br/>[Action]<br/>[Bound Key]<br/><br/>%1<br/>%2<br/><br/>If any of the above keys are unbound, please bind them:<br/>Configure > Controls > Keyboard > Show: Custom Controls',_ActionKeyText,_PlotToggleKeyText];	
	};
	case (_String == "STR_NMIB_Menu4_Txt"):
	{
		_Items = "<br/>Construction materials are required to perform certain actions. The list below shows each item and what they are used for.<br/><br/>";
		{
			_Classname = configName _x;
			
			_Picture = getText (configFile >> "CfgWeapons" >> _Classname >> "picture");
			_Name = getText (configFile >> "CfgWeapons" >> _Classname >> "displayName");
			_Info = getText (configFile >> "CfgWeapons" >> _Classname >> "description");
			
			//_Items = _Items + format['%1',time];
			_Items = _Items + format["<img size='4' image='%1'/><br/><t size='1.8'>%2</t><br/>%3<br/><br/>",_Picture,_Name,_Info];
		} forEach ("inheritsFrom _x == (configFile >> 'CfgWeapons' >> 'NMIB_Item')" configClasses (configFile >> "CfgWeapons"));
		_Items;
	};
	default
	{
		format[_Content,toUpper (name player)];
	};
};

_InfoBox ctrlSetStructuredText parseText format["<t shadow='0' size='1' font='PuristaMedium' align='center'>%1</t>",_Content];