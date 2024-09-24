["btc_respawn_player", {
    params ["", "_player"];
    btc_slots_serialized set [
        _player getVariable ["btc_slot_key", [0, 0, 0]],
        [] // Reset serialized data if slot died
    ];
}] call CBA_fnc_addEventHandler;

addMissionEventHandler ["HandleDisconnect", {
    params ["_player"];
    if (_player in (entities "HeadlessClient_F")) then {
        deleteVehicle _player;
    };
    if (alive _player) then {
        _player call btc_slot_fnc_serializeState;
    };
    false
}];

["btc_playerConnected", { 
    params ["_player", "_ids"];
    [_player, _player call btc_slot_fnc_createKey, _ids select 4] call btc_slot_fnc_deserializeState_s;
}] call CBA_fnc_addEventHandler;