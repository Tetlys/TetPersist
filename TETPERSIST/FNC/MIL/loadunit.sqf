/* ----------------------------------------------------------------------------
Function: persist_mil_fnc_load

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
    ["_unit_data", [], [[]]]
];
_unit_data params [
    "_type",
    "_pos",
    "_dir",
	"_group"
];

private _unit = _group createunit [_type, ASLToATL _pos, [], 0, "NONE"];

_unit setDir _dir;
_unit setPosASL _pos;

[_unit] call persist_mil_fnc_addunit;