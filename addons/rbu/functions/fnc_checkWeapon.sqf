#include "script_component.hpp"
/*
 * Author: flaver
 * Check the weapon for silencer
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

params["_unit", "_weapon"];

private _silencer = switch (_weapon) do {
    case (primaryWeapon _unit): {(primaryWeaponItems _unit) select 0};
    case (secondaryWeapon _unit): {(secondaryWeaponItems  _unit) select 0};
    case (handgunWeapon _unit): {(handgunItems _unit) select 0};
    default {""};
};

if (_silencer != "") exitWith {
    true
};
false
