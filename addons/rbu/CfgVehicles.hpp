
//Define the module
class CfgVehicles {

	//Wrapper for base module
	class Module_F;

	//Create a new module
	class jtog_ModuleRBU: Module_F {
		author 		  = "flaver";
		category  	= "JTOG";
		displayName	= "#RUNSBYUS INIT";
		function 	  = QFUNC(module);
		scope		    = 2;
		isGlobal	  = 1;

		class Arguments {

			class enabled {
				displayName = "Enabled";
				description = "";
				typeName 	= "BOOL";
				defaultValue = 0;
			};

			//Class for marker name
			class MarkerName {
				displayName = "Markername/s";
				description = "Name of the marker/s in a array";
				typeName = "STRING";
				defaultValue = "";
			};

			//Class for marker name
			class BlacklistAI {
				displayName = "Blacklist of AIs";
				description = "Names of AIs that not will be used for group";
				typeName = "STRING";
				defaultValue = "";
			};

			//Class for marker name
			class BlacklistAIGroups {
				displayName = "Blacklist of AI groups";
				description = "Just type the names of the group in the array and they will not be used";
				typeName = "STRING";
				defaultValue = "";
			};


			//Class for Radius of hearing
			class Hearingrange {
				displayName = "Hearingrange of AI";
				description = "In wich radius will the AI able to hear your shoots(in meters)";
				typeName 	= "NUMBER";
				defaultValue = 500;
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
				description 	= "How long the ai will patrol(On cycle is 10 Seconds)";
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
				typeName 	= "BOOL";
				defaultValue = 0;
			};
		};
	};
};
