// INIT SERVER

if (profileNamespace getVariable [format ["TET_%1_db", worldName], false]) then {
//[] call compileScript ["TETPERSIST\FNC\CORE\delete.sqf"];
[] call compileScript ["TETPERSIST\FNC\CORE\load.sqf"];
} else {
    {
        _x call persist_veh_fnc_add;
    } forEach (getMissionLayerEntities "persist_save_vehicles" select 0);
        if (isNil "persist_save_vehicles") then {persist_save_vehicles = [];};
    {
        _x call persist_obj_fnc_init;
    } forEach (getMissionLayerEntities "persist_save_objects" select 0);
        if (isNil "persist_save_objects") then {persist_save_objects = [];};
    {
        _x call persist_mil_fnc_add;
    } forEach (getMissionLayerEntities "Persist_save_units" select 0);
        if (isNil "Persist_save_units") then {Persist_save_units = [];};

};

[] call persist_eh_fnc_server;