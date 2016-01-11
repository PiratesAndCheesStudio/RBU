class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

//Add eventhandler for fired
class Extended_FiredBIS_EventHandlers {
    class CAManBase {
        class jtog_rbu {
            firedBIS = "_this call jtog_rbu_fnc_fired;"
        };
    };
};
