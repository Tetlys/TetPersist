/* ----------------------------------------------------------------------------
Function: persist_slot_fnc_Deserialize_S

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
    ["_player", objNull, [objNull]],
    ["_key", "", ["", []]]
];

private _data = persist_slots_serialized getOrDefault [_key, []];
if (_data isEqualTo []) exitWith {};
_data remoteExecCall ["persist_slot_fnc_Deserialize", _player];