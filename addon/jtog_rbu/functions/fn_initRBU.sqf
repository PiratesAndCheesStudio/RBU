/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc Inits the AI Module
 */

//Module for the loadouts
//variables of the module
params ["_logic", "_units", "_activated"];

//Activated
if !(_activated) exitWith {};

//Get the config stuff form the module
private _markerName 	= call compile(_logic getVariable ['MarkerName', '[]']);//Because arma has no array type
private _blackList 	= call compile(_logic getVariable ['BlacklistAI', '[]']);//Because arma has no array type
private _blackListGroup = call compile(_logic getVariable ['BlacklistAI', '[]']);//Because arma has no array type
private _hearing 	= _logic getVariable ['Hearingrange', 3000];
private _searchRad 	= _logic getVariable ['SearchRadius', 200];
private _numberAI	= _logic getVariable ['NumberOfAI', 3];
private _AIMode		= _logic getVariable ['AIMode', 'NORMAL'];
private _walkTime 	= _logic getVariable ['MinutesForWalk', 60];
private _waypoints	= _logic getVariable ['NumberOfWaypoints', 10];
private _debug 		= _logic getVariable ['Debug', 0];

//Set debug public
jtog_debug	= _debug;
publicVariable "jtog_debug";

//If no marker name leave it!
if(isNil "_markerName") exitWith { systemChat "JTOG-#RBU ERROR! NO MARKER NAME SET! :(" };

//Say that we now starting all the good stuff
if(jtog_debug == 1) then { systemChat "JTOG-#RBU starting init....." };

//Set public variables
jtog_markerNames 	= _markerName;
jtog_blackList		= _blackList;
jtog_blackListGroup	= _blackListGroup;
jtog_hearing 		= _hearing;
jtog_maxAI		= _numberAI;
jtog_searchTerm 	= _searchRad;
jtog_AIMode		= _AIMode;
jtog_inLoop		= 0;
jtog_walkTime		= _walkTime;
jtog_numOfWay		= _waypoints;
publicVariable "jtog_markerNames";
publicVariable "jtog_blackList";
publicVariable "jtog_hearing";
publicVariable "jtog_maxAI";
publicVariable "jtog_AIMode";
publicVariable "jtog_inLoop";
publicVariable "jtog_walkTime";
publicVariable "jtog_numOfWay";

//Give feedback if its done!
if(jtog_debug == 1) then { systemChat "JTOG-#RBU IS NOW READY TO GO STEIL!!" };
