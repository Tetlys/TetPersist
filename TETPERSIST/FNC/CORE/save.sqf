/* ----------------------------------------------------------------------------
Function: persist_db_fnc_save

Description:
    Saves the DB to namespacevariable

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


["SAVE_START"] remoteExecCall ["persist_ui_fnc_hint", 0];

[false] call persist_db_fnc_delete;

{{moveout _x} foreach crew _x} foreach persist_save_vehicles;

// VEHICLES 
private _array_veh = [];
private _vehicles = persist_save_vehicles - [objNull];
private _vehiclesNotInCargo = _vehicles select {
    isNull isVehicleCargo _x &&
    {isNull isVehicleCargo attachedTo _x}
};
private _vehiclesInCargo = _vehicles - _vehiclesNotInCargo;

{
    (_x call persist_db_fnc_SaveObjStatus) params [
        "_type", "_pos", "_dir", "", "_cargo",
        "_inventory", "_vectorPos",
        ["_flagTexture", "", [""]],
        ["_turretMagazines", [], [[]]],
        ["_properties", [], [[]]]
    ];

    private _data = [];
    _data pushBack _type;
    _data pushBack _pos;
    _data pushBack _dir;
    _data pushBack (fuel _x);
    _data pushBack (getAllHitPointsDamage _x);
    _data pushBack _cargo;
    _data pushBack _inventory;
    _data append ([_x] call persist_veh_fnc_propertiesGet);
    _data pushBack (_x getVariable ["tet_EDENinventory", []]);
    _data pushBack _vectorPos;
    _data pushBack []; // ViV
    _data pushBack _flagTexture;
    _data pushBack _turretMagazines;
    _data pushBack _properties;

    private _fakeViV = isVehicleCargo attachedTo _x;
    if (
        isNull _fakeViV &&
        {isNull isVehicleCargo _x}
    ) then {
         _array_veh pushBack _data;
    } else {
        private _vehicleCargo = if (isNull _fakeViV) then {
            isVehicleCargo _x
        } else {
            _fakeViV
        };
        private _index = _vehiclesNotInCargo find _vehicleCargo;
        ((_array_veh select _index) select 17) pushBack _data;
    };

} forEach (_vehiclesNotInCargo + _vehiclesInCargo);
profileNamespace setVariable [format ["TET_%1_vehs", _name], +_array_veh];


//OBJECTS
private _array_obj = [];
{
    if !(!alive _x || isNull _x) then {
        private _data = [_x] call persist_db_fnc_SaveObjStatus;
        _array_obj pushBack _data;
    };
} forEach (persist_save_objects select {
    !(isObjectHidden _x) &&
    isNull objectParent _x &&
    isNull isVehicleCargo _x
});
profileNamespace setVariable [format ["TET_%1_objs", _name], +_array_obj];


// SLOTS 
{
    if (alive _x) then {
        _x call persist_slot_fnc_serialize;
    };
} forEach (allPlayers - entities "HeadlessClient_F");
private _slots_serialized = +persist_slots_serialized;
{
    if (_y isEqualTo []) then {continue};
    private _vehicle = _y select 5;
    if !(isNull _vehicle) then {
        _y set [0, getPosASL _vehicle];
    };
    _y set [5, typeOf _vehicle];
} forEach _slots_serialized;
profileNamespace setVariable [format ["TET_%1_slots", _name], +_slots_serialized];

// MIL
private _array_units = [];
{
    if !(!alive _x || isNull _x) then {
        private _data = [_x] call persist_mil_fnc_storeunit;
        _array_units pushBack _data;
    };
} forEach (Persist_save_units select {
    !(isObjectHidden _x) &&
    isNull objectParent _x
});
profileNamespace setVariable [format ["TET_%1_units", _name], +_array_units];


// MARKERS 
private _player_markers = allMapMarkers select {"_USER_DEFINED" in _x};
private _markers_properties = _player_markers apply {
    [markerText _x, markerPos _x, markerColor _x, markerType _x, markerSize _x, markerAlpha _x, markerBrush _x, markerDir _x, markerShape _x, markerPolyline _x, markerChannel _x]
};
profileNamespace setVariable [format ["TET_%1_markers", _name], +_markers_properties];


// SAVE
profileNamespace setVariable [format ["TET_%1_db", _name], true];
saveProfileNamespace;

["SAVE_END"] remoteExecCall ["persist_ui_fnc_hint", 0];