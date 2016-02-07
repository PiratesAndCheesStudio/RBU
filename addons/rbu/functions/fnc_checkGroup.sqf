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
 */

//So we will take the first group and start building it form there
private _group = (_this select 0) select 1;
private _groupSize = {alive _x} count units _group;

//If we have only one group in the array then go back
//If we have the perfect size of the group return too
if (_groupSize == GVAR(numberOfAi) || {count _this == 1}) exitWith {_group};

//So our group is too big
if (_groupSize > GVAR(numberOfAi)) then {

    /*
    If we have a group of 10 units
    and the missionmaker want only groups of 4 units,
    we will remove 4 units from the group and will send them to the location of the shoot.
    */
    private _units = units _group;
    _units resize GVAR(numberOfAi); // @TODO check if -1 is required
    _group = createGroup (side _group);
    _units joinSilent _group;

} else { //Too small

    /*
    If we have a group of 4 units
    and the missionmaker want only groups of 10 units,
    we will add 7 units from the second group and will send them to the location of the shoot.
    */
    private _units = units _group;
    _numbersToAdd =  GVAR(numberOfAi) - _groupSize;
    _group = createGroup (side _group);
    _group2 = (_this select 1) select 1;
    private _units2 = units _group2;
    _units2 resize _numbersToAdd; // @TODO check if -1 is required
    _units append _units2;
    _units joinSilent _group;
};

_group
