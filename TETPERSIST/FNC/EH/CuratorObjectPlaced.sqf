/* ----------------------------------------------------------------------------
Function: persist_eh_fnc_ObjectPlaced

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
    ["_curator", objNull, [objNull]],
    ["_object_placed", objNull, [objNull]]
];

if !((_object_placed isKindOf "allVehicles") || (_object_placed isKindOf "Module_F")) then {
    [_object_placed] remoteExecCall ["persist_obj_fnc_init", 2];
};

if (!(_object_placed isKindOf "Module_F") && (_object_placed isKindOf "allVehicles")) then { // Needs a filter for crew count.
    [_object_placed] remoteExecCall ["persist_veh_fnc_add", 2];
};