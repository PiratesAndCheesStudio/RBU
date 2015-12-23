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

param["_unit"];

private _silencer = switch (_weapon) do {
    case (primaryWeapon _unit): {(primaryWeapon _unit) select 0};
    case (secondaryWeapon _unit): {(secondaryWeapon _unit) select 0};
    case (handgunWeapon _unit): {(handgunWeapon _unit) select 0};
    default {""};
};
_silencer != ""
