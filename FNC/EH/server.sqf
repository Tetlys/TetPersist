/* ----------------------------------------------------------------------------
Function: persist_eh_fnc_server

Description:
    FILL ME

Parameters:
	FILL ME

Returns:
	FILL ME

Examples:
	FILL ME

Author:
    Tetlys

---------------------------------------------------------------------------- */
// Respawn
["tet_respawn_player", {
    params ["", "_player"];
    [btc_rep_malus_player_respawn, _player] call btc_rep_fnc_change;
    _uid = getplayerUID _player;
    ["DEATH",_uid] call tet_ui_setdatascore;
    btc_slots_serialized set [
        _player getVariable ["btc_slot_key", [0, 0, 0]],
        [] // Reset serialized data if slot died
    ];
}] call CBA_fnc_addEventHandler;

// Connected
addMissionEventHandler ["PlayerConnected", persist_eh_fnc_PlayerConnected];

// Disconnected
addMissionEventHandler ["HandleDisconnect", {
    params ["_player"];
    if (_player in (entities "HeadlessClient_F")) then {
        deleteVehicle _player;
    };
    if (alive _player) then {
        _player call persist_slot_fnc_Deserialize;
    };
    false
}];

// Unconcious
["ace_unconscious", persist_slot_fnc_serialize] call CBA_fnc_addEventHandler;

// Connected Handle Keys
["btc_playerConnected", { 
    params ["_player", "_ids"];
    [_player, _player call persist_slot_fnc_CreateKey, _ids select 4] call persist_slot_fnc_Deserialize_S;
}] call CBA_fnc_addEventHandler;

// Save on empty
addMissionEventHandler ["HandleDisconnect", {
	if ((allPlayers - entities "HeadlessClient_F") isEqualTo []) then {
		[] call persist_slot_fnc_Deserialize_S;
	};
}];