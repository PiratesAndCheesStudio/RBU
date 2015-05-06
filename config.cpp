/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc This is the config for the #RUNSBYUS AI mod
 */

//Patches class
 class CfgPatches {

 	//Config for the addon
	class jtog_rbu {
		units[] = {};
		requiredVersion = 0.60;
		requiredAddons[] = {
			"a3_modules_f",
			"cba_ai"
		};
		version 	= "0.0.1";
		author[] 	= {"flaver"};
		authorUrl 	= "https://github.com/flaver12";
	};

};

//Defines all functions
class CfgFunctions {

	//Wrapper class for the functions
	class jtog_rbu {

		//Class how defines all functions as empty classes
		class jtog_rbu {
			file = "jtog_rbu\functions";
			class initRBU;
			class hanldeAI;
			class createWaypoint;
			class sendAI;
			class checkSendedAI;
			class resetAI;
			class checkWeapon;
		};

	};

};

//Define our own category
class CfgFactionClasses {

	//Set up for the category
	class JTOG {
		displayName="1st JTOG";
		priority = 0.1;
    	side = 7;
	};
};

//Define the module
class CfgVehicles {

	//Wrapper for base module
	class Module_F;

	//Create a new module
	class jtog_ModuleRBU: Module_F {
		author 		= "flaver";
		category  	= "JTOG";
		displayName	= "#RUNSBYUS INIT";
		function 	= "jtog_rbu_fnc_initRBU";
		scope		= 2;
		isGlobal	= 1;

		class Arguments {
			
			//Class for marker name
			class MarkerName {
				displayName = "Markername/s";
				description = "Name of the marker/s in a array";
				typeName = "STRING";
		        
		        class values {
		            default = "[]";
		        };
			};

			//Class for Radius of hearing
			class Hearingrange {
				displayName = "Hearingrange of AI";
				description = "In wich radius will the AI able to hear your shoots(in meters)";
				typeName 	= "NUMBER";
			};

			//Class for SearchRadius
			class SearchRadius {
				displayName 	= "Searchradius of the AI";
				description 	= "In wich radius they will search for the player(in meters)";
				typeName 		= "NUMBER";
				defaultValue 	= 200;
			};

			//Class for Number of ai who will go to take a look
			class NumberOfAI {
				displayName 	= "How many enemies";
				description 	= "How many enemies will go to take a look";
				typeName 		= "NUMBER";
				defaultValue 	= 3;
			};

			//Class how they react on fire
			class AIMode {
				displayName = "React enemies on fire";
				description = "How will the enemies react when they hear shoots";

				class values {

					class Easy {
						name = "Easy";
						value = "LIMITED";
						default = "LIMITED"; 
					};

					class Normal {
						name = "Normal";
						value = "NORMAL";
					};

					class Hard {
						name = "Hard";
						value = "FULL";
					};

				};
			};

			class MinutesForWalk {
				displayName 	= "Time they patrol";
				description 	= "How long the ai will patrol in seconds";
				typeName		= "NUMBER";
				defaultValue 	= 60;
			};

			//Class for number of waypoints
			class NumberOfWaypoints {
				displayName		= "Number of waypoints";
				description		= "How many numbers of waypoints will the ai have";
				typeName 		= "NUMBER";
				defaultValue	= 10;
			};

			//Class for debug infos
			class Debug {
				displayName = "Debug";
				description = "Will output some debug infos";
				typeName 	= "NUMBER";

				class values {

					class True {
						name = "True";
						value = 1;
						default = 1;

					};

					class False {
						name = "False";
						value = 0;
					};

				};

			};

		};

	};

};

