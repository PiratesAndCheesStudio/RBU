/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Checks the fired weapon if it have a effect on ai
 */

private ['_unit', '_items', '_arr', '_hearing'];

//Get given values
_unit = _this select 0;
_arr = ["muzzle_snds_H", "muzzle_snds_L", "muzzle_snds_M", "muzzle_snds_B","muzzle_snds_H_MG"];
_hearing = _this select 1;
_result = false;

//Get attachements
_items = primaryWeaponItems _unit;

{
    if (_x in _arr) then {
    	_result = true;
    };

} forEach _items;

_result
