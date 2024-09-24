enableSaving [false, false];

if (!isDedicated && hasInterface) then {
    [] call compileScript ["TETPERSIST\player.sqf"];
};

if (isServer) then {
    [] call compileScript ["TETPERSIST\server.sqf"];
};