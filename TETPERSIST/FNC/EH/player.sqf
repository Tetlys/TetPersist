/* ----------------------------------------------------------------------------
Function: persist_eh_fnc_Player

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

params [
    ["_player", objNull, [objNull]]
];

/*
{
    _x addEventHandler ["CuratorObjectPlaced", btc_eh_fnc_CuratorObjectPlaced];
} forEach allCurators;
*/

// Save state on vehicle change
_player addEventHandler ["GetInMan", {_this remoteExecCall ["btc_slot_fnc_serializeState", 2]}];
_player addEventHandler ["GetOutMan", {_this remoteExecCall ["btc_slot_fnc_serializeState", 2];}];

// Save statics
_player addEventHandler ["WeaponAssembled", {
    params ["_player", "_static"];
    if !(_static isKindOf "StaticWeapon") exitWith {_this};
    [_static] remoteExecCall ["persist_obj_fnc_init", 2];
}];

// Save ace statics
["ace_csw_deployWeaponSucceeded", {
    _this remoteExecCall ["persist_obj_fnc_init", 2];
}] call CBA_fnc_addEventHandler;

// Save marker flags
["ace_marker_flags_placed", {
    params ["_unit", "_flag"];
    _flag remoteExecCall ["persist_obj_fnc_init", 2];
}] call CBA_fnc_addEventHandler; 

// Respawn
["ace_killed", {
    params ["_unit"];
    if (_unit isNotEqualTo player) exitWith {};
    if (isObjectHidden player) exitWith {};
    if !(isServer) then { // Don't add twice the event in player host
        ["tet_respawn_player", [_unit, player]] call CBA_fnc_localEvent;
    };
    ["tet_respawn_player", [_unit, player]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;