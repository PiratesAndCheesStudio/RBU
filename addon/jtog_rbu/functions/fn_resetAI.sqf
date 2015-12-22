/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc This function will be called when the AI should return to the old pos
 */
private ["_position", "_unit", "_i", "_group", "_waypoints"];

params ["_unit"];
_group = group _unit;
_leader = leader _group;

_position = missionNamespace getVariable ["jtog_rbu_last_group_pos", [0,0,0]];

if(jtog_debug) then { systemChat format["JTOG-#RBU Destroy group with leader: %1", _leader]};

//First let all leave the group
_units = units group _unit;

if(jtog_debug) then { systemChat format["JTOG-#RBU Create now new group, they go to: %1", _position]};

//Now lets create a new fresh group
_leader = leader _unit;
[_leader] joinSilent grpNull;
if !(_units isEqualTo []) then {
	(_units - _leader) joinSilent grpNull;
};

//Now send it back
[_leader, 30, _position] call jtog_rbu_fnc_createWaypoint;
jtog_inLoop = 0;
publicVariable "jtog_inLoop";
