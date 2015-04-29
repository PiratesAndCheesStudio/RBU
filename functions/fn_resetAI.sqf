/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc This function will be called when the AI should return to the old pos
 */
private ['_position', '_unit'];

_unit = _this select 0;

systemChat "I WILL GO NOW BACK!";
_position = missionNamespace getVariable "jtog_rbu_last_group_pos";
[_unit, 0, _position] spawn jtog_rbu_fnc_createWaypoint;
jtog_inLoop = 0;