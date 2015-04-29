/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Inits the AI Module
 */ 

//Module for the loadouts
//variables of the module
_logic 		= _this select 0;
_units 		= _this select 1;
_activated 	= _this select 2;

//Activated
if!(_activated) exitWith {};

//Get the config stuff form the module
_markerName = _logic getVariable ['MarkerName', ''];
_hearing 	= _logic getVariable ['Hearingrange', 3000];
_searchRad 	= _logic getVariable ['SearchRadius', 200];
_numberAI	= _logic getVariable ['NumberOfAI', 3];
_AIMode		= _logic getVariable ['AIMode', 1];
_walkTime 	= _logic getVariable ['MinutesForWalk', 60];
_debug 		= _logic getVariable ['Debug', 0];

//Set debug public
jtog_debug	= _debug;
publicVariable "jtog_debug";

//Say that we now starting all the good stuff
if(jtog_debug == 1) then { systemChat "JTOG-#RBU starting init....." };

//If no marker name leave it!
if(_markerName == "") exitWith { systemChat "JTOG-#RBU ERROR! NO MARKER NAME SET! :(" };

//Set public variables
jtog_markerName = _markerName;
jtog_hearing 	= _hearing;
jtog_maxAI		= _numberAI;
jtog_searchTerm = _searchRad;
jtog_AIMode		= _AIMode;
jtog_inLoop		= 0;
jtog_walkTime	= _walkTime;
publicVariable "jtog_markerName";
publicVariable "jtog_hearing";
publicVariable "jtog_maxAI";
publicVariable "jtog_AIMode";
publicVariable "jtog_inLoop";
publicVariable "jtog_walkTime";

//Call the handle distance between player and marker
player addEventHandler["Fired", {
	if(jtog_inLoop == 0) then {
		[_this select 0, _this select 1] spawn jtog_rbu_fnc_hanldeAI;
	};
}]; 

//Give feedback if its done!
if(jtog_debug == 1) then { systemChat "JTOG-#RBU IS NOW READY TO GO STEIL!!" };

