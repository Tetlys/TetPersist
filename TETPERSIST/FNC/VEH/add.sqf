/* ----------------------------------------------------------------------------
Function: persist_veh_fnc_add

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
    ["_veh", objNull, [objNull]]
];

if (isNil "persist_save_vehicles") then {
    persist_save_vehicles = [];
};
if (isNil {_veh getVariable "tet_EDENinventory"}) then {
    _veh setVariable ["tet_EDENinventory", _veh call persist_obj_fnc_invGet];
};

[{ace_common_settingsInitFinished}, {
    if (isNull _this) exitwith {};
    if (isNil {_this getVariable "tet_EDEN_defaultFuelCargo"}) then {
        _this setVariable ["tet_EDEN_defaultFuelCargo", _this call ace_refuel_fnc_getFuel, true];
    };
    if (isNil {_this getVariable "tet_EDEN_defaultSupply"}) then {
        _this setVariable ["tet_EDEN_defaultSupply", _this call ace_rearm_fnc_getSupplyCount, true];
    };
}, _veh] call CBA_fnc_waitUntilAndExecute;

if (persist_save_vehicles pushBackUnique _veh isEqualTo -1) exitWith {
};
publicVariable "persist_save_vehicles";

{
    _x addCuratorEditableObjects [[_veh], false];
} forEach allCurators;

if ((isNumber (configOf _veh >> "ace_fastroping_enabled")) && (typeOf _veh isNotEqualTo "RHS_UH1Y_d")) then {
    [_veh] call ace_fastroping_fnc_equipFRIES
};


