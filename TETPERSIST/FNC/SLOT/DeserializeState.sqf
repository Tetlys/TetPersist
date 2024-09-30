/* ----------------------------------------------------------------------------
Function: persist_slot_fnc_Deserialize

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

[{!isNull player}, {
    params [
        "_previousPos",
        "_dir",
        "_loadout",
        "_flagTexture",
        "_medicalDeserializeState",
        ["_vehicle", objNull, [objNull]],
        ["_field_rations", [], [[]]]
    ];

	[{player setUnitLoadout _this;}, _loadout] call CBA_fnc_execNextFrame;

    if ((isNull _vehicle) || {!(player moveInAny _vehicle)}) then {
        player setPosASL _previousPos;
    };
    player setDir _dir;
    player forceFlagTexture _flagTexture;
    [{player getVariable ["ace_medical_initialized", false]}, {
        [player, _this] call ace_medical_fnc_deserializeState;
    }, _medicalDeserializeState] call CBA_fnc_waitUntilAndExecute;

    _field_rations params [["_thirst", 0, [0]], ["_hunger", 0, [0]]];
    player setVariable ["acex_field_rations_thirst", _thirst];
    player setVariable ["acex_field_rations_hunger", _hunger];

}, _this] call CBA_fnc_waitUntilAndExecute;