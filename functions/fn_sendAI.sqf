/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Sends the ai to a check
 */

private ['_units', '_unit', '_i'];

_units = _this select 0;
_unit  = _this select 1;
_i 	   = 0;

systemChat format['AARRAY: %1', count _units];

//We found only one unit so just seend it
if(count _units == 1) then {

	_singleAI = _units select 0;

	[_singleAI, round random jtog_searchTerm, position _unit] spawn jtog_rbu_fnc_createWaypoint;
	[_singleAI, jtog_walkTime] spawn jtog_rbu_fnc_checkSendedAI;

} else {
	
	//Just the first unit is the leader
	_leader =  _units select 0;
	[_leader] join grpNull;

	//Join the leader in the group
	{
	  if!(_i == 0) then {
	  	[_x] join _leader;
	  };

	  _i = _i + 1;

	} forEach _units;

	//Create waypoints and watch if they are alive
	[_leader, round random jtog_searchTerm, position _unit] spawn jtog_rbu_fnc_createWaypoint;
	[_leader, jtog_walkTime] spawn jtog_rbu_fnc_checkSendedAI;
};
