/* ----------------------------------------------------------------------------
Function: persist_obj_fnc_invGet

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
	Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull, ""]]
];

private _inventory = [];
if (_object isEqualType objNull) then {
    private _everyContainer = everyContainer _object;
    {
        _x set [1, (_x select 1) call persist_obj_fnc_invGet];
    } forEach _everyContainer;

    private _weaponsItemsCargo = weaponsItemsCargo _object;
    {
    private _magazine = _x select 4 select 0;
    } forEach _weaponsItemsCargo;

    _inventory = [
        getMagazineCargo _object,
        _weaponsItemsCargo,
        itemCargo _object,
        _everyContainer
    ]
} else {
    private _cfgVehicles = configFile >> "CfgVehicles" >> _object;
    private _cfgs = "true" configClasses (_cfgVehicles >> "TransportMagazines");
    private _magazine = _cfgs apply {
        getText (_x >> "magazine")
    };
    private _numberOfItems = _cfgs apply {
        getNumber (_x >> "count")
    };
    _inventory pushBack [_magazine, _numberOfItems];

    private _cfgs = "true" configClasses (_cfgVehicles >> "TransportWeapons");
    private _weapons = _cfgs apply {
        getText (_x >> "weapon")
    };
    private _numberOfItems = _cfgs apply {
        getNumber (_x >> "count")
    };
    private _itemCargo = [];
    {
        for "_i" from 0 to (_x -1) do {
            _itemCargo pushBack [_weapons select _forEachindex,"","","",[],[],""];
        };
    } forEach _numberOfItems;
    _inventory pushBack _itemCargo;

    private _cfgs = "true" configClasses (_cfgVehicles >> "TransportItems");
    private _items = _cfgs apply {
        getText (_x >> "name")
    };
    private _numberOfItems = _cfgs apply {
        getNumber (_x >> "count")
    };
    private _itemCargo = [];
    {
        for "_i" from 0 to (_x -1) do {
            _itemCargo pushBack (_items select _forEachindex);
        };
    } forEach _numberOfItems;
    _inventory pushBack _itemCargo;

    private _cfgs = "true" configClasses (_cfgVehicles >> "TransportBackpacks");
    private _backpacks = _cfgs apply {
        getText (_x >> "backpack")
    };
    private _numberOfItems = _cfgs apply {
        getNumber (_x >> "count")
    };
    {
        for "_i" from 0 to (_x -1) do {
            _itemCargo pushBack [_backpacks select _forEachindex];
        };
    } forEach _numberOfItems;
    _inventory pushBack _backpacks;
};

_inventory