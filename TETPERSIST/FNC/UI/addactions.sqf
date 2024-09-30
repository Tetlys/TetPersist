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


// TEMPORARY - Change to ace actions

// Change to ace actions to make life ez

_loadAction = player addAction [
    "<t color='#00FF00'>Load Data</t>",          // Green text for the action
    {
        [] remoteExecCall ["persist_db_fnc_load", 2];  // Remote execute on the server (2 is for the server)
    },
    nil,  // No arguments passed
    6,    // Priority (adjust as needed)
    true, // Always available to admins
    true, // Available when in range (change to false if proximity restrictions are desired)
    "serverCommandAvailable '#kick'",  // Condition: Only visible to admins
    ""    // Code when the action is removed
];

_saveAction = player addAction [
    "<t color='#FFFF00'>Save Data</t>",          // Yellow text for the action
    {
        [] remoteExecCall ["persist_db_fnc_save", 2];  // Remote execute on the server
    },
    nil,
    6,
    true,
    true,
    "serverCommandAvailable '#kick'",  // Condition: Only visible to admins
    ""
];

_deleteAction = player addAction [
    "<t color='#FF0000'>Delete Data</t>",        // Red text for the action
    {
        [] remoteExecCall ["persist_db_fnc_delete", 2];  // Remote execute on the server
    },
    nil,
    6,
    true,
    true,
    "serverCommandAvailable '#kick'",  // Condition: Only visible to admins
    ""
];

