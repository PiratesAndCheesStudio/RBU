#include "script_component.hpp"
/*
 * Author: flaver
 * Will send the group to the needed location on the map!
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

//Get params
 params ["_group", "_position"];

//So we can later modify it
private _mode = "AWARE";

jtog_rbu_last_group_pos = getPos _group;

//Send now the AI!
[_group, _position, (GVAR(searchRad)), (GVAR(waypoints)), "MOVE", _mode, "", GVAR(aiMode), "", "this spawn CBA_fnc_searchNearby"] call CBA_fnc_taskPatrol;
