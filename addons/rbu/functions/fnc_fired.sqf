#include "script_component.hpp"
/*
 * Author: flaver
 * Fired EH
 *
 * Arguments:
 * 0: _unit Object
 * 1: _weapon Object
 *
 * Return Value:
 * Void
 *
 */

if !(isServer) exitWith {};
if !(isNil QGVAR(ehIndex)) exitWith {};

//Get all needed vars
params ["_unit", "_weapon"];

if !(isPlayer _unit && GVAR(enabled)) exitWith {};

private _useCoefOnHearing = [_unit, _weapon] call FUNC(checkWeapon);
private _hearing = GVAR(hearing);
private _bestMarker = "";
private _usedMarker = "";
private _groups = [];

if(_useCoefOnHearing) then {_hearing = round ((GVAR(hearing)/100) * 10);};

//Check from witch marker we fired
{
    if(_bestMarker isEqualTo "") then {
        _bestMarker = (getMarkerPos _x) distance (getPos _unit);
        _usedMarker = _x;
    } else {
        _currentMarker = (getMarkerPos _x) distance (getPos _unit);
        if(_currentMarker < _bestMarker) then {
            _bestMarker = _currentMarker;
            _usedMarker = _x;
        };
    };
    nil
} count GVAR(markerName);

private _groups = [];

if(GVAR(debug)) then {
    diag_log format["Used markers is %1", _usedMarker];
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
        if (!isNull _x || {{alive _x} count units _x != 0}) then {
            _leader = leader _x;

            //Check now if they can hear the shoot
            _result = (getMarkerPos _usedMarker) distance (getPos _leader);
            if (_result < GVAR(hearing)) then {

                //Check if we can use this group
                if ((side _leader) != (side _unit) && (side _leader) != civilian && (side _leader) getFriend (side _unit) < 0.6) then {
                    _groups pushBack [_result, _x];
                };
            };
        };
        nil
    } count allGroups;

    _groups sort true;

    if(GVAR(debug)) then {
        JTOG_LOG_ARG1("Group count: ", _groups);
    };

    if!(_groups isEqualTo []) then {
        if(GVAR(debug)) then {
            JTOG_LOG("We found a group of heros! Lets do this!");
        };
        _group = _groups call FUNC(checkGroup);
        [_group, (getPos _unit)] call FUNC(sendAI);
    };
};
