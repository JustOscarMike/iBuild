_Object = (_this select 0);
_Padding = (_this select 1);

_bBR = boundingBoxReal _Object;
_p1 = _bBR select 0;
_p2 = _bBR select 1;
_maxWidth = (abs ((_p2 select 0) - (_p1 select 0)))/2;
_maxLength = (abs ((_p2 select 1) - (_p1 select 1)))/2;
_maxHeight = (abs ((_p2 select 2) - (_p1 select 2)))/2;

if (_Padding > 0) then
{
	_maxWidth = _maxWidth+_Padding;
	_maxLength = _maxLength+_Padding;
	//_maxHeight = _maxHeight*_Padding;
};

_NE = (_Object modelToWorld [_maxWidth,_maxLength,0]); //NE
_SE = (_Object modelToWorld [_maxWidth,-_maxLength,0]); //SE
_NW = (_Object modelToWorld [-_maxWidth,_maxLength,0]); //NW
_SW = (_Object modelToWorld [-_maxWidth,-_maxLength,0]); //SW

[_NE,_SE,_NW,_SW,_maxWidth,_maxLength,_maxHeight]