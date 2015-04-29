/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc hanldes the AI
 */

//Make marker private
private ['_marker', '_checkDistanc', '_unit', '_weapon', '_i', '_units'];

//Get values
_unit 		= _this select 0;
_weapon 	= _this select 1;
_i 			= 0;
_units 		= [];

//Get the distance between player and marker
_dist = getMarkerPos jtog_markerName distance _unit; 

//Round it
_finalDist = round _dist;

//DEBUG
if(jtog_debug == 1) then { systemChat format["JTOG-#RBU: Player: %1", position player] };
if(jtog_debug == 1) then { systemChat format["JTOG-#RBU: Unit: %1", position _unit] };

//Check for distance
if(_finalDist < jtog_hearing) then {
	
	//Loop through all units
	//AS_TODO: Check for a better solution
	{	
		
		//Check the loop
		if!(_i == jtog_maxAI) then {
			//Check for AI
			if!(isPlayer _x) then {

				//save the unit in a array
				_units set [count _units, _x];

				_i = _i + 1;

			};

		};

	} forEach allUnits;
};

[_units, _unit] spawn jtog_rbu_fnc_sendAI;