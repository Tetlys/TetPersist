/* ----------------------------------------------------------------------------
Function: persist_ui_fnc_hint

Description:
    Show CBA_fnc_notify using a given text signal

Parameters:
	FILL ME

Returns:
	FILL ME

Examples:
	FILL ME

Author:
    Tetlys

---------------------------------------------------------------------------- */

if (isDedicated) exitWith {};

params [
    ["_type", "", [""]],
    ["_custom", 0, [0, "", []]]
];

private _text = switch (_type) do {
	case "SAVE_START" : {
		"Started Saving - Please wait...."
	};
	case "SAVE_END" : {
		"Saving Complete!"
	};
	case "DELETE" : {
		"Database Deleted"
	};
	case "LOAD_FAIL" : {
		"Failed to locate save!"
	};
};

_text call CBA_fnc_notify;