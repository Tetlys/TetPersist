/* ----------------------------------------------------------------------------
Function: persist_db_fnc_SaveObjStatus

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
    ["_object", objNull, [objNull]]
];

private _data = [];
_data pushBack (typeOf _object);
_data pushBack (getPosASL _object);
_data pushBack (getDir _object);
_data pushBack "";
private _cargo = (_object getVariable ["ace_cargo_loaded", []]) apply {
    if (_x isEqualType "") then {
        [_x, nil, [[], [], []]]
    } else {
        [
            typeOf _x,
            nil,
            _x call persist_obj_fnc_invGet,
            magazinesAllTurrets _x,
            _x getVariable ["ace_cargo_customName", ""],
            [_x] call persist_veh_fnc_propertiesGet
        ]
    };    
};
_data pushBack _cargo;
_data pushBack (_object call persist_obj_fnc_invGet);
_data pushBack [vectorDir _object, vectorUp _object];
_data pushBack (getForcedFlagTexture _object);
_data pushBack (magazinesAllTurrets _object);
_data pushBack (_object getVariable ["ace_cargo_customName", ""]);
_data pushBack ([_object] call persist_veh_fnc_propertiesGet);

_data
