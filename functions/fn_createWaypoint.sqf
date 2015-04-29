/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc creates the waypoints with a random radius
 */

//Make marker private
private ['_unit', '_radius', '_position'];

//get variables
_unit 	= _this select 0;
_radius = _this select 1;
_position = _this select 2;

if(jtog_debug == 1) then { systemChat format["JTOG-#RBU UNIT WILL GO TO %1", _position]};

//Saves the current location of the unit
missionNamespace setVariable['jtog_rbu_last_group_pos', position _unit];

_group = group _unit;

//_group addWaypoint[position _player, _radius];
[_group, _position, _radius] spawn CBA_fnc_taskPatrol;
