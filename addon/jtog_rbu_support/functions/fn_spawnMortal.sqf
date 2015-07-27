//Spawns a mortal position

private ['_pos', '_unit'];

_pos = _this select 0;
_unit = _this select 1;

_unit playMove "ActsPercSnonWnonDnon_carFixing2";
sleep 30;
_veh = "B_Mortar_01_F" createVehicle _pos;
_veh setVehicleAmmo 0;