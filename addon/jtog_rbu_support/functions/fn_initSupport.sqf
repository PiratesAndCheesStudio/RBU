/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Inits the AI Module
 */

//private stuff
private ['_leader', '_i', '_position', '_group'];


//Module for the loadouts
//variables of the module
_logic 		= _this select 0;
_units 		= _this select 1;
_activated 	= _this select 2;
_i = 0;

//Activated
if!(_activated) exitWith {};

//Assing variables
_position = _logic getVariable["PositionToDrive", ""];

if (isNil "_position") exitWith {systemChat "#RBU-SUPPORT: NO MARKER POSITION GIVEN";};
if (isNil "_units" || count _units == 1) exitWith {systemChat "#RBU-SUPPORT: NO UNITS GIVEN!";};

//Make a basic setup for the group
{

	[_x] join grpNull;

	if(_i == 0) then {

		_leader = _x;
		_i = _i + 1;

	} else {

	  	[_x] join _leader;

	};


} forEach _units;

//AS_TODO: Add here the gear and vehicle stuff

_position = getMarkerPos _position;
_group = group _leader;
//Send the group to the position
[_group, _position] spawn jtog_rbu_support_fnc_sendToPosition;