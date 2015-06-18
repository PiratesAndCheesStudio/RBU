
//Create a new module
class jtog_ModuleRBUSupport: Module_F {
	author 		= "flaver";
	category  	= "JTOG";
	displayName	= "#RUNSBYUS SUPPORT";
	function 	= "jtog_rbu_support_fnc_initSupport";
	scope		= 2;
	isGlobal	= 1;

	class Arguments {

		class PositionToDrive {
				displayName = "Position";
				description = "Where they drive to";
				typeName = "STRING";
				defaultValue = "";
		        
			};

	};

};