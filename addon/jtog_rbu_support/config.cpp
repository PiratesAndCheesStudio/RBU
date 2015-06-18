/**
 * @author flaver
 * @copyright flaver (c) 2015
 * @desc This is the config for the #RUNSBYUS AI mod
 */

//Patches class
 class CfgPatches {

 	//Config for the addon
	class jtog_rbu_support {
		units[] = {};
		requiredVersion = 0.60;
		requiredAddons[] = {
			"jtog_rbu"
		};
		version 	= "0.0.4";
		author[] 	= {"flaver"};
		authorUrl 	= "https://github.com/flaver12";
	};

};

//Defines all functions
class CfgFunctions {

	class jtog_rbu_support {

		class jtog_rbu_support {

			file = "\jtog_rbu_support\functions";
			class initSupport;
			class attachGear;
			class sendToPosition;
		};

	};

};

//Define the module
class CfgVehicles {

	//Wrapper for base module
	class Module_F;

	#include "module.hpp"

};

