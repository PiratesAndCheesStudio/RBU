#include "\userconfig\1stJTOG\rbu.hpp"; 
/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Checks the fired weapon if it have a effect on ai
 */

private ['_unit', '_items', '_arr'];

//Get given values
_unit = _this select 0;
_arr = jtog_rbu_silencer;

//Get attachements
_items = primaryWeaponItems _unit; 

{ 
    if (_x in _arr) then {
        hint format ["Players Pri weapon has a %1", _x]; 
    };
     
} forEach _items; 


