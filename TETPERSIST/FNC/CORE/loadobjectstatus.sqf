/* ----------------------------------------------------------------------------
Function: persist_db_fnc_LoadObjStatus

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
    ["_object_data", [], [[]]]
];
_object_data params [
    "_type",
    "_pos",
    "_dir",
    "",
    "_cargo",
    "_inventory",
    "_vectorPos",
    ["_flagTexture", "", [""]],
    ["_turretMagazines", [], [[]]],
    ["_properties", [], [[]]]
];

private _obj = createVehicle [_type, ASLToATL _pos, [], 0, "CAN_COLLIDE"];

_obj setDir _dir;
_obj setPosASL _pos;
_obj setVectorDirAndUp _vectorPos;

if (unitIsUAV _obj) then {
    createVehicleCrew _obj;
};
if (_flagTexture isNotEqualTo "") then {
    _obj forceFlagTexture _flagTexture;
};

if (_turretMagazines isNotEqualTo []) then {
    [_obj, _turretMagazines] call persist_db_fnc_setTurretMagazines;
};

if (_properties isNotEqualTo []) then {
    ([_obj] + _properties) call persist_veh_fnc_propertiesSet;
};

[_obj] call persist_obj_fnc_init;
[_obj, _cargo, _inventory] call persist_db_fnc_LoadCargo;
