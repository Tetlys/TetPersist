/* ----------------------------------------------------------------------------
Function: persist_veh_fnc_createVehicle

Description:
    Creates an empty vehicle/object of given classname type.

Parameters:
	FILL ME

Returns:
	FILL ME

Examples:
	FILL ME

Author:
    Tetlys
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_type", "", [""]],
    ["_pos", [0, 0, 0], [[]]],
    ["_dir", 0, [0]],
    ["_customization", [false, false], [[]]],
    ["_isMedicalVehicle", false, [true]],
    ["_isRepairVehicle", false, [true]],
    ["_fuelSource", [], [[]]],
    ["_pylons", [], [[]]],
    ["_supplyVehicle", [], [[]]],
    ["_objectTexture", [], [[]]],
    ["_EDENinventory", [], [[]]],
    ["_allHitPointsDamage", [], [[]]],
    ["_flagTexture", "", [""]]
];

private _veh  = createVehicle [_type, ASLToATL _pos, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;
_veh setPosASL _pos;

[_veh, _customization, _isMedicalVehicle, _isRepairVehicle, _fuelSource, _pylons, _supplyVehicle, _objectTexture] call persist_veh_fnc_propertiesSet;
if (_EDENinventory isNotEqualTo []) then {
    _veh setVariable ["tet_EDENinventory", _EDENinventory];
    [_veh, _EDENinventory] call persist_obj_fnc_invSet;
};

if (unitIsUAV _veh) then {
    createVehicleCrew _veh;
};



//Remove Item inv
clearItemCargoGlobal _veh;

if (_allHitPointsDamage isNotEqualTo []) then {
    {//Disable explosion effect on vehicle creation
        [_veh, _forEachindex, _x, false] call ace_repair_fnc_setHitPointDamage;
    } forEach (_allHitPointsDamage select 2);
    if ((_allHitPointsDamage select 2) select {_x < 1} isEqualTo []) then {
        _veh setDamage [1, false];
    };
};

if (_flagTexture isNotEqualTo "") then {
    _veh forceFlagTexture _flagTexture;
};

if (_tagTexture isNotEqualTo "") then {
    [objNull, [], _tagTexture, _veh, objNull, "", "", true] call ace_tagging_fnc_createTag;
};

_veh call persist_veh_fnc_add;
_veh
 