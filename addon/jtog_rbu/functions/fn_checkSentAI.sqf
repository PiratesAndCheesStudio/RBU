/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Checks if we can start the script againg
 */
params ["_unit", "_walkTime"];

[{
	params ["_args", "_idPFH"];
	_args params ["_i", "_unit", _walkTime];
	jtog_inLoop = 1;

	private _alivecount = ({alive _x} count units _unit);

	if!(_alivecount > 0) exitWith {
		jtog_inLoop = 0;
		[_idPFH] call CBA_fnc_removePerFrameHandler;
	};

	if!(_i < _walkTime) exitWith {
		[_unit] call jtog_rbu_fnc_resetAI;
		[_idPFH] call CBA_fnc_removePerFrameHandler;
	};
	_args set [0, _i + 1];
} 10, [0, _unit, _walkTime]] call CBA_fnc_addPerFrameHandler;
