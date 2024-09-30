// INIT PLAYER

[{!isNull player}, {

// CORE 
persist_respawn_marker setMarkerPosLocal player;

// DISABLE BLUEFOR ENEMY
player addRating 9999;

// ASSET MARKERS
execVM "TETPERSIST\FNC\UI\empty_vehicles_marker.sqf";

// ACTIONS
[] call persist_ui_fnc_actions;

// EH 
[player] call persist_eh_fnc_Player;

}] call CBA_fnc_waitUntilAndExecute;

{
    _x addEventHandler ["CuratorObjectPlaced", persist_eh_fnc_ObjectPlaced];
} forEach allCurators;


// TEMPORARY

_loadAction = player addAction [
    "<t color='#00FF00'>Load Data</t>",          // Green text for the action
    {
        [] call persist_db_fnc_load;
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
        [] call persist_db_fnc_save;
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
        [] call persist_db_fnc_delete;
    },
    nil,
    6,
    true,
    true,
    "serverCommandAvailable '#kick'",  // Condition: Only visible to admins
    ""
];

