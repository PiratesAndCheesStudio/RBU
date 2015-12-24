#include "script_component.hpp"
/*
 * Author: flaver
 * Module
 *
 * Arguments:
 * 0: _logic Object
 * 1: _units Object
 * 2: _units Boolean
 *
 * Return Value:
 * Void
 *
 * Example:
 * Is a module staring fnc....come on!
 *
 * Public: [Yes/No]
 */

//Get the module params
params ["_logic","_units","_activated"];

if!(_activated) exitWith {};

//Get the config stuff form the module
GVAR(enabled)       = _logic getVariable "enabled";
GVAR(markerName)    = [(_logic getVariable "MarkerName"), true, false] call ace_common_fnc_parseList;
GVAR(blacklist)     = [(_logic getVariable "BlacklistAI"), true, false] call ace_common_fnc_parseList;
GVAR(hearing)       = _logic getVariable "Hearingrange";
GVAR(searchRad)     = _logic getVariable "SearchRadius";
GVAR(numberOfAi)    = _logic getVariable "NumberOfAI";
GVAR(aiMode)        = _logic getVariable "AIMode";
GVAR(walkTime)      = _logic getVariable "MinutesForWalk";
GVAR(waypoints)     = _logic getVariable "NumberOfWaypoints";
GVAR(debug)         = _logic getVariable "Debug";
GVAR(ehIndex)       = nil;

//Check for the markername
if(GVAR(markerName) isEqualTo []) exitWith {
    if(GVAR(debug)) then {
        JTOG_LOG("Empty marker array, rbu will not work!");
    };
};

if(GVAR(debug)) then {JTOG_LOG("RBU init is doen!");};
