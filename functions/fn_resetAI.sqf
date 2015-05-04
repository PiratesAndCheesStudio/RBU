/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc This function will be called when the AI should return to the old pos
 */
private ['_position', '_unit', '_i', '_group', '_waypoints'];

_unit = _this select 0;
_group = group _unit;
_waypoints = waypoints _group;
_i = 0;
systemChat format['%1 waypoints', _waypoints];
_position = missionNamespace getVariable "jtog_rbu_last_group_pos";

//Remove all waypoints
while{(count _waypoints) > 0} do {
	deleteWaypoint [_group, _i];
	_i = _i + 1;
	sleep 1;
};

[_unit, 0, _position] spawn jtog_rbu_fnc_createWaypoint;
jtog_inLoop = 0;