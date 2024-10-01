/* ----------------------------------------------------------------------------
Function: persist_ui_fnc_actions

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


//Database
private _action = ["Database", "Database", "\A3\ui_f\data\igui\cfg\simpleTasks\letters\D_ca.paa", {}, {(call BIS_fnc_admin) == 2 || !isMultiplayer}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["request_save", "Save", "\A3\ui_f\data\igui\cfg\simpleTasks\types\download_ca.paa", {[] remoteExecCall ["persist_db_fnc_save", 2]}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Database"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["request_delete", "Delete", "\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa", {[] remoteExecCall ["persist_db_fnc_delete", 2]}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Database"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["request_load", "Load", "\A3\ui_f\data\igui\cfg\simpleTasks\types\upload_ca.paa", {[] remoteExecCall ["persist_db_fnc_load", 2]}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Database"], _action] call ace_interact_menu_fnc_addActionToObject;