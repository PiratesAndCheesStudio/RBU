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

//Get all needed vars
params ["_unit", "_weapon"];

if !(isPlayer _unit && GVAR(enabled)) exitWith {};

private _useCoefOnHearing = [_unit, _weapon] call FUNC(checkWeapon);

if(_useCoefOnHearing) then {_hearing = round (GVAR(hearing) * 10);};

//Check from witch marker we fired
{
    if(isNil "_bestMarker") then {
		_bestMarker = getMarkerPos _x distance _unit;
		_usedMarker = _x;
	} else {
		_currentMarker = getMarkerPos _x distance _unit;
		if(_currentMarker < _bestMarker) then {
			_bestMarker = _x;
		};
	};
	nil
} count GVAR(markerName);

private _finalDist = floor(_bestMarker);
private _groups = [];

if(GVAR(debug)) then {}; //Do here some dbug later

if(_finalDist < GVAR(hearing)) then {

    //Loop to allGroups and select the nearest one
    {

        _leader = leader _x;

        //Check now if they can hear the shoot
        _result = (getMarkerPos _bestMarker) distance _leader;
        if(_result < GVAR(hearing)) then {

            //AS_TODO: Check for resistance side
            if({side _leader != playerSide} && {side _leader != civilian}) then {
                _groups pushBack _x;
            };
        };
        nil
    } count allGroups;

    if!(_groups isEqualTo []) then {
        _group = _groups call FUNC(checkGroup);
        [_group, (getPos _unit)] call FUNC(sendAI);
    };
};
