/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Checks if the we we can start the script againg
 */

private ['_unit', '_units', '_alivecount', '_i', '_position', '_walkTime'];

_unit = _this select 0;
_walkTime = _this select 1;//Thx arma
_i = 0;

_units = units group _unit;

while {true} do {
	jtog_inLoop = 1;

	_alivecount = ({alive _x} count units _unit);

  	if!(_alivecount > 0) exitWith {jtog_inLoop = 0;};

  	if!(_i < _walkTime) exitWith {[_unit] spawn jtog_rbu_fnc_resetAI;};
  	_i = _i + 1; 
  	sleep 10;
};