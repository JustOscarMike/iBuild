_Ghost = (_this select 0);
_PlotSize = (_this select 1);
_NearestObjects = [];

//_NearestPlot = getPos _Ghost nearestObject "iBuild_Plot"; // Nearest iBuild plot
_NearestPlot = nearestObjects [player, ["iBuild_Plot"], (2.5 + 5 *_PlotSize)*3];
if (count _NearestPlot != 0) then {_NearestObjects = [_NearestPlot select 0]}; // Add nearest iBuild plot if one is found

_NearestBuilding = nearestBuilding _Ghost; // Nearest building
if (!isNull _NearestBuilding) then {_NearestObjects = _NearestObjects + [_NearestBuilding]}; // Add nearest building to array if there is one

/* _NearestObjects = (nearestObjects [_Ghost, [], 10*3]) - ([_Ghost,Player]+Helpers); // Nearest objects minus placement ghost, and the player 
_NearestObjects = _NearestObjects - (nearestObjects [_Ghost, ["iBuild_Module"], 10*3]); // Remove iBuild modules from nearest objects
if (count _NearestObjects != 0) then {_NearestObjects = _NearestObjects + [_NearestObjects select (count _NearestObjects)-1]}; // Add nearest object to array if there is one
 */

_CollisionDetected = [_Ghost,(5*_PlotSize),0,_NearestObjects] call NMIB_fnc_CollisionCheck; // Check for any collisions with the nearest building or object

!_CollisionDetected;