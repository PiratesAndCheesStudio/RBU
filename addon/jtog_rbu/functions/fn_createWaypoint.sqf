/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc creates the waypoints with a random radius
 */

params ["_unit", "_radius", "_position", ["_mode", "AWARE", [""]];

if(jtog_debug == 1) then { systemChat format["JTOG-#RBU UNIT WILL GO TO %1", _position]};

//Saves the current location of the unit
jtog_rbu_last_group_pos = getPos _unit

//Get the group of the unit
private _group = group _unit;

//Send the patrol to the position
//AS_TODO: Number of waypoints in config
[_group, _position, _radius, jtog_numOfWay, "MOVE", _mode, "", jtog_AIMode, "", "this spawn CBA_fnc_searchNearby"] call CBA_fnc_taskPatrol;
