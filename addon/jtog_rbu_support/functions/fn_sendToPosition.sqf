/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Sends the group to there position
 */

private['_group', '_position'];

_group = _this select 0;
_position = _this select 1;


//Add waypoint
_group addWaypoint[_position, 0];
