/* ----------------------------------------------------------------------------
Function: persist_mil_fnc_add

Description:
    \Adds individual units to the unit save array

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

if (isNil "Persist_save_units") then {
    Persist_save_units = [];
};

if (Persist_save_units pushBackUnique _unit isEqualTo -1) exitWith {
};
publicVariable "Persist_save_units";

{
    _x addCuratorEditableObjects [[_unit], false];
} forEach allCurators;