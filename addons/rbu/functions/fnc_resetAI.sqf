#include "script_component.hpp"
/*
 * Author: flaver
 * Resets the AI, when the walktime is over
 *
 * Arguments:
 * 0: _group Group
 *
 * Return Value:
 * Void
 */
params["_group"];

if(GVAR(debug)) then {
    JTOG_LOG("Walktime is over, group will be destroyed!");
};

private _units = units _group;
//So we can later modify it
private _mode = "AWARE";

//Create a new group
_group = createGroup (side _group);
_units joinSilent _group;

//Send AI back
//Later task send them back on there original track
[_group, GVAR(last_group_pos), (GVAR(searchRad)), (GVAR(waypoints)), "MOVE", _mode, "", GVAR(aiMode), "", "this spawn CBA_fnc_searchNearby"] call CBA_fnc_taskPatrol;
