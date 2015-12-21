/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc hanldes the AI
 */

//Make marker private
private ["_units", "_unit", "_i", "_hearing", "_unitBlacklist", "_nothingHear", "_bestMarker", "_usedMarker", "_currentMarker", "_finalDist", "_result"];
//Get values
params ["_unit", "", "", "", "_ammo"];

if !(isPlayer _unit || (jtog_inLoop == 0)) exitWith {};

_i = 0;
_units = [];
_hearing = jtog_hearing;

_unitBlacklist = [
	"B_soldier_M_F",
	"B_Sharpshooter_F",
	"B_Recon_Sharpshooter_F",
	"B_recon_M_F",
	"B_spotter_F",
	"B_sniper_F",
	"B_ghillie_ard_F",
	"B_ghillie_sard_F",
	"B_ghillie_lsh_F",
	"B_MU_CTRG_M_F",
	"B_MU_CTRG_M_Mk18_F",
	"B_MU_CTRG_sniper_F",
	"B_MU_CTRG_spotter_F",
	"B_G_Soldier_M_F",
	"B_G_Sharpshooter_F",
	"O_Sharpshooter_F",
	"O_soldier_M_F",
	"O_recon_M_F",
	"O_soldier_M_F",
	"O_soldierU_M_F",
	"O_Urban_Sharpshooter_F",
	"CAF_AG_EEUR_R_SVD",
	"CAF_AG_ME_T_SVD",
	"O_MU_islam_M_F",
	"CAF_AG_AFR_P_SVD",
	"ibr_mol_soldier_sniper",
	"I_Soldier_M_F",
	"I_Spotter_F",
	"I_Sniper_F",
	"I_ghillie_ard_F",
	"I_ghillie_sard_F",
	"I_ghillie_lsh_F"
];

//First check weapon for silancer and ammo
_nothingHear = [_unit, _hearing] call jtog_rbu_fnc_checkWeapon;

if(_nothingHear) then {_hearing = round (_hearing / 100) * 10;};

//check wich given marke is closer and send them there
{
	if(isNil "_bestMarker") then {
		_bestMarker = getMarkerPos _x distance _unit;
		_usedMarker = _x;
	} else {
		_currentMarker = getMarkerPos _x distance _unit;
		if(_currentMarker < _bestMarker) then {
			_bestMarker = _currentMarker;
			_usedMarker = _x;
		};
	};
	nil
} count jtog_markerNames;


//Round it
_finalDist = floor(_bestMarker);

//DEBUG
if (jtog_debug == 1) then { systemChat format["JTOG-#RBU: Player: %1", position player] };
if (jtog_debug == 1) then { systemChat format["JTOG-#RBU: Unit: %1", position _unit] };

//Check for distance
if (_finalDist < _hearing) then {
	//Loop through all units
	//AS_TODO: Check for a better solution
	{
		//Check the loop
		if !(_forEachIndex == jtog_maxAI) then {
			//Check for AI
			if (!isPlayer _x && {(side _x) != civilian} && {side _x != playerside}) then {
				if !(typeof _x in _unitBlacklist) then {
					//Check distance
					_result = (getMarkerPos _usedMarker) distance _x;
					if (_result < _hearing) then {
						//push the unit in a array
						_units pushBack _x;
					};
				};
			};
		};
		nil
	} forEach allUnits;

	if !(_units isEqualTo []) then {
		[_units, _unit] call jtog_rbu_fnc_sendAI;
	};
};
