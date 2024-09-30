/* ----------------------------------------------------------------------------
Function: persist_db_fnc_load

Description:
    Loads the DB from namespacevariable

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
    ["_name", worldName, [""]]
];

// CLEAR LAYERS
{deleteVehicle _x} forEach (getMissionLayerEntities "persist_save_vehicles" select 0);
if !(isNil "persist_save_vehicles") then {
    {deleteVehicle _x} forEach persist_save_vehicles;
    persist_save_vehicles = [];
};
publicVariable "persist_save_vehicles";

// OBJECTS
private _objs = +(profileNamespace getVariable [format ["TET_%1_objs", _name], []]);
[{
    {
        [_x] call persist_db_fnc_LoadObjStatus;
    } forEach _this;
}, _objs] call CBA_fnc_execNextFrame;

// VEHICLES
private _vehs = +(profileNamespace getVariable [format ["TET_%1_vehs", _name], []]);
[{
    private _loadVehicle = {
        params [
            "_veh_type",
            "_veh_pos",
            "_veh_dir",
            "_veh_fuel",
            "_veh_AllHitPointsDamage",
            "_veh_cargo",
            "_veh_inventory",
            "_customization",
            ["_isMedicalVehicle", false, [false]],
            ["_isRepairVehicle", false, [false]],
            ["_fuelSource", [], [[]]],
            ["_pylons", [], [[]]],
            ["_isContaminated", false, [false]],
            ["_supplyVehicle", [], [[]]],
            ["_objectTexture", [], [[]]],
            ["_EDENinventory", [], [[]]],
            ["_vectorPos", [], [[]]],
            ["_ViV", [], [[]]],
            ["_flagTexture", "", [""]],
            ["_turretMagazines", [], [[]]],
            ["_tagTexture", "", [""]]
        ];

        private _veh = [_veh_type, _veh_pos, _veh_dir, _customization, _isMedicalVehicle, _isRepairVehicle, _fuelSource, _pylons, _supplyVehicle, _objectTexture, _EDENinventory, _veh_AllHitPointsDamage, _flagTexture, _tagTexture] call persist_veh_fnc_createVehicle;
        _veh setVectorDirAndUp _vectorPos;
        _veh setFuel _veh_fuel;

        [_veh, _turretMagazines] call persist_db_fnc_setTurretMagazines;

        [_veh, _veh_cargo, _veh_inventory] call persist_db_fnc_LoadCargo;

        if (_ViV isNotEqualTo []) then {
            //{
                //private _vehToLoad = _x call _loadVehicle;
                //if !([_vehToLoad, _veh] call btc_tow_fnc_ViV) then {
                //    //_vehToLoad setVehiclePosition [_veh, [], 100, "NONE"];
                //    private _marker = _vehToLoad getVariable ["marker", ""];
                //    if (_marker isNotEqualTo "") then {
                //        _marker setMarkerPos _vehToLoad;
                //   };
                //};
            //} forEach _ViV;
        };

        _veh
    };
    {
        _x call _loadVehicle;
    } forEach _this;
}, _vehs] call CBA_fnc_execNextFrame;

// SLOTS
private _slots_serialized = +(profileNamespace getVariable [format ["TET_%1_slots", _name], createHashMap]);
[{
    {
        if (_y isEqualTo []) then {continue};
        private _objtClass = _y select 6;
        if (_objtClass isEqualTo "") then {
            _objtClass = objNull;
        } else {
            _objtClass = nearestObject [ASLToATL (_y select 0), _objtClass];
        };
        _y set [6, _objtClass];
    } forEach _this;
}, _slots_serialized] call CBA_fnc_execNextFrame;
persist_slots_serialized = _slots_serialized;

// MARKERS 
private _markers_properties = +(profileNamespace getVariable [format ["TET_%1_markers", _name], []]);
{
    _x params ["_markerText", "_markerPos", "_markerColor", "_markerType", "_markerSize", "_markerAlpha", "_markerBrush", "_markerDir", "_markerShape",
        ["_markerPolyline", [], [[]]],
        ["_markerChannel", 0, [0]]
    ];

    private _marker = createMarker [format ["_USER_DEFINED #0/%1/%2", _forEachindex, _markerChannel], _markerPos, _markerChannel];
    _marker setMarkerText _markerText;
    _marker setMarkerColor _markerColor;
    _marker setMarkerType _markerType;
    _marker setMarkerSize _markerSize;
    _marker setMarkerAlpha _markerAlpha;
    _marker setMarkerBrush _markerBrush;
    _marker setMarkerDir _markerDir;

    _marker setMarkerShape _markerShape;
    if (_markerPolyline isNotEqualTo []) then {
        _marker setMarkerPolyline _markerPolyline;
    };
} forEach _markers_properties;