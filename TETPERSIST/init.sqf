// MAIN INIT

enableSaving [false, false];

[] call compileScript ["TETPERSIST\FNC\Defines.sqf"];

if (!isDedicated && hasInterface) then {
    [] call compileScript ["TETPERSIST\player.sqf"];
};

if (isServer) then {
    [] call compileScript ["TETPERSIST\server.sqf"];
};