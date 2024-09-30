/* ----------------------------------------------------------------------------
Function: persist_slot_fnc_serialize

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
    ["_unit", objNull, [objNull]]
];

if (
    isNil {_unit getVariable "tet_slot_key"}
) exitWith {};

private _loadout = getUnitLoadout _unit;

if (_unit call ace_hearing_fnc_hasEarPlugsIn && {!((_loadout select 3) isEqualTo [])}) then {
    ((_loadout select 3) select 1) pushBack ["ACE_EarPlugs", 1];
};

private _data = [
    getPosASL _unit,
    getDir _unit,
    _loadout,
    getForcedFlagTexture _unit,
    [_unit] call ace_medical_fnc_serializeState,
    vehicle _unit,
    [
        _unit getVariable ["acex_field_rations_thirst", 0],
        _unit getVariable ["acex_field_rations_hunger", 0]
    ]
];

persist_slots_serialized set [_unit getVariable ["tet_slot_key", [0, 0, 0]], _data];
