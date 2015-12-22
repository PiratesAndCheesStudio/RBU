/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Sends the ai to a check
 */

private ["_leader"];

params ["_groups", "_unit"];


{
	//We found only one unit so just seend it
	//Just the first unit is the leader
	_leader = leader _x;
	[_leader] joinSilent grpNull;
	if !(_units isEqualTo []) then {
		(_units - _leader) joinSilent grpNull;
	};

	//CBA-Event
	["RBU_Send_AI", [_units, _leader, _unit, position _unit]] call CBA_fnc_globalEvent;

	//Create waypoints and watch if they are alive
	[_leader, floor(random jtog_searchTerm), position _unit] call jtog_rbu_fnc_createWaypoint;
	[_leader, jtog_walkTime] call jtog_rbu_fnc_checkSentAI;
} count _groups;
