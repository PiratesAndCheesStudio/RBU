/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Sends the group to there position
 */

private['_group', '_position', '_wp'];

_group = _this select 0;
_position = _this select 1;
_leader = leader _group;

//Add waypoints
_wp =_group addWaypoint[_position, 0];
[_group, 0] setWaypointType "MOVE";
[_group, 0] setWaypointSpeed  "LIMITED";

[_group, _position] spawn jtog_rbu_support_fnc_checkDistance;