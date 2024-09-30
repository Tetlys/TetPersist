/* ----------------------------------------------------------------------------
Function: persist_db_fnc_LoadCargo

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

[{
    params ["_obj", "_cargo", "_inventory"];

    //handle cargo
    {
        _x params ["_type", "", "_inventory",
            ["_turretMagazines", [], [[]]],
            ["_customName", "", [""]],
            ["_properties", [], [[]]]
        ];

        private _l = createVehicle [_type, getPosATL _obj, [], 0, "CAN_COLLIDE"];
        [_l] call persist_obj_fnc_init;
        private _isloaded = [_l, _obj, false] call ace_cargo_fnc_loadItem;

        [_l, _inventory] call persist_obj_fnc_invSet;

        if (_turretMagazines isNotEqualTo []) then {
            [_l, _turretMagazines] call persist_db_fnc_setTurretMagazines;
        };

        if (_customName isNotEqualTo "") then {
            _l setVariable ["ace_cargo_customName", _customName, true];
        };

        if (unitIsUAV _l) then {
            createVehicleCrew _l;
        };

        if (_properties isNotEqualTo []) then {
            ([_l] + _properties) call persist_veh_fnc_propertiesSet;
        };

    } forEach _cargo;

    //set inventory content for weapons, magazines and items
    [_obj, _inventory] call persist_obj_fnc_invSet;
}, _this] call CBA_fnc_execNextFrame;
