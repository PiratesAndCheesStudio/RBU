#include "script_component.hpp"
/*
 * Author: flaver
 * Fired EH
 *
 * Arguments:
 * 0: Argument Name <TYPE>
 *
 * Return Value:
 * Return Name <TYPE>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: [Yes/No]
 */

if !(isServer) exitWith {};

params ["_unit"];
if !(isPlayer _unit && GVAR(enabled)) exitWith {};

private _useCoefOnHearing = _unit call FUNC(checkWeapon);

if(_useCoefOnHearing) then {_hearing = round (GVAR(hearing) * 10;)};

//Check from witch marker we fired
{
    if(isNil "_bestMarker") then {
		_bestMarker = getMarkerPos _x distance _unit;
		_usedMarker = _x;
	} else {
		_currentMarker = getMarkerPos _x distance _unit;
		if(_currentMarker < _bestMarker) then {
			_bestMarker = _currentMarker;
			_usedMarker = _x;
		};
	};
	nil
} count GVAR(markerName);

private _finalDist = floor(_bestMarker);

if(GVAR(debug)) then {}; //Do here some dbug later

if(_finalDist < GVAR(hearing)) then {

    //Loop to allGroups and select the nearest one
    {
        

    } count allGroups;


};
