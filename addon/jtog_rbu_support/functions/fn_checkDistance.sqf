/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc This is a simple function to check all 10 seconds the position
 */

private ['_group', '_positionToGo', '_currentPosition', '_doLoop'];

_group = _this select 0;
_positionToGo = _this select 1;
_doLoop = true;

while {_doLoop} do {

	if((leader _group distance _positionToGo) <= 500) then {

		_doLoop = false;
		systemChat format ["Im there and my distance is %1", leader _group distance _positionToGo]

	};

};