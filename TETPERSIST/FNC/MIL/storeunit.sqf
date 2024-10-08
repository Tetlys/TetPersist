/* ----------------------------------------------------------------------------
Function: persist_mil_fnc_store

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
    ["_unit", objNull, [objNull]]
];

private _data = [];
_data pushBack (typeOf _unit);
_data pushBack (getPosASL _unit);
_data pushBack (getDir _unit);
_data pushback (group _unit);

_data