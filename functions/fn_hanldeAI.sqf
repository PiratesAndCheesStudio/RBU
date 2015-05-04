/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc hanldes the AI
 */

//Make marker private
private ['_marker', '_checkDistanc', '_unit', '_weapon', '_i', '_units', '_bestMarker', '_currentMarker', '_usedMarker', '_result'];

//Get values
_unit 		= _this select 0;
_weapon 	= _this select 1;
_i 			= 0;
_units 		= [];

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
			systemChat format['RUN TO MARKER: %1', _x];
		};

	};
	
} forEach jtog_markerNames;


//Round it
_finalDist = round _bestMarker;

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
				//Check distance
				_result = getMarkerPos _usedMarker distance _x;
				_result = round _result;
				if(_result < jtog_hearing) then {
					//save the unit in a array
					_units set [count _units, _x];

					_i = _i + 1;
				};

			};

		};

	} forEach allUnits;

	if!(count _units == 0) then {
		[_units, _unit] spawn jtog_rbu_fnc_sendAI;
	}
};