#include "script_component.hpp"
/*
 * Author: flaver
 * Will send the group to the needed location on the map!
 *
 * Arguments:
 * 0: _group Group
 * 1: _position Array
 *
 * Return Value:
 * Void
 *
 */

//Get params
 params ["_group", "_position"];

//So we can later modify it
private _mode = "AWARE";

GVAR(last_group_pos) = getPos (leader _group);

//Send now the AI!
[_group, _position, (GVAR(searchRad)), (GVAR(waypoints)), "MOVE", _mode, "", GVAR(aiMode), "", "this spawn CBA_fnc_searchNearby"] call CBA_fnc_taskPatrol;

//Add perFrame EH
[_group, GVAR(walkTime)] call jtog_rbu_fnc_perFrame;
