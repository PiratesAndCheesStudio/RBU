#include "script_component.hpp"
/*
 * Author: flaver
 * This will check the given groups and
 * create a new group if needed
 *
 * Arguments:
 * 0: _groups Group
 *
 * Return Value:
 * _group Group
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: [Yes/No]
 */

params["_groups"];

//So we will take the first group and start building it form there
private _group     = _groups select 0;
private _groupSize = count _group;

//If we have only one group in the array then go back
//If we have the perfect size of the group return too
if(_groupSize == GVAR(numberOfAi) || {count _groups} == 1) exitWith {_group};

//So our group is too big
if (_groupSize > GVAR(numberOfAi)) then {

    /*
    If we have a group of 10 units
    and the missionmaker want only groups of 4 units,
    we will remove 4 units from the group and will send them to the location of the shoot.
    */
    {
        if!(_forEachIndex < GVAR(numberOfAi)) then {

            if(isNil "_leader") then {
                _leader = _x;
            } else{
                _x joinSilent _leader;
            };

        };
        nil
    } forEach units _group;

    _group = group _leader;

} else { //Too small

    /*
    If we have a group of 4 units
    and the missionmaker want only groups of 10 units,
    we will add 7 units from the second group and will send them to the location of the shoot.
    */
    _numbersToAd =  GVAR(numberOfAi) - _groupSize;
    {
        if!(_forEachIndex < _numbersToAd) then {

            if(isNil "_leader") then {
                _leader = leader _group;
            } else{
                _x joinSilent _leader;
            };

        };
        nil
    } forEach units _groups select 1;

};

_group
