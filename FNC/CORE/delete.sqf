/* ----------------------------------------------------------------------------
Function: persist_db_fnc_delete

Description:
    clears the DB for a set world from namespacevariable

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
    ["_showHint", true, [true]],
    ["_name", worldName, [""]]
];

profileNamespace setVariable [format ["TET_%1_vehs", _name], nil];
profileNamespace setVariable [format ["TET_%1_objs", _name], nil];
profileNamespace setVariable [format ["TET_%1_slots", _name], nil];
profileNamespace setVariable [format ["TET_%1_markers", _name], nil];
profileNamespace setVariable [format ["TET_%1_db", _name], nil];

saveProfileNamespace;

if (_showHint) then {
    ["DELETE"] remoteExecCall ["persist_ui_fnc_hint", 0];
};