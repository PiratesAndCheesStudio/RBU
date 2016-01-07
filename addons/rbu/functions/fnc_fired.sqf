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
private _hearing = GVAR(hearing);
private _bestMarker = nil;
private _usedMarker = nil;
private _groups = [];

if(_useCoefOnHearing) then {_hearing = round ((GVAR(hearing)/100) * 10);};

//Check from witch marker we fired
{
    if(isNil "_bestMarker") then {
		_bestMarker = (getMarkerPos _x) distance _unit;
        _usedMarker = _x;
	} else {
		_currentMarker = (getMarkerPos _x) distance _unit;
		if(_currentMarker < _bestMarker) then {
			_bestMarker = _currentMarker;
            _usedMarker = _x;
		};
	};
	nil
} count GVAR(markerName);

private _groups = [];

if(GVAR(debug)) then {
    JTOG_LOG("RBU will check now if we hear something");
    JTOG_LOG_ARG1("Used player is ", name _unit);
    JTOG_LOG_ARG1("Used markers is ", _usedMarker);
    JTOG_LOG_ARG1("Distance is ", _bestMarker);
    JTOG_LOG_ARG1("Hearing is ", _hearing);
};

if(_bestMarker < _hearing) then {

    if(GVAR(debug)) then {
        JTOG_LOG("Now we sending troops!");
    };

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

    if(GVAR(debug)) then {
        JTOG_LOG_ARG1("Group is ", _group);
    };

    if!(_groups isEqualTo []) then {
        _group = _groups call FUNC(checkGroup);
        [_group, (getPos _unit)] call FUNC(sendAI);
    };
};
