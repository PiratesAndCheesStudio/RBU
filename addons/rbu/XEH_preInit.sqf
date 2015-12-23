#include "script_component.hpp"

ADDON = false;

PREP(module);
PREP(fired);
PREP(checkWeapon);

ADDON = true;

if (isNil QGVAR(enabled)) then {
    GVAR(enabled) = false;
};

//Define blacklist of AI
GVAR(unitBlacklist) = [
    "B_soldier_M_F",
    "B_Sharpshooter_F",
    "B_Recon_Sharpshooter_F",
    "B_recon_M_F",
    "B_spotter_F",
    "B_sniper_F",
    "B_ghillie_ard_F",
    "B_ghillie_sard_F",
    "B_ghillie_lsh_F",
    "B_MU_CTRG_M_F",
    "B_MU_CTRG_M_Mk18_F",
    "B_MU_CTRG_sniper_F",
    "B_MU_CTRG_spotter_F",
    "B_G_Soldier_M_F",
    "B_G_Sharpshooter_F",
    "O_Sharpshooter_F",
    "O_soldier_M_F",
    "O_recon_M_F",
    "O_soldier_M_F",
    "O_soldierU_M_F",
    "O_Urban_Sharpshooter_F",
    "CAF_AG_EEUR_R_SVD",
    "CAF_AG_ME_T_SVD",
    "O_MU_islam_M_F",
    "CAF_AG_AFR_P_SVD",
    "ibr_mol_soldier_sniper",
    "I_Soldier_M_F",
    "I_Spotter_F",
    "I_Sniper_F",
    "I_ghillie_ard_F",
    "I_ghillie_sard_F",
    "I_ghillie_lsh_F"
];
