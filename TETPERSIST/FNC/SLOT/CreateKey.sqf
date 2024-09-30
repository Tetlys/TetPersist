/* ----------------------------------------------------------------------------
Function: persist_slot_fnc_CreateKey

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

private _key = position _player;
_key pushBack getPlayerUID _player;

_player setVariable ["tet_slot_key", _key];

_key