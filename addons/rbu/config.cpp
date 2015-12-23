#include "script_component.hpp"
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
		 requiredVersion = REQUIRED_VERSION;
		 requiredAddons[] = {
			 "a3_modules_f",
			 "cba_ai",
			 "cba_events"
		 };
		 version 	= VERSION;
		 author[] 	= {"flaver"};
		 authorUrl 	= "https://github.com/flaver12";
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

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
