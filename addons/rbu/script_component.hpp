#define COMPONENT rbu
// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX y
#define PREFIX jtog

#define MAJOR 2
#define MINOR 0
#define PATCHLVL 0
#define BUILD 0

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.54

#ifdef DEBUG_ENABLED_RBU
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_RBU
    #define DEBUG_SETTINGS DEBUG_ENABLED_RBU
#endif

//Custom RBU defines
#define JTOG_LOG(x) systemChat format["DEBUG-LOG: %1", x]
#define JTOG_LOG_ARG1(x, arg1) systemChat format["DEBUG-LOG: %1 Arg: ", x. arg1] 

#include "\z\ace\addons\main\script_macros.hpp"
