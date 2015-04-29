/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Checks if the we we can start the script againg
 */

private ['_leader', '_units', '_alivecount', '_i', '_position', ''];

_leader = _this select 0;
_i = 0;

_units = units group _leader;

while {true} do {
	jtog_inLoop = 1;

	_alivecount = ({alive _x} count units _leader);

  	if!(_alivecount > 0) exitWith {jtog_inLoop = 0;};

  	//if(_i > 60) exitWith {[_leader] spawn jtog_rbu_fnc_resteAI;};
  	_i = _i + 1; 
  	sleep 1;
};