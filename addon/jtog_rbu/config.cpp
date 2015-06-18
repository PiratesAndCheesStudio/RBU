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
			"cba_ai",
			"cba_events"
		};
		version 	= "0.0.4";
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
			file = "\jtog_rbu\functions";
			class initRBU;
			class hanldeAI;
			class createWaypoint;
			class sendAI;
			class checkSendedAI;
			class resetAI;
			class checkWeapon;
			class checkAmmo;
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

	#include "module.hpp"

};

