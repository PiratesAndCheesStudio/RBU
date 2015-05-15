#include "\userconfig\1stJTOG\rbu.hpp"; 
/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Checks the fired weapon if it have a effect on ai
 */

private ['_unit', '_items', '_arr', '_hearing'];

//Get given values
_unit = _this select 0;
_arr = jtog_rbu_silencer;
_hearing = _this select 1;

//Get attachements
_items = primaryWeaponItems _unit; 

{ 
    if (_x in _arr) then {
        _hearing = round (_hearing / 100) * 10;
    };
     
} forEach _items; 

['jtog_rbu_hearing', [_hearing]] spawn CBA_fnc_localEvent;

