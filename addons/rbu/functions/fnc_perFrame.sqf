#include "script_component.hpp"
/*
 * Author: flaver
 * PerFrame EH
 *
 * Arguments:
 * 0: Argument Name <TYPE>
 *
 * Return Value:
 * Return Name <TYPE>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: [Yes/No]
 */
params["_group", "_walkTime"];

 [{
    params["_args", "_idPFH"];
    GVAR(ehIndex) = _idPFH;
    _args params ["_i", "_group", "_walkTime"];

    private _alivecount = ({alive _x}) count units _group;

    if!(_alivecount > 0) exitWith {
        GVAR(ehIndex) = nil;
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    if!(_i < _walkTime) exitWith {
        [_group] call jtog_rbu_fnc_resetAI;
    };
    _args set [0, _i + 1];
}, 10, [0, _group, _walkTime]] call CBA_fnc_addPerFrameHandler;
