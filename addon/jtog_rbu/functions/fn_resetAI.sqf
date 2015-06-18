/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc This function will be called when the AI should return to the old pos
 */
private ['_position', '_unit', '_i', '_group', '_waypoints'];

_unit = _this select 0;
_group = group _unit;
_leader = leader _group;
_i = 0;

_position = missionNamespace getVariable "jtog_rbu_last_group_pos";

if(jtog_debug == 1) then { systemChat format["JTOG-#RBU Destroy group with leader: %1", _leader]};

//First let all leave the group
_units = units group _unit;
{

	[_x] join grpNull;

} forEach _units;

if(jtog_debug == 1) then { systemChat format["JTOG-#RBU Create now new group, they go to: %1", _position]};

//Now lets create a new fresh group
_i = 0;
{
	  if!(_i == 0) then {
	  	[_x] join grpNull;
	  	[_x] join _leader;
	  };

	  _i = _i + 1;

} forEach _units;

//Now send it back
[_leader, 30, _position] spawn jtog_rbu_fnc_createWaypoint;
jtog_inLoop = 0;