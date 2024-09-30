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


