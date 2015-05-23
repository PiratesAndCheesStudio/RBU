/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc creates the waypoints with a random radius
 */

//Make marker private
private ['_unit', '_radius', '_position', '_mode'];

//get variables
_unit 	= _this select 0;
_radius = _this select 1;
_position = _this select 2;
_mode = _this select 3;

//Check if mode is given
if(isNil "_mode") then {
	_mode = "AWARE";
};

if(jtog_debug == 1) then { systemChat format["JTOG-#RBU UNIT WILL GO TO %1", _position]};

//Saves the current location of the unit
missionNamespace setVariable['jtog_rbu_last_group_pos', position _unit];

//Get the group of the unit
_group = group _unit;

//Send the patrol to the position
//AS_TODO: Number of waypoints in config
[_group, _position, _radius, jtog_numOfWay, "MOVE", _mode, "", jtog_AIMode, "", "this spawn CBA_fnc_searchNearby"] spawn CBA_fnc_taskPatrol;
