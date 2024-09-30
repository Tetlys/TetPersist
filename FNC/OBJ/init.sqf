/* ----------------------------------------------------------------------------
Function: persist_obj_fnc_init

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
    ["_obj", objNull, [objNull]]
];

if (persist_save_objects pushBackUnique _obj isEqualTo -1) exitWith {};

{
    _x addCuratorEditableObjects [[_obj], false];
} forEach allCurators;

if (isNil {_obj getVariable "tet_EDEN_defaultFuelCargo"}) then {
    _obj setVariable ["tet_EDEN_defaultFuelCargo", _obj call ace_refuel_fnc_getFuel, true];
};
if (isNil {_obj getVariable "tet_EDEN_defaultSupply"}) then {
    _obj setVariable ["tet_EDEN_defaultSupply", _obj call ace_rearm_fnc_getSupplyCount, true];
};