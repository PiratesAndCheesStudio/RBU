#include "script_component.hpp"
/*
 * Author: flaver
 * Module
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

//Get the module params
params ["_logic","_units","_activated"];

if!(_activated) exitWith {};

//Get the config stuff form the module
GVAR(enabled) = _logic getVariable "enabled";
GVAR(markerName)   	= [(_logic getVariable "MarkerName"), true, false] call ace_common_fnc_parseList
GVAR(blacklist)   	  = [(_logic getVariable "BlacklistAI"), true, false] call ace_common_fnc_parseList
GVAR(hearing)  	    = _logic getVariable "Hearingrange";
GVAR(searchRad)   	  = _logic getVariable "SearchRadius";
GVAR(numberOfAi)  	    = _logic getVariable "NumberOfAI";
GVAR(aiMode)  	    = _logic getVariable "AIMode";
GVAR(walkTime)  	  = _logic getVariable "MinutesForWalk";
GVAR(waypoints)  	  = _logic getVariable "NumberOfWaypoints";
GVAR(debug)        = _logic getVariable "Debug";

//Check for the markername
if(GVAR(markerName) isEqualTo []) exitWith {};
