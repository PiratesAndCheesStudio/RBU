/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Checks the fired weapon if it have a effect on ai
 */


//Get given values
params ["_unit", "_hearing"];
private _silencer = switch (_weapon) do {
    case (primaryWeapon _firer): {(primaryWeaponItems _firer) select 0};
    case (secondaryWeapon _firer): {(secondaryWeaponItems _firer) select 0};
    case (handgunWeapon _firer): {(handgunItems _firer) select 0};
    default {""};
};
if (_silencer != "") exitWith {
    true
};
false
